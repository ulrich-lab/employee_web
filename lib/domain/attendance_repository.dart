import 'package:dartz/dartz.dart';
import 'package:visitor_pass/Models/attendance_model.dart';
import 'package:visitor_pass/core/error/failure.dart';

abstract class AttendanceRepository {
  Stream<AttendanceData?>? listenToAttendanceStatus({
    required String id,
  });

  Future<Either<Failure, String>> clockIn({
    required String id,
    required String buildingId,
    required String long,
    required String lat,
  });

  Future<Either<Failure, String>> clockOut({
    required String id,
  });
}
