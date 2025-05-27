class DashboardModel {
  DashboardModel({
      DashboardData? data,}){
    _data = data;
}

  DashboardModel.fromJson(dynamic json) {
    _data = json['data'] != null ? DashboardData.fromJson(json['data']) : null;
  }
  DashboardData? _data;

  DashboardData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class DashboardData {
  DashboardData({
      int? status, 
      List<DashboardVisitor>? visitor,
      String? totalVisitors,
    String? totalPreRegisters,}){
    _status = status;
    _visitor = visitor;
    _totalVisitors = totalVisitors;
    _totalPreRegisters = totalPreRegisters;
}

  DashboardData.fromJson(dynamic json) {
    _status = json['status'];
    if (json['visitor'] != null) {
      _visitor = [];
      json['visitor'].forEach((v) {
        _visitor?.add(DashboardVisitor.fromJson(v));
      });
    }
    _totalVisitors = json['total_visitors'].toString();
    _totalPreRegisters = json['total_pre_registers'].toString();
  }
  int? _status;
  List<DashboardVisitor>? _visitor;
  String? _totalVisitors;
  String? _totalPreRegisters;

  int? get status => _status;
  List<DashboardVisitor>? get visitor => _visitor;
  String? get totalVisitors => _totalVisitors;
  String? get totalPreRegisters => _totalPreRegisters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_visitor != null) {
      map['visitor'] = _visitor?.map((v) => v.toJson()).toList();
    }
    map['total_visitors'] = _totalVisitors;
    map['total_pre_registers'] = _totalPreRegisters;
    return map;
  }

}
class DashboardVisitor {
  DashboardVisitor({
    String? id,
    String? regNo,
    String? name,
    String? image,
    String? status,
    String? statusName,
    int? visitorId,
    String? checkInAt,
    String? checkOutAt,
    String? createAt,
    String? raison,
  }) {
    _id = id;
    _regNo = regNo;
    _name = name;
    _image = image;
    _status = status;
    _statusName = statusName;
    _visitorId = visitorId;
    _checkInAt = checkInAt;
    _checkOutAt = checkOutAt;
    _createAt = createAt;
    _raison = raison;
  }

  DashboardVisitor.fromJson(dynamic json) {
    _id = json['id'];
    _regNo = json['reg_no'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'].toString();
    _statusName = json['status_name'];
    _visitorId = json['visitor_id'];
    _checkInAt = json['checkin_at'];
    _checkOutAt = json['checkout_at'];
    _createAt = json['createAt'];
    _raison = json['raison'];
  }
  String? _id;
  String? _regNo;
  String? _name;
  String? _image;
  String? _status;
  String? _statusName;
  int? _visitorId;
  String? _checkInAt;
  String? _checkOutAt;
  String? _createAt;
  String? _raison;

  String? get id => _id;
  String? get regNo => _regNo;
  String? get name => _name;
  String? get image => _image;
  String? get status => _status;
  String? get statusName => _statusName;
  int? get visitorId => _visitorId;
  String? get checkInAt => _checkInAt;
  String? get checkOutAt => _checkOutAt;
  String? get createAt => _createAt;
  String? get raison => _raison;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reg_no'] = _regNo;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['status_name'] = _statusName;
    map['visitor_id'] = _visitorId;
    map['checkin_at'] = _checkInAt;
    map['checkout_at'] = _checkOutAt;
    map['createAt'] = _createAt;
    map['raison'] = _raison;
    return map;
  }
}

