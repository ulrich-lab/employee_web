import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
import 'package:visitor_pass/config/graphql/documents/profile.graphql.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/domain/profile_repository.dart';
import 'package:visitor_pass/main.dart';

@prod
@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final GraphqlDatasource graphQLDatasource;

  ProfileRepositoryImpl(
    this.graphQLDatasource,
  );

  // @override
  // Future<Either<Failure, String>> acceptVisit({required String id}) async {
  //   final result = await graphQLDatasource.mutate(Options$Mutation$AcceptVisit(
  //       variables: Variables$Mutation$AcceptVisit(id: id)));
  //   return result.map((r) => "then");
  // }

  @override
  Future<Either<Failure, UserUpdatedModel>> updateUserProfile(
      {String? firstName,
      String? lastName,
      String? address,
      String? phoneNumber}) async {
    // UserService userService = UserService();
    final result = await graphQLDatasource.mutate(
      Options$Mutation$UpdateEmployeeInfo(
        variables: Variables$Mutation$UpdateEmployeeInfo(
          firstname: firstName,
          id: prefs.getString("user-id")??"",
          lastname: lastName,
          address: address,
          phoneNumber: phoneNumber,
        ),
      ),
    );
    return result.map(
      (r) => UserUpdatedModel(
        address: r.updateUserInfo.address,
        firstName: r.updateUserInfo.firstname,
        lastName: r.updateUserInfo.lastname,
      ),
      
    );
  }

  @override
  Future<Either<Failure, String>> updatePassword(
      {required String currentPassword, required String newPassword}) async {
    // UserService userService = UserService();
    final result = await graphQLDatasource.mutate(
      Options$Mutation$UpdatePassword(
        variables: Variables$Mutation$UpdatePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          phoneNumber: prefs.getString("phone")??"",
        ),
      ),
    );
    return result.map((r) => r.updateEmployeePassword.success);
  }
}
