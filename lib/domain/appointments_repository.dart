import 'package:dartz/dartz.dart';
import 'package:visitor_pass/Models/pre_register_model.dart';
import 'package:visitor_pass/core/error/failure.dart';

abstract class AppointmentsRepository {
  Stream<List<Preregisters>> listenToAllAppointments(
     );

  Future<Either<Failure, String>> addAppointments({
    required String employee_id,
    required String startTime,
    String? id_number,
    required String phoneNumber,
    required String firstname,
    required String lastname,
    required String description,
    required String date,
  });
}
