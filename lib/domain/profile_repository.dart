import 'package:dartz/dartz.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
import 'package:visitor_pass/core/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserUpdatedModel>> updateUserProfile(
      {String? firstName, String? lastName, String? address,String phoneNumber});
    Future<Either<Failure, String>> updatePassword(
      {required String currentPassword,required  String newPassword});
}
