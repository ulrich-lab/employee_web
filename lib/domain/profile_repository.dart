import 'package:dartz/dartz.dart';
import 'package:visitor_pass/core/error/failure.dart';
import 'package:visitor_pass/Models/user_updated_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserUpdatedModel>> updateUserProfile(
      {String? firstName, String? lastName, String? address,String phoneNumber});
    Future<Either<Failure, String>> updatePassword(
      {required String currentPassword,required  String newPassword});
}
