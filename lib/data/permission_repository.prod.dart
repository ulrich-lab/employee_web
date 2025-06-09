import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/permission_model.dart';
import 'package:visitor_pass/config/graphql/documents/permission.graphql.dart';
import 'package:visitor_pass/config/graphql/schema.graphqls.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/domain/permission_repository.dart';
import 'package:visitor_pass/main.dart';

@prod
@LazySingleton(as: PermissionRepository)
class PermissionRepositoryImpl implements PermissionRepository {
  final GraphqlDatasource graphQLDatasource;

  PermissionRepositoryImpl(
    this.graphQLDatasource,
  );

  @override
  Future<Either<Failure, List<String>>> getAllReason() async {
    final reasons = await graphQLDatasource.query(
      Options$Query$GetAllReason(),
    );
    return reasons.map(
      (event) {
        return [...event.leave_type.map((el) => el.type)];
      },
    );
  }

  @override
  Future<Either<Failure, String>> insertLeave({
    required String comment,
    required String start_date,
    required String end_date,
    required String leave_type,
    String? file_url,
  }) async {
    // UserService userService = UserService();
    final result = await graphQLDatasource.mutate(
      Options$Mutation$InsertLeave(
        variables: Variables$Mutation$InsertLeave(
          end_date: end_date,
          start_date: start_date,
          comment: comment,
          employee_id: prefs.getString("user-id")??"",
          leave_type: Enum$leave_type_enum.fromJson(leave_type),
          file: file_url,
        ),
      ),
    );
    return result.map((r) => r.insert_leaves_one?.id ?? "");
  }

  @override
  Stream<List<Leave>> listenToAllPermissions(
      {required int offset, required String uuid}) {
    Stream<List<Leave>> leaves = graphQLDatasource
        .subscribe(
      Options$Subscription$GetLeaves(
        variables: Variables$Subscription$GetLeaves(
          limit: 10,
          offset: ((offset - 1) * 10),
          $_eq: uuid,
        ),
      ),
    )
        .map(
      (event) {
        return [
          ...event.leaves.map((el) {
            return Leave(
              id: el.id,
              status: el.status.toString(),
              startDate: DateTime.parse(el.start_date),
              endDate: DateTime.parse(el.end_date),
              leaveType: el.leave_type.toString(),
              comment: el.comment,
              employee: el.employee != null
                  ? Employee(
                      id: el.employee!.id,
                      lastname: el.employee!.lastname,
                      firstname: el.employee!.firstname,
                      function: el.employee!.function,
                      file: el.employee!.file != null
                          ? File(
                              id: el.employee!.file!.id,
                              fileUrl: el.employee!.file!.file_url,
                            )
                          : null,
                    )
                  : null,
            );
          }).toList(),
        ];
      },
    );
    return leaves;
  }

  @override
  Future<Either<Failure, String>> deleteLeave({required String id}) async {
    final result = await graphQLDatasource.mutate(
      Options$Mutation$DeleteLeave(
        variables: Variables$Mutation$DeleteLeave(id: id),
      ),
    );
    return result.map((r) => r.delete_leaves_by_pk?.id ?? "");
  }

  @override
  Future<Either<Failure, String>> updateLeave(
      {required String comment,
      required String start_date,
      required String end_date,
      required String leave_type,
      required String leave_id,
      String? file_url}) async {
    final result = await graphQLDatasource.mutate(
      Options$Mutation$UpdateLeave(
        variables: Variables$Mutation$UpdateLeave(
          end_date: end_date,
          start_date: start_date,
          comment: comment,
          id: leave_id,
          leave_type: Enum$leave_type_enum.fromJson(leave_type),
          file: file_url,
        ),
      ),
    );
    return result.map((r) => r.update_leaves_by_pk?.id ?? "");
  }
}
