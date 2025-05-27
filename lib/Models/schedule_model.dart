class ScheduleItemModel {
  int? id;
  String? title;
  String? date;
  String? checkinTime;
  String? checkoutTime;
  int? userId;
  String? createdAt;
  String? updatedAt;

  ScheduleItemModel(
      {this.id,
      this.title,
      this.date,
      this.checkinTime,
      this.checkoutTime,
      this.userId,
      this.createdAt,
      this.updatedAt});

  ScheduleItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['checkin_time'] = this.checkinTime;
    data['checkout_time'] = this.checkoutTime;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}