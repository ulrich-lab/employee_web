import 'package:dartz/dartz.dart';
import 'package:visitor_pass/Models/permission_model.dart';
import 'package:visitor_pass/core/error/failure.dart';

abstract class PermissionRepository {
  Stream<List<Leave>> listenToAllPermissions({
    required int offset,
    required String uuid,
  });
  Future<Either<Failure, List<String>>> getAllReason();
  Future<Either<Failure, String>> insertLeave({
    required String comment,
    required String start_date,
    required String end_date,
    required String leave_type,
    String? file_url,
  });
  Future<Either<Failure, String>> updateLeave({
    required String comment,
    required String start_date,
    required String end_date,
    required String leave_type,
    required String leave_id,
    String? file_url,
  });
  Future<Either<Failure, String>> deleteLeave({required String id});
}
