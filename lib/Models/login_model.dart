class LoginModel {
  LoginModel({
    // int? status,
    // String? message,
    LoginData? employee,
    String? token,
  }) {
    // _status = status;
    // _message = message;
    _employee = employee;
    _token = token;
  }

  LoginModel.fromJson(dynamic json) {
    // _status = json['status'];
    // _message = json['message'];
    _employee =
        json['employee'] != null ? LoginData.fromJson(json['employee']) : null;
    _token = json['token'];
  }
  // int? _status;
  // String? _message;
  LoginData? _employee;
  String? _token;

  // int? get status => _status;
  // String? get message => _message;
  LoginData? get employee => _employee;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['status'] = _status;
    // map['message'] = _message;
    if (_employee != null) {
      map['employee'] = _employee?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

// class LoginData {
//   LoginData({
//     int? id,
//     String? name,
//     String? email,
//     String? phone,
//     String? username,
//     dynamic image,
//     dynamic address,
//     int? status,
//     int? applied,
//     String? myrole,
//     String? mystatus,
//   }) {
//     _id = id;
//     _name = name;
//     _email = email;
//     _phone = phone;
//     _username = username;
//     _image = image;
//     _address = address;
//     _status = status;
//     _applied = applied;
//     _myrole = myrole;
//     _mystatus = mystatus;
//   }

//   LoginData.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _phone = json['phone'];
//     _username = json['username'];
//     _image = json['image'];
//     _address = json['address'];
//     _status = json['status'];
//     _applied = json['applied'];
//     _myrole = json['myrole'];
//     _mystatus = json['mystatus'];
//   }
//   int? _id;
//   String? _name;
//   String? _email;
//   String? _phone;
//   String? _username;
//   dynamic _image;
//   dynamic _address;
//   int? _status;
//   int? _applied;
//   String? _myrole;
//   String? _mystatus;

//   int? get id => _id;
//   String? get name => _name;
//   String? get email => _email;
//   String? get phone => _phone;
//   String? get username => _username;
//   dynamic get image => _image;
//   dynamic get address => _address;
//   int? get status => _status;
//   int? get applied => _applied;
//   String? get myrole => _myrole;
//   String? get mystatus => _mystatus;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['email'] = _email;
//     map['phone'] = _phone;
//     map['username'] = _username;
//     map['image'] = _image;
//     map['address'] = _address;
//     map['status'] = _status;
//     map['applied'] = _applied;
//     map['myrole'] = _myrole;
//     map['mystatus'] = _mystatus;
//     return map;
//   }
// }

class LoginData {
  String? password;
  String? profilePicture;
  String? companyId;
  String? createdAt;
  String? firstname;
  String? agencyId;
  String? updatedAt;
  String? id;
  String? serviceId;
  String? region;
  String? lastname;
  String? departmentId;
  String? idCardNumber;
  String? phoneNumber;
  String? positionId;
  String? license;
  String? email;
  String? supervisorId;
  String? address;
  String? function;
  List<Roles>? roles;
  Position? position;

  LoginData(
      {this.password,
      this.profilePicture,
      this.companyId,
      this.createdAt,
      this.firstname,
      this.agencyId,
      this.updatedAt,
      this.id,
      this.serviceId,
      this.region,
      this.lastname,
      this.departmentId,
      this.idCardNumber,
      this.phoneNumber,
      this.positionId,
      this.license,
      this.email,
      this.supervisorId,
      this.address,
      this.function,
      this.roles,
      this.position});

  LoginData.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    profilePicture = json['profile_picture'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    firstname = json['firstname'];
    agencyId = json['agency_id'];
    updatedAt = json['updated_at'];
    id = json['id'];
    serviceId = json['service_id'];
    region = json['region'];
    lastname = json['lastname'];
    departmentId = json['department_id'];
    idCardNumber = json['id_card_number'];
    phoneNumber = json['phone_number'];
    positionId = json['position_id'];
    license = json['license'];
    email = json['email'];
    supervisorId = json['supervisor_id'];
    address = json['address'];
    function = json['function'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['profile_picture'] = this.profilePicture;
    data['company_id'] = this.companyId;
    data['created_at'] = this.createdAt;
    data['firstname'] = this.firstname;
    data['agency_id'] = this.agencyId;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['region'] = this.region;
    data['lastname'] = this.lastname;
    data['department_id'] = this.departmentId;
    data['id_card_number'] = this.idCardNumber;
    data['phone_number'] = this.phoneNumber;
    data['position_id'] = this.positionId;
    data['license'] = this.license;
    data['email'] = this.email;
    data['supervisor_id'] = this.supervisorId;
    data['address'] = this.address;
    data['function'] = this.function;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    return data;
  }
}

class Roles {
  String? roleId;
  String? employeeId;
  String? createdAt;
  String? id;
  String? updatedAt;
  Role? role;

  Roles(
      {this.roleId,
      this.employeeId,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.role});

  Roles.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.roleId;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  String? roleName;
  String? updatedAt;
  String? createdAt;
  String? id;

  Role({this.roleName, this.updatedAt, this.createdAt, this.id});

  Role.fromJson(Map<String, dynamic> json) {
    roleName = json['role_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_name'] = this.roleName;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Position {
  int? level;
  String? name;
  String? updatedAt;
  String? createdAt;
  String? id;

  Position({this.level, this.name, this.updatedAt, this.createdAt, this.id});

  Position.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
