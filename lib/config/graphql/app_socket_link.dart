import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import 'package:graphql/client.dart';
import 'package:visitor_pass/Controllers/global-controller.dart';

class AppSocketLink extends Link {
  AppSocketLink(this.url);
  final String url;
  _Connection? _connection;

  
  @override
  Stream<Response> request(Request request, [forward]) async* {

    String? token = g.Get.find<GlobalController>().bearerToken;

    if (_connection == null || _connection!.token != token) {
      connectOrReconnect(token);
    }
    
    yield* _connection!.client.subscribe(request, true);
  }

  void connectOrReconnect(String? token) {
    _connection?.client.dispose();
    var uri = Uri.parse(url);
    if (kIsWeb) {
      uri = uri.replace(queryParameters: {"access_token": token});
    }
    _connection = _Connection(
      client: SocketClient(
        uri.toString(),
        config: SocketClientConfig(
          autoReconnect: true,
          initialPayload: {"authToken": token},
          inactivityTimeout: const Duration(minutes: 30),
          headers: kIsWeb || token == null ? null : {"Authorization": token},
        ),
      ),
      token: token,
    );
  }

  @override
  Future<void> dispose() async {
    await _connection?.client.dispose();
    _connection = null;
  }
}

class _Connection {
  SocketClient client;
  String? token;
  _Connection({
    required this.client,
    required this.token,
  });
}
