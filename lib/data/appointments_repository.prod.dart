import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/pre_register_model.dart';
import 'package:visitor_pass/config/graphql/documents/appointments.graphql.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/domain/appointments_repository.dart';
import 'package:visitor_pass/main.dart';

@prod
@LazySingleton(as: AppointmentsRepository)
class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final GraphqlDatasource graphQLDatasource;

  AppointmentsRepositoryImpl(
    this.graphQLDatasource,
  );

  @override
  Stream<List<Preregisters>> listenToAllAppointments(
      ) {
        
    Stream<List<Preregisters>> appointments = graphQLDatasource
        .subscribe(
      Options$Subscription$GetAllAppointments(
        variables: Variables$Subscription$GetAllAppointments(
          employee_id: prefs.getString("user-id")??"",
          company_id: prefs.getString("company_id")??"",
        ),
      ),
    ).map(
      (event) {
     
        return [
          ...event.appointments.map((el) {
            return Preregisters(
              expectedDate: el.date.toString(),
              expectedTime: el.start_time.toString(),
              id: el.id,
              name: "${el.visitor?.firstname} ${el.visitor?.lastname}",
              phone: el.visitor?.phone_number.toString(),
              status: el.status?.name.toString(),
              comment:el.description
            );
          }).toList(),
        ];
      },
    );
    return appointments;
  }

  @override
  Future<Either<Failure, String>> addAppointments({
    required String employee_id,
    required String startTime,
    String? id_number,
    required String phoneNumber,
    required String firstname,
    required String lastname,
    required String description,
    required String date,
  }) async {
    final result = await graphQLDatasource.mutate(
      Options$Mutation$InsertAppintmentWithVisits(
        variables: Variables$Mutation$InsertAppintmentWithVisits(
          employee_id: employee_id,
          // end_time: startTime,
          start_time: startTime,
          description: description,
          firstname: firstname,
          lastname: lastname,
          phone_number: phoneNumber,
          date: date,
        ),
      ),
    );
    return result.map((r) => "then");
  }
}
