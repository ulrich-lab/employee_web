import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/attendance_model.dart';
import 'package:visitor_pass/config/graphql/documents/attendances.graphql.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/domain/attendance_repository.dart';

@prod
@LazySingleton(as: AttendanceRepository)
class AttendanceRepositoryImpl implements AttendanceRepository {
  final GraphqlDatasource graphQLDatasource;

  AttendanceRepositoryImpl(
    this.graphQLDatasource,
  );

  @override
  Future<Either<Failure, String>> clockIn({
    required String id,
    required String buildingId,
    required String long,
    required String lat,
  }) async {
    final result = await graphQLDatasource.mutate(
      Options$Mutation$ClockIn(
        variables: Variables$Mutation$ClockIn(
          building_id: buildingId,
          employee_id: id,
          location: '{"type": "Point", "coordinates": [$long,$lat]}',
        ),
      ),
    );

    return result.map((r) => r.insert_attendance_one?.id ?? "");
  }

  @override
  Future<Either<Failure, String>> clockOut({required String id}) async {
    final result = await graphQLDatasource.mutate(Options$Mutation$ClockOut(
        variables: Variables$Mutation$ClockOut(employee_id: id)));
    return result.map((r) => "then");
  }

  @override
  Stream<AttendanceData?>? listenToAttendanceStatus({required String id}) {
    Stream<AttendanceData?>? attendanceStatus = graphQLDatasource
        .subscribe(
      Options$Subscription$AttendanceStatus(
        variables: Variables$Subscription$AttendanceStatus(employee_id: id),
      ),
    )
        .map(
      (event) {
        return event.attendance.length > 0
            ? AttendanceData(
                isLate: event.attendance.first.attendance_state?.is_late,
                currentDate: DateTime.now().toIso8601String(),
                status: event.attendance.first.clock_in_time == null
                    ? 0
                    : event.attendance.first.clock_out_time == null
                        ? 2
                        : 1,
                attendance: Attendance(
                    checkinTime: event.attendance.first.clock_in_time,
                    checkoutTime: event.attendance.first.clock_out_time,
                    isLate: event.attendance.first.attendance_state?.is_late),
              )
            : null;
      },
    );
    return attendanceStatus;

    // for (int i = 0; i < 10; i++) {
    //   await Future.delayed(Duration(seconds: 4));
    //   yield AttendanceData(status: i,);
    // }
  }

  @override
  Stream<List<AttendanceData>?> attendanceList({required String id}) {
    Stream<List<AttendanceData>?> attendanceStatus = graphQLDatasource
        .subscribe(
      Options$Subscription$AttendanceList(
        variables: Variables$Subscription$AttendanceList(employee_id: id),
      ),
    )
        .map(
      (event) {
        return event.attendance.length > 0
            ? event.attendance.map((el) {
                return AttendanceData(
                  isLate: el.attendance_state?.is_late,
                  currentDate: DateTime.now().toIso8601String(),
                  status: el.clock_in_time == null
                      ? 0
                      : el.clock_out_time == null
                          ? 2
                          : 1,
                  attendance: Attendance(
                      checkinTime: el.clock_in_time,
                      checkoutTime: el.clock_out_time,
                      isLate: el.attendance_state?.is_late),
                );
              }).toList()
            : null;
      },
    );
    return attendanceStatus;
  }
}
