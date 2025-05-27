
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/permission_model.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/domain/permission_repository.dart';

@lazySingleton
class PermissionController extends GetxController {
  final PermissionRepository permissionRepository;
  PermissionController(this.permissionRepository);

  var isLoadingReason = false.obs;
  var isLoadingInsertLeave = false.obs;
  var isLoadingUpdateLeave = false.obs;
  var isLoadingDeleteLeave = false.obs;
  var loader = false.obs;

  var reasonList = <String>[].obs;
  var currentReason = "".obs;
  var leaveList = <Leave>[].obs;

  Future<void> getReasonList({
    Function()? onFail,
    Function()? onSuccess,
  }) async {
    isLoadingReason.value = true;

    var rusult = await permissionRepository.getAllReason();
    rusult.fold(
      (failure) {
        isLoadingReason.value = false;

        if (onFail != null) onFail();
      },
      (success) {
        reasonList.value = success;
        currentReason.value = success.first;

        if (onSuccess != null) onSuccess();
      },
    );
    isLoadingReason.value = false;
  }

  Future<void> insertLeave({
    Function()? onFail,
    Function()? onSuccess,
    required String comment,
    required String start_date,
    required String end_date,
    required String leave_type,
    String? file_url,
  }) async {
    if (isLoadingInsertLeave.value) return;
    isLoadingInsertLeave.value = true;
    final r = permissionRepository.insertLeave(
        comment: comment,
        start_date: start_date,
        end_date: end_date,
        leave_type: leave_type,
        file_url: file_url);

    r.then((result) {
      result.fold(
        (failure) {
          print("failure=======$failure");
          isLoadingInsertLeave.value = false;
          if (onFail != null) onFail();
        },
        (success) async {
          Get.back();
          isLoadingInsertLeave.value = false;
          if (onSuccess != null) onSuccess();
        },
      );
    }).catchError((error) {
      isLoadingInsertLeave.value = false;
      Get.back();
      Get.rawSnackbar(message: 'Please enter valid input');
    });
  }

  Future<void> updateLeave({
    Function()? onFail,
    Function()? onSuccess,
    required String comment,
    required String start_date,
    required String end_date,
    required String leave_type,
    required String leave_id,
    String? file_url,
  }) async {
    if (isLoadingUpdateLeave.value) return;
    isLoadingUpdateLeave.value = true;
    final r = permissionRepository.updateLeave(
      comment: comment,
      start_date: start_date,
      end_date: end_date,
      leave_type: leave_type,
      file_url: file_url,
      leave_id: leave_id,
    );

    r.then((result) {
      result.fold(
        (failure) {
          isLoadingUpdateLeave.value = false;
          if (onFail != null) onFail();
        },
        (success) async {
          // Get.back();
          isLoadingUpdateLeave.value = false;
          if (onSuccess != null) onSuccess();
        },
      );
    }).catchError((error) {
      isLoadingUpdateLeave.value = false;
      Get.back();
      Get.rawSnackbar(message: 'Please enter valid input');
    });
  }

  Future<void> deleteLeave({
    Function()? onFail,
    Function()? onSuccess,
    required String leave_id,
  }) async {
    if (isLoadingDeleteLeave.value) return;
    isLoadingDeleteLeave.value = true;
    final r = permissionRepository.deleteLeave(id: leave_id);

    r.then((result) {
      result.fold(
        (failure) {
          isLoadingDeleteLeave.value = false;
          if (onFail != null) onFail();
        },
        (success) async {
          Get.back();
          isLoadingDeleteLeave.value = false;
          if (onSuccess != null) onSuccess();
        },
      );
    }).catchError((error) {
      isLoadingDeleteLeave.value = false;
      Get.back();
    });
  }

  Future<void> getLeavesList({int page = 1}) async {
    loader.value = true;
    // UserService userService = UserService();

    permissionRepository
        .listenToAllPermissions(
      uuid: box.read("user-id"),
      offset: page,
    )
        .listen(
      (data) {
        leaveList.value = data;
      },
      onError: (error) {},
      onDone: () {},
    );
    ;

    loader.value = false;
  }

  @override
  onReady() {
    getLeavesList();
    if (reasonList.isEmpty) {
      getReasonList();
    }
  }
}
