import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/domain/visitors_repository.dart';
import 'package:visitor_pass/main.dart';

import '../Models/dashboard_model.dart';
import '../services/server.dart';

@lazySingleton
class DashboardController extends GetxController {
  final VisitorsRepository visitorsRepository;
  Server server = Server();
  var loader = true.obs;
  var visitors = <DashboardVisitor>[].obs;
  var totalVisitor = '0'.obs;
  var totalPreRegister = '0'.obs;
  DashboardController(
    this.visitorsRepository,
  );

  // @override
  // void onInit() {
  //   getDashboard();
  //   super.onInit();
  // }

  getDashboard() async {
    loader.value = true;
    // UserService userService = UserService();
    visitorsRepository
        .listenToAllVisitors(id: prefs.getString("user-id") ?? "")!
        .listen(
      (data) {
        visitors.value = data ?? [];
      },
      onError: (error) {},
      onDone: () {},
    );
    ;
    // visitorList.value = <DashboardVisitor>[];
    // server.getRequest(endPoint: APIList.dashboard).then((response) {
    //   if (response != null && response.statusCode == 200) {
    //     var jsonResponse = jsonDecode(response.body);
    //     var dashboardData = DashboardModel.fromJson(jsonResponse);
    //     visitorList.value = <DashboardVisitor>[];
    //     visitorList.addAll(dashboardData.data!.visitor!);
    //     totalVisitor.value = dashboardData.data!.totalVisitors.toString();
    //     totalPreRegister.value =
    //         dashboardData.data!.totalPreRegisters.toString();
    //     loader.value = false;
    //   } else {
    //     loader.value = false;

    //     return null;
    //   }
    // });
    loader.value = false;
  }

  changeStatus(context, id, status) {
    loader.value = false;
    if (status == "accepte") {
      visitorsRepository.acceptVisit(id: id);
    } else if (status == "rejected") {
      visitorsRepository.rejectVisit(id: id);
    } else {
      visitorsRepository.clockOutVisits(id: id);
    }
    // server
    //     .getRequest(endPoint: (APIList.changeStatus! + "$id" + "/" + "$status"))
    //     .then((response) async {
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = jsonDecode(response.body);
    //     loader.value = true;
    //     getVisitors();
    //     Get.find<DashboardController>().onInit();

    //     Get.rawSnackbar(
    //       snackPosition: SnackPosition.TOP,
    //       title: 'Check In Status',
    //       message: jsonResponse['data']['message'],
    //       backgroundColor: AppColor.greenColor.withOpacity(.9),
    //       maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //       margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //     );
    //     loader.value = false;
    //   } else {
    //     loader.value = false;

    //     return null;
    //   }
    // });
    loader.value = false;
  }
}
