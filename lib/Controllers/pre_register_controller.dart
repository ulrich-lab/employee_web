import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/pre_register_model.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/domain/appointments_repository.dart';
import '../services/server.dart';

@lazySingleton
class PreRegisterController extends GetxController {
  PreRegisterController(this.appointmentsRepository);

  AppointmentsRepository appointmentsRepository;

  Server server = Server();
  bool loader = false;
  List<Preregisters> preVisitorList = <Preregisters>[];
  List<Preregisters> preVisitorSearchList = <Preregisters>[];

  // @override
  // void onInit() {
  //   super.onInit();
  //   getPreVisitors();
  // }

  getPreVisitors() async {
    loader = true;
    update();
    preVisitorList = <Preregisters>[];
    appointmentsRepository.listenToAllAppointments().listen(
      (data) {
        preVisitorList=data;
        update();
      },
    ).onError((handleError) {
     
    });
    loader = false;
    update();
    // server.getRequest(endPoint: APIList.preRegisterList).then((response) {
    //   if (response != null && response.statusCode == 200) {
    //     var jsonResponse = jsonDecode(response.body);
    //     var preVisitorListData = PreRegisterModel.fromJson(jsonResponse);
    //     preVisitorList = <Preregisters>[];
    //     preVisitorList.addAll(preVisitorListData.data!.preregisters!);
    //     loader = false;
    //     update();
    //   } else {
    //     loader = false;
    //     update();
    //     return null;
    //   }
    // });
  }

  getSearchedPreVisitors(name) async {
    if (name.toString().isEmpty) {
      getPreVisitors();
    } else {
      loader = true;
      update();
      // server
      //     .getRequest(endPoint: (APIList.preRegisterSearch! + "$name"))
      //     .then((response) {
      //   if (response != null && response.statusCode == 200) {
      //     var jsonResponse = jsonDecode(response.body);
      //     var preVisitorSearchListData =
      //         PreRegisterModel.fromJson(jsonResponse);
      //     preVisitorList = <Preregisters>[];
      //     preVisitorList.addAll(preVisitorSearchListData.data!.preregisters!);
      //     loader = false;
      //     update();
      //   } else {
      //     loader = false;
      //     update();
      //     return null;
      //   }
      // });
    }
  }
}
