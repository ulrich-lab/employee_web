import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/dashboard_model.dart';
import 'package:visitor_pass/Models/visitor_details_model.dart';
import 'package:visitor_pass/config/graphql/documents/visitor.graphql.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/domain/visitors_repository.dart';
import 'package:intl/intl.dart';

@prod
@LazySingleton(as: VisitorsRepository)
class VisitorsRepositoryImpl implements VisitorsRepository {
  final GraphqlDatasource graphQLDatasource;

  VisitorsRepositoryImpl(
    this.graphQLDatasource,
  );

  String formatDateString(String dateString) {
    DateTime time = DateFormat("HH:mm:ss.SSSSSS").parse(dateString);
    String formattedTime = DateFormat("HH:mm").format(time);
    return formattedTime;
  } //CNPS & SED

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = DateFormat('EEEE d MMMM', 'fr_FR');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  // String formatDateString(String dateString) {
  //   DateTime dateTime = DateTime.parse(dateString);
  //   DateFormat formatter = DateFormat("HH'h'mm", 'fr_FR');
  //   String formattedTime = formatter.format(dateTime);
  //   return formattedTime;
  // } //FODECC

  @override
  Stream<List<DashboardVisitor>?>? listenToAllVisitors({required String id}) {
    Stream<List<DashboardVisitor>?>? visitors = graphQLDatasource
        .subscribe(Options$Subscription$ListenAllVisitor(
            variables:
                Variables$Subscription$ListenAllVisitor(host_employee: id)))
        .map(
      (event) {
        return event.visits.length > 0
            ? [
                ...event.visits.map((el) {
                  return DashboardVisitor(
                      id: el.id,
                      checkInAt: el.check_in_at != null
                          ? formatDateString(el.check_in_at!)
                          : null,
                      checkOutAt: el.check_out_at != null
                          ? formatDateString(el.check_out_at!)
                          : null,
                      image: el.visitorByVisitor?.fileByPhoto?.file_url,
                      status: el.status.toString(),
                      name:
                          "${el.visitorByVisitor?.firstname} ${el.visitorByVisitor?.lastname}",
                      statusName: el.status.toString(),
                      createAt: el.date != null ? formatDate(el.date!) : null,
                      raison: el.reason);
                })
              ]
            : null;
      },
    );
    return visitors;
  }

  @override
  Future<Either<Failure, String>> acceptVisit({required String id}) async {
    final result = await graphQLDatasource.mutate(Options$Mutation$AcceptVisit(
        variables: Variables$Mutation$AcceptVisit(id: id)));
    return result.map((r) => "then");
  }

  @override
  Future<Either<Failure, String>> clockOutVisits({required String id}) async {
    final result = await graphQLDatasource.mutate(
        Options$Mutation$ClockOutVisits(
            variables: Variables$Mutation$ClockOutVisits(id: id)));
    return result.map((r) => "then");
  }

  @override
  Future<Either<Failure, String>> rejectVisit({required String id}) async {
    final result = await graphQLDatasource.mutate(Options$Mutation$RejectVisit(
        variables: Variables$Mutation$RejectVisit(id: id)));
    return result.map((r) => "then");
  }

  @override
  Future<Either<Failure, VisitorDetails>> getVisitorDetails(
      {required String id}) async {
    final result =
        await graphQLDatasource.query(Options$Query$GetVisitorDetails(
            variables: Variables$Query$GetVisitorDetails(
      id: id,
    )));
    return result.map((r) {
      return VisitorDetails(
        name:
            "${r.visits_by_pk?.visitorByVisitor?.firstname} ${r.visits_by_pk?.visitorByVisitor?.lastname}",
        image: r.visits_by_pk?.visitorByVisitor?.fileByPhoto?.file_url,
        companyName: r.visits_by_pk?.department?.text_content.toString(),
        phone: r.visits_by_pk?.visitorByVisitor?.phone_number,
        purpose: r.visits_by_pk?.reason,
        statusName: r.visits_by_pk?.status.toString().split(".").last,
        date: r.visits_by_pk?.date != null
            ? formatDate(r.visits_by_pk!.date!)
            : null,
        checkinAt: r.visits_by_pk?.check_in_at != null
            ? formatDateString(r.visits_by_pk!.check_in_at!)
            : null,
             checkoutAt: r.visits_by_pk?.check_out_at != null
            ? formatDateString(r.visits_by_pk!.check_out_at!)
            : null,
      );
    });
  }
}
