import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' as g;
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Controllers/global-controller.dart';
import 'package:visitor_pass/config/locator/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init(
      environment: prod.name,
    );

@module
abstract class ServiceModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @factoryMethod
  GraphQLClient create() {
    // final url = "https://faithful-lynx-39.hasura.app/v1/graphql";//FODECC
    final url = "http://172.17.15.28:30011/v1/graphql"; //CNPS
    final authLink = AuthLink(getToken: () {
      String? token = g.Get.find<GlobalController>().bearerToken;
      return token == null ? null : token;
    });
    final HttpLink httpLink = HttpLink(
      url,
      defaultHeaders: {
        "x-hasura-admin-secret":
            // "cBUCi2wfVzpC5j16ede1stHx4nEajfTnWk0V43TRz3gVk0tGrXQ5VcILCqRJ0dkt"//FODECC
            "aFVeqGfcVsDTpS7efXQZ1rlMyIJugSBJ" //CNPS
      },
    );
    final Link httpLinkWithAuth = authLink.concat(httpLink);
    // final subscriptionUrl = url.replaceAll('https', 'wss');//FODECC
    final subscriptionUrl = url.replaceAll('http', 'ws'); //CNPS
    final websocketLink = WebSocketLink(
      subscriptionUrl,
      subProtocol: GraphQLProtocol.graphqlTransportWs,
      config: SocketClientConfig(
        initialPayload: () async {
          return {
            'headers': {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-hasura-admin-secret':
                  // "cBUCi2wfVzpC5j16ede1stHx4nEajfTnWk0V43TRz3gVk0tGrXQ5VcILCqRJ0dkt", //fodecc
                  "aFVeqGfcVsDTpS7efXQZ1rlMyIJugSBJ", //cnps
              'Authorization': g.Get.find<GlobalController>().bearerToken,
            }
          };
        },
      ),
    );
    final Link link = Link.split(
      (request) => request.isSubscription,
      websocketLink,
      httpLinkWithAuth,
    );
    return GraphQLClient(
      link: link,
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        mutate: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    );
  }
}
