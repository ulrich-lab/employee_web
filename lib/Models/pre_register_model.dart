// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Preregisters {
  String? id;
  String? name;
  String? phone;
  String? expectedDate;
  String? expectedTime;
  String? status;
  String? comment;

  Preregisters({
    this.id,
    this.name,
    this.phone,
    this.expectedDate,
    this.expectedTime,
    this.status,
    this.comment,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'expectedDate': expectedDate,
      'expectedTime': expectedTime,
      'status': status,
      'comment': comment,
    };
  }

  
}
