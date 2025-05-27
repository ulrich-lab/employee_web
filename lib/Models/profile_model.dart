class Profile {
  Profile({
    String? id,
    String? first_name,
    String? last_name,
    String? name,
    String? email,
    String? username,
    String? phone,
    String? address,
    String? company_id,
    String? image,
    // String? poste,
    // String? designation,
    // String? role,
    // List<Department>? allDepartments,
    // List<Designation>? allDesignations,
  }) {
    _id = id;
    _first_name = first_name;
    _last_name = last_name;
    _name = name;
    _email = email;
    _username = username;
    _phone = phone;
    _address = address;
    _company_id = company_id;
    _image = image;
    // _poste = poste;
    // _designation = designation;
    // _role = role;
    // _allDepartments = allDepartments;
    // _allDesignations = allDesignations;
  }

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _first_name = json['firstname'];
    _last_name = json['lastname'];
    _name = "${json['firstname']} ${json['lastname']}";
    _email = json['email'];
    _username = "${json['firstname']} ${json['lastname']}";
    _phone = json['phone_number'];
    _address = json['address'];
    _company_id = json['company_id'].toString();
    _image = json['profile_picture'] ??
        "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png";
    // _poste = json['poste'] ?? "";
    // _designation = json['designation'] ?? "";
  }

  String? _id;
  String? _first_name;
  String? _last_name;
  String? _name;
  String? _email;
  String? _username;
  String? _phone;
  String? _address;
  String? _company_id;
  String? _image;
  // String? _poste;
  // String? _designation;
  // String? _role;
  // List<Department>? _allDepartments;
  // List<Designation>? _allDesignations;

  String? get id => _id;
  String? get first_name => _first_name;
  String? get last_name => _last_name;
  String? get name => _name;
  String? get email => _email;
  String? get username => _username;
  String? get phone => _phone;
  String? get address => _address;
  String? get company_id => _company_id;
  String? get image => _image;
  // String? get poste => _poste;
  // String? get designation => _designation;
  // String? get role => _role;
  // List<Department>? get allDepartments => _allDepartments;
  // List<Designation>? get allDesignations => _allDesignations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _first_name;
    map['lastname'] = _last_name;
    map['name'] = _name;
    map['email'] = _email;
    map['username'] = _username;
    map['phone_number'] = _phone;
    map['address'] = _address;
    map['company_id'] = _company_id;
    map['profile_picture'] = _image;
    // map['poste'] = _poste;
    // map['designation'] = _designation;
    // map['role'] = _role;
    // if (_allDepartments != null) {
    //   map['all_departments'] =
    //       _allDepartments?.map((v) => v.toJson()).toList();
    // }
    // if (_allDesignations != null) {
    //   map['all_designations'] =
    //       _allDesignations?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

  // Méthode copyWith
  Profile copyWith({
    String? id,
    String? first_name,
    String? last_name,
    String? name,
    String? email,
    String? username,
    String? phone,
    String? address,
    String? company_id,
    String? image,
    // String? poste,
    // String? designation,
    // String? role,
    // List<Department>? allDepartments,
    // List<Designation>? allDesignations,
  }) {
    return Profile(
      id: id ?? _id,
      first_name: first_name ?? _first_name,
      last_name: last_name ?? _last_name,
      name: name ?? _name,
      email: email ?? _email,
      username: username ?? _username,
      phone: phone ?? _phone,
      address: address ?? _address,
      company_id: company_id ?? _company_id,
      image: image ?? _image,
      // poste: poste ?? _poste,
      // designation: designation ?? _designation,
      // role: role ?? _role,
      // allDepartments: allDepartments ?? _allDepartments,
      // allDesignations: allDesignations ?? _allDesignations,
    );
  }
}


// class Department {
//   Department({
//     int? id,
//     String? name,
//     String? code,
//     int? status,
//     String? createdAt,
//     String? updatedAt,
//     int? companyId,
//   }) {
//     _id = id;
//     _name = name;
//     _code = code;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _companyId = companyId;
//   }

//   Department.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _code = json['code'];
//     _status = json['status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _companyId = json['company_id'];
//   }
//   int? _id;
//   String? _name;
//   String? _code;
//   int? _status;
//   String? _createdAt;
//   String? _updatedAt;
//   int? _companyId;

//   int? get id => _id;
//   String? get name => _name;
//   String? get code => _code;
//   int? get status => _status;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   int? get companyId => _companyId;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['code'] = _code;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['company_id'] = _companyId;
//     return map;
//   }
// }

// class Designation {
//   Designation({
//     int? id,
//     String? name,
//     int? status,
//     String? createdAt,
//     String? updatedAt,
//     int? companyId,
//     String? etage,
//   }) {
//     _id = id;
//     _name = name;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _companyId = companyId;
//     _etage = etage;
//   }

//   Designation.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _status = json['status'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _companyId = json['company_id'];
//     _etage = json['etage'];
//   }
//   int? _id;
//   String? _name;
//   int? _status;
//   String? _createdAt;
//   String? _updatedAt;
//   int? _companyId;
//   String? _etage;

//   int? get id => _id;
//   String? get name => _name;
//   int? get status => _status;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   int? get companyId => _companyId;
//   String? get etage => _etage;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['company_id'] = _companyId;
//     map['etage'] = _etage;
//     return map;
//   }
// }
