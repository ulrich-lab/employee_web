import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    int? id,
    String? name,
    String? phone,
    String? gender,
    // dynamic officialIdentificationNumber,
    // String? dateOfJoining,
    String? status,
    int? user_id,
    String? about,
    String? image,
    String? type,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
