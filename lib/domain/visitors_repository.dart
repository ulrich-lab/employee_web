import 'package:dartz/dartz.dart';
import 'package:visitor_pass/Models/dashboard_model.dart';
import 'package:visitor_pass/Models/visitor_details_model.dart';
import 'package:visitor_pass/core/error/failure.dart';

abstract class VisitorsRepository {
  Stream<List<DashboardVisitor>?>? listenToAllVisitors({
    required String id,
  });

  Future<Either<Failure, String>> clockOutVisits({
    required String id,
  });

  Future<Either<Failure, String>> acceptVisit({
    required String id,
  });
  Future<Either<Failure, String>> rejectVisit({
    required String id,
  });
  Future<Either<Failure, VisitorDetails>> getVisitorDetails({
   required String id,
  });
}
