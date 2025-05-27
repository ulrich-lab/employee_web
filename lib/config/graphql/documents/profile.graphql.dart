import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$UpdateEmployeeInfo {
  factory Variables$Mutation$UpdateEmployeeInfo({
    String? lastname,
    String? firstname,
    String? address,
    String? phoneNumber,
    required String id,
  }) =>
      Variables$Mutation$UpdateEmployeeInfo._({
        if (lastname != null) r'lastname': lastname,
        if (firstname != null) r'firstname': firstname,
        if (address != null) r'address': address,
        if (phoneNumber != null) r'phoneNumber': phoneNumber,
        r'id': id,
      });

  Variables$Mutation$UpdateEmployeeInfo._(this._$data);

  factory Variables$Mutation$UpdateEmployeeInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('lastname')) {
      final l$lastname = data['lastname'];
      result$data['lastname'] = (l$lastname as String?);
    }
    if (data.containsKey('firstname')) {
      final l$firstname = data['firstname'];
      result$data['firstname'] = (l$firstname as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = (l$address as String?);
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$UpdateEmployeeInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get lastname => (_$data['lastname'] as String?);

  String? get firstname => (_$data['firstname'] as String?);

  String? get address => (_$data['address'] as String?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('lastname')) {
      final l$lastname = lastname;
      result$data['lastname'] = l$lastname;
    }
    if (_$data.containsKey('firstname')) {
      final l$firstname = firstname;
      result$data['firstname'] = l$firstname;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address;
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateEmployeeInfo<
          Variables$Mutation$UpdateEmployeeInfo>
      get copyWith => CopyWith$Variables$Mutation$UpdateEmployeeInfo(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateEmployeeInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lastname = lastname;
    final lOther$lastname = other.lastname;
    if (_$data.containsKey('lastname') !=
        other._$data.containsKey('lastname')) {
      return false;
    }
    if (l$lastname != lOther$lastname) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (_$data.containsKey('firstname') !=
        other._$data.containsKey('firstname')) {
      return false;
    }
    if (l$firstname != lOther$firstname) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$lastname = lastname;
    final l$firstname = firstname;
    final l$address = address;
    final l$phoneNumber = phoneNumber;
    final l$id = id;
    return Object.hashAll([
      _$data.containsKey('lastname') ? l$lastname : const {},
      _$data.containsKey('firstname') ? l$firstname : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      l$id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateEmployeeInfo<TRes> {
  factory CopyWith$Variables$Mutation$UpdateEmployeeInfo(
    Variables$Mutation$UpdateEmployeeInfo instance,
    TRes Function(Variables$Mutation$UpdateEmployeeInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateEmployeeInfo;

  factory CopyWith$Variables$Mutation$UpdateEmployeeInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateEmployeeInfo;

  TRes call({
    String? lastname,
    String? firstname,
    String? address,
    String? phoneNumber,
    String? id,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateEmployeeInfo<TRes>
    implements CopyWith$Variables$Mutation$UpdateEmployeeInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateEmployeeInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateEmployeeInfo _instance;

  final TRes Function(Variables$Mutation$UpdateEmployeeInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? lastname = _undefined,
    Object? firstname = _undefined,
    Object? address = _undefined,
    Object? phoneNumber = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateEmployeeInfo._({
        ..._instance._$data,
        if (lastname != _undefined) 'lastname': (lastname as String?),
        if (firstname != _undefined) 'firstname': (firstname as String?),
        if (address != _undefined) 'address': (address as String?),
        if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateEmployeeInfo<TRes>
    implements CopyWith$Variables$Mutation$UpdateEmployeeInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateEmployeeInfo(this._res);

  TRes _res;

  call({
    String? lastname,
    String? firstname,
    String? address,
    String? phoneNumber,
    String? id,
  }) =>
      _res;
}

class Mutation$UpdateEmployeeInfo {
  Mutation$UpdateEmployeeInfo({
    required this.updateUserInfo,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$UpdateEmployeeInfo.fromJson(Map<String, dynamic> json) {
    final l$updateUserInfo = json['updateUserInfo'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateEmployeeInfo(
      updateUserInfo: Mutation$UpdateEmployeeInfo$updateUserInfo.fromJson(
          (l$updateUserInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateEmployeeInfo$updateUserInfo updateUserInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUserInfo = updateUserInfo;
    _resultData['updateUserInfo'] = l$updateUserInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUserInfo = updateUserInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateUserInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateEmployeeInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUserInfo = updateUserInfo;
    final lOther$updateUserInfo = other.updateUserInfo;
    if (l$updateUserInfo != lOther$updateUserInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateEmployeeInfo
    on Mutation$UpdateEmployeeInfo {
  CopyWith$Mutation$UpdateEmployeeInfo<Mutation$UpdateEmployeeInfo>
      get copyWith => CopyWith$Mutation$UpdateEmployeeInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateEmployeeInfo<TRes> {
  factory CopyWith$Mutation$UpdateEmployeeInfo(
    Mutation$UpdateEmployeeInfo instance,
    TRes Function(Mutation$UpdateEmployeeInfo) then,
  ) = _CopyWithImpl$Mutation$UpdateEmployeeInfo;

  factory CopyWith$Mutation$UpdateEmployeeInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateEmployeeInfo;

  TRes call({
    Mutation$UpdateEmployeeInfo$updateUserInfo? updateUserInfo,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes> get updateUserInfo;
}

class _CopyWithImpl$Mutation$UpdateEmployeeInfo<TRes>
    implements CopyWith$Mutation$UpdateEmployeeInfo<TRes> {
  _CopyWithImpl$Mutation$UpdateEmployeeInfo(
    this._instance,
    this._then,
  );

  final Mutation$UpdateEmployeeInfo _instance;

  final TRes Function(Mutation$UpdateEmployeeInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateUserInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateEmployeeInfo(
        updateUserInfo: updateUserInfo == _undefined || updateUserInfo == null
            ? _instance.updateUserInfo
            : (updateUserInfo as Mutation$UpdateEmployeeInfo$updateUserInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes> get updateUserInfo {
    final local$updateUserInfo = _instance.updateUserInfo;
    return CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo(
        local$updateUserInfo, (e) => call(updateUserInfo: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateEmployeeInfo<TRes>
    implements CopyWith$Mutation$UpdateEmployeeInfo<TRes> {
  _CopyWithStubImpl$Mutation$UpdateEmployeeInfo(this._res);

  TRes _res;

  call({
    Mutation$UpdateEmployeeInfo$updateUserInfo? updateUserInfo,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes>
      get updateUserInfo =>
          CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo.stub(_res);
}

const documentNodeMutationUpdateEmployeeInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateEmployeeInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lastname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firstname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'address')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUserInfo'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'employee'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'phoneNumber'),
                value: VariableNode(name: NameNode(value: 'phoneNumber')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'lastname'),
                value: VariableNode(name: NameNode(value: 'lastname')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'firstname'),
                value: VariableNode(name: NameNode(value: 'firstname')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'address'),
                value: VariableNode(name: NameNode(value: 'address')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'phoneNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstname'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastname'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdateEmployeeInfo _parserFn$Mutation$UpdateEmployeeInfo(
        Map<String, dynamic> data) =>
    Mutation$UpdateEmployeeInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateEmployeeInfo = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateEmployeeInfo?,
);

class Options$Mutation$UpdateEmployeeInfo
    extends graphql.MutationOptions<Mutation$UpdateEmployeeInfo> {
  Options$Mutation$UpdateEmployeeInfo({
    String? operationName,
    required Variables$Mutation$UpdateEmployeeInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateEmployeeInfo? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateEmployeeInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateEmployeeInfo>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdateEmployeeInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateEmployeeInfo,
          parserFn: _parserFn$Mutation$UpdateEmployeeInfo,
        );

  final OnMutationCompleted$Mutation$UpdateEmployeeInfo? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateEmployeeInfo
    extends graphql.WatchQueryOptions<Mutation$UpdateEmployeeInfo> {
  WatchOptions$Mutation$UpdateEmployeeInfo({
    String? operationName,
    required Variables$Mutation$UpdateEmployeeInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateEmployeeInfo? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateEmployeeInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateEmployeeInfo,
        );
}

extension ClientExtension$Mutation$UpdateEmployeeInfo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateEmployeeInfo>>
      mutate$UpdateEmployeeInfo(
              Options$Mutation$UpdateEmployeeInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateEmployeeInfo>
      watchMutation$UpdateEmployeeInfo(
              WatchOptions$Mutation$UpdateEmployeeInfo options) =>
          this.watchMutation(options);
}

class Mutation$UpdateEmployeeInfo$updateUserInfo {
  Mutation$UpdateEmployeeInfo$updateUserInfo({
    this.phoneNumber,
    this.id,
    this.address,
    this.firstname,
    this.lastname,
    this.$__typename = 'EmployeeUpdateType',
  });

  factory Mutation$UpdateEmployeeInfo$updateUserInfo.fromJson(
      Map<String, dynamic> json) {
    final l$phoneNumber = json['phoneNumber'];
    final l$id = json['id'];
    final l$address = json['address'];
    final l$firstname = json['firstname'];
    final l$lastname = json['lastname'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateEmployeeInfo$updateUserInfo(
      phoneNumber: (l$phoneNumber as String?),
      id: (l$id as String?),
      address: (l$address as String?),
      firstname: (l$firstname as String?),
      lastname: (l$lastname as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? phoneNumber;

  final String? id;

  final String? address;

  final String? firstname;

  final String? lastname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    final l$id = id;
    final l$address = address;
    final l$firstname = firstname;
    final l$lastname = lastname;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$phoneNumber,
      l$id,
      l$address,
      l$firstname,
      l$lastname,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateEmployeeInfo$updateUserInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (l$firstname != lOther$firstname) {
      return false;
    }
    final l$lastname = lastname;
    final lOther$lastname = other.lastname;
    if (l$lastname != lOther$lastname) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateEmployeeInfo$updateUserInfo
    on Mutation$UpdateEmployeeInfo$updateUserInfo {
  CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<
          Mutation$UpdateEmployeeInfo$updateUserInfo>
      get copyWith => CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes> {
  factory CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo(
    Mutation$UpdateEmployeeInfo$updateUserInfo instance,
    TRes Function(Mutation$UpdateEmployeeInfo$updateUserInfo) then,
  ) = _CopyWithImpl$Mutation$UpdateEmployeeInfo$updateUserInfo;

  factory CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateEmployeeInfo$updateUserInfo;

  TRes call({
    String? phoneNumber,
    String? id,
    String? address,
    String? firstname,
    String? lastname,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes>
    implements CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes> {
  _CopyWithImpl$Mutation$UpdateEmployeeInfo$updateUserInfo(
    this._instance,
    this._then,
  );

  final Mutation$UpdateEmployeeInfo$updateUserInfo _instance;

  final TRes Function(Mutation$UpdateEmployeeInfo$updateUserInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phoneNumber = _undefined,
    Object? id = _undefined,
    Object? address = _undefined,
    Object? firstname = _undefined,
    Object? lastname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateEmployeeInfo$updateUserInfo(
        phoneNumber: phoneNumber == _undefined
            ? _instance.phoneNumber
            : (phoneNumber as String?),
        id: id == _undefined ? _instance.id : (id as String?),
        address:
            address == _undefined ? _instance.address : (address as String?),
        firstname: firstname == _undefined
            ? _instance.firstname
            : (firstname as String?),
        lastname:
            lastname == _undefined ? _instance.lastname : (lastname as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes>
    implements CopyWith$Mutation$UpdateEmployeeInfo$updateUserInfo<TRes> {
  _CopyWithStubImpl$Mutation$UpdateEmployeeInfo$updateUserInfo(this._res);

  TRes _res;

  call({
    String? phoneNumber,
    String? id,
    String? address,
    String? firstname,
    String? lastname,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdatePassword {
  factory Variables$Mutation$UpdatePassword({
    required String currentPassword,
    required String newPassword,
    required String phoneNumber,
  }) =>
      Variables$Mutation$UpdatePassword._({
        r'currentPassword': currentPassword,
        r'newPassword': newPassword,
        r'phoneNumber': phoneNumber,
      });

  Variables$Mutation$UpdatePassword._(this._$data);

  factory Variables$Mutation$UpdatePassword.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$currentPassword = data['currentPassword'];
    result$data['currentPassword'] = (l$currentPassword as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    return Variables$Mutation$UpdatePassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get currentPassword => (_$data['currentPassword'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  String get phoneNumber => (_$data['phoneNumber'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$currentPassword = currentPassword;
    result$data['currentPassword'] = l$currentPassword;
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdatePassword<Variables$Mutation$UpdatePassword>
      get copyWith => CopyWith$Variables$Mutation$UpdatePassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdatePassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$currentPassword = currentPassword;
    final lOther$currentPassword = other.currentPassword;
    if (l$currentPassword != lOther$currentPassword) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$currentPassword = currentPassword;
    final l$newPassword = newPassword;
    final l$phoneNumber = phoneNumber;
    return Object.hashAll([
      l$currentPassword,
      l$newPassword,
      l$phoneNumber,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdatePassword<TRes> {
  factory CopyWith$Variables$Mutation$UpdatePassword(
    Variables$Mutation$UpdatePassword instance,
    TRes Function(Variables$Mutation$UpdatePassword) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdatePassword;

  factory CopyWith$Variables$Mutation$UpdatePassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdatePassword;

  TRes call({
    String? currentPassword,
    String? newPassword,
    String? phoneNumber,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdatePassword<TRes>
    implements CopyWith$Variables$Mutation$UpdatePassword<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdatePassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdatePassword _instance;

  final TRes Function(Variables$Mutation$UpdatePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? currentPassword = _undefined,
    Object? newPassword = _undefined,
    Object? phoneNumber = _undefined,
  }) =>
      _then(Variables$Mutation$UpdatePassword._({
        ..._instance._$data,
        if (currentPassword != _undefined && currentPassword != null)
          'currentPassword': (currentPassword as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdatePassword<TRes>
    implements CopyWith$Variables$Mutation$UpdatePassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdatePassword(this._res);

  TRes _res;

  call({
    String? currentPassword,
    String? newPassword,
    String? phoneNumber,
  }) =>
      _res;
}

class Mutation$UpdatePassword {
  Mutation$UpdatePassword({
    required this.updateEmployeePassword,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$UpdatePassword.fromJson(Map<String, dynamic> json) {
    final l$updateEmployeePassword = json['updateEmployeePassword'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdatePassword(
      updateEmployeePassword:
          Mutation$UpdatePassword$updateEmployeePassword.fromJson(
              (l$updateEmployeePassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdatePassword$updateEmployeePassword updateEmployeePassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateEmployeePassword = updateEmployeePassword;
    _resultData['updateEmployeePassword'] = l$updateEmployeePassword.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateEmployeePassword = updateEmployeePassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateEmployeePassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdatePassword || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateEmployeePassword = updateEmployeePassword;
    final lOther$updateEmployeePassword = other.updateEmployeePassword;
    if (l$updateEmployeePassword != lOther$updateEmployeePassword) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdatePassword on Mutation$UpdatePassword {
  CopyWith$Mutation$UpdatePassword<Mutation$UpdatePassword> get copyWith =>
      CopyWith$Mutation$UpdatePassword(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdatePassword<TRes> {
  factory CopyWith$Mutation$UpdatePassword(
    Mutation$UpdatePassword instance,
    TRes Function(Mutation$UpdatePassword) then,
  ) = _CopyWithImpl$Mutation$UpdatePassword;

  factory CopyWith$Mutation$UpdatePassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdatePassword;

  TRes call({
    Mutation$UpdatePassword$updateEmployeePassword? updateEmployeePassword,
    String? $__typename,
  });
  CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes>
      get updateEmployeePassword;
}

class _CopyWithImpl$Mutation$UpdatePassword<TRes>
    implements CopyWith$Mutation$UpdatePassword<TRes> {
  _CopyWithImpl$Mutation$UpdatePassword(
    this._instance,
    this._then,
  );

  final Mutation$UpdatePassword _instance;

  final TRes Function(Mutation$UpdatePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateEmployeePassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdatePassword(
        updateEmployeePassword: updateEmployeePassword == _undefined ||
                updateEmployeePassword == null
            ? _instance.updateEmployeePassword
            : (updateEmployeePassword
                as Mutation$UpdatePassword$updateEmployeePassword),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes>
      get updateEmployeePassword {
    final local$updateEmployeePassword = _instance.updateEmployeePassword;
    return CopyWith$Mutation$UpdatePassword$updateEmployeePassword(
        local$updateEmployeePassword, (e) => call(updateEmployeePassword: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdatePassword<TRes>
    implements CopyWith$Mutation$UpdatePassword<TRes> {
  _CopyWithStubImpl$Mutation$UpdatePassword(this._res);

  TRes _res;

  call({
    Mutation$UpdatePassword$updateEmployeePassword? updateEmployeePassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes>
      get updateEmployeePassword =>
          CopyWith$Mutation$UpdatePassword$updateEmployeePassword.stub(_res);
}

const documentNodeMutationUpdatePassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdatePassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'currentPassword')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'newPassword')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateEmployeePassword'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'employeeInfo'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'phoneNumber'),
                value: VariableNode(name: NameNode(value: 'phoneNumber')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'currentPassword'),
                value: VariableNode(name: NameNode(value: 'currentPassword')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'newPassword'),
                value: VariableNode(name: NameNode(value: 'newPassword')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$UpdatePassword _parserFn$Mutation$UpdatePassword(
        Map<String, dynamic> data) =>
    Mutation$UpdatePassword.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdatePassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdatePassword?,
);

class Options$Mutation$UpdatePassword
    extends graphql.MutationOptions<Mutation$UpdatePassword> {
  Options$Mutation$UpdatePassword({
    String? operationName,
    required Variables$Mutation$UpdatePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdatePassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdatePassword>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UpdatePassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdatePassword,
          parserFn: _parserFn$Mutation$UpdatePassword,
        );

  final OnMutationCompleted$Mutation$UpdatePassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdatePassword
    extends graphql.WatchQueryOptions<Mutation$UpdatePassword> {
  WatchOptions$Mutation$UpdatePassword({
    String? operationName,
    required Variables$Mutation$UpdatePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePassword? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdatePassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdatePassword,
        );
}

extension ClientExtension$Mutation$UpdatePassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdatePassword>> mutate$UpdatePassword(
          Options$Mutation$UpdatePassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdatePassword> watchMutation$UpdatePassword(
          WatchOptions$Mutation$UpdatePassword options) =>
      this.watchMutation(options);
}

class Mutation$UpdatePassword$updateEmployeePassword {
  Mutation$UpdatePassword$updateEmployeePassword({
    required this.success,
    this.$__typename = 'UpdatePasswordOutputType',
  });

  factory Mutation$UpdatePassword$updateEmployeePassword.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdatePassword$updateEmployeePassword(
      success: (l$success as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String success;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdatePassword$updateEmployeePassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdatePassword$updateEmployeePassword
    on Mutation$UpdatePassword$updateEmployeePassword {
  CopyWith$Mutation$UpdatePassword$updateEmployeePassword<
          Mutation$UpdatePassword$updateEmployeePassword>
      get copyWith => CopyWith$Mutation$UpdatePassword$updateEmployeePassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes> {
  factory CopyWith$Mutation$UpdatePassword$updateEmployeePassword(
    Mutation$UpdatePassword$updateEmployeePassword instance,
    TRes Function(Mutation$UpdatePassword$updateEmployeePassword) then,
  ) = _CopyWithImpl$Mutation$UpdatePassword$updateEmployeePassword;

  factory CopyWith$Mutation$UpdatePassword$updateEmployeePassword.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdatePassword$updateEmployeePassword;

  TRes call({
    String? success,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdatePassword$updateEmployeePassword<TRes>
    implements CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes> {
  _CopyWithImpl$Mutation$UpdatePassword$updateEmployeePassword(
    this._instance,
    this._then,
  );

  final Mutation$UpdatePassword$updateEmployeePassword _instance;

  final TRes Function(Mutation$UpdatePassword$updateEmployeePassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdatePassword$updateEmployeePassword(
        success: success == _undefined || success == null
            ? _instance.success
            : (success as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdatePassword$updateEmployeePassword<TRes>
    implements CopyWith$Mutation$UpdatePassword$updateEmployeePassword<TRes> {
  _CopyWithStubImpl$Mutation$UpdatePassword$updateEmployeePassword(this._res);

  TRes _res;

  call({
    String? success,
    String? $__typename,
  }) =>
      _res;
}
