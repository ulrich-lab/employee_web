import 'dart:convert';

class Leave {
  final String? id;
  final String? status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? leaveType;
  final String? comment;
  final String? otherDescription;
  final Employee? employee;

  Leave({
    this.id,
    this.status,
    this.startDate,
    this.endDate,
    this.leaveType,
    this.comment,
    this.employee,
    this.otherDescription,
  });
}

class Employee {
  final String? id;
  final String? lastname;
  final String? firstname;
  final String? function;
  final File? file;

  Employee({
    this.id,
    this.lastname,
    this.firstname,
    this.function,
    this.file,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as String?,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      function: json['function'] as String?,
      file: json['file'] != null ? File.fromJson(json['file']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastname': lastname,
        'firstname': firstname,
        'function': function,
        'file': file?.toJson(),
      };
}

class File {
  final String? id;
  final String? fileUrl;

  File({
    this.id,
    this.fileUrl,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: json['id'] as String?,
      fileUrl: json['file_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'file_url': fileUrl,
      };
}
