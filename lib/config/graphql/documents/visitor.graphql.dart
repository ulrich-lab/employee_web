import '../schema.graphqls.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$ListenAllVisitor {
  factory Variables$Subscription$ListenAllVisitor(
          {required String host_employee}) =>
      Variables$Subscription$ListenAllVisitor._({
        r'host_employee': host_employee,
      });

  Variables$Subscription$ListenAllVisitor._(this._$data);

  factory Variables$Subscription$ListenAllVisitor.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$host_employee = data['host_employee'];
    result$data['host_employee'] = (l$host_employee as String);
    return Variables$Subscription$ListenAllVisitor._(result$data);
  }

  Map<String, dynamic> _$data;

  String get host_employee => (_$data['host_employee'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$host_employee = host_employee;
    result$data['host_employee'] = l$host_employee;
    return result$data;
  }

  CopyWith$Variables$Subscription$ListenAllVisitor<
          Variables$Subscription$ListenAllVisitor>
      get copyWith => CopyWith$Variables$Subscription$ListenAllVisitor(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$ListenAllVisitor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$host_employee = host_employee;
    final lOther$host_employee = other.host_employee;
    if (l$host_employee != lOther$host_employee) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$host_employee = host_employee;
    return Object.hashAll([l$host_employee]);
  }
}

abstract class CopyWith$Variables$Subscription$ListenAllVisitor<TRes> {
  factory CopyWith$Variables$Subscription$ListenAllVisitor(
    Variables$Subscription$ListenAllVisitor instance,
    TRes Function(Variables$Subscription$ListenAllVisitor) then,
  ) = _CopyWithImpl$Variables$Subscription$ListenAllVisitor;

  factory CopyWith$Variables$Subscription$ListenAllVisitor.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ListenAllVisitor;

  TRes call({String? host_employee});
}

class _CopyWithImpl$Variables$Subscription$ListenAllVisitor<TRes>
    implements CopyWith$Variables$Subscription$ListenAllVisitor<TRes> {
  _CopyWithImpl$Variables$Subscription$ListenAllVisitor(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ListenAllVisitor _instance;

  final TRes Function(Variables$Subscription$ListenAllVisitor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? host_employee = _undefined}) =>
      _then(Variables$Subscription$ListenAllVisitor._({
        ..._instance._$data,
        if (host_employee != _undefined && host_employee != null)
          'host_employee': (host_employee as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$ListenAllVisitor<TRes>
    implements CopyWith$Variables$Subscription$ListenAllVisitor<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ListenAllVisitor(this._res);

  TRes _res;

  call({String? host_employee}) => _res;
}

class Subscription$ListenAllVisitor {
  Subscription$ListenAllVisitor({required this.visits});

  factory Subscription$ListenAllVisitor.fromJson(Map<String, dynamic> json) {
    final l$visits = json['visits'];
    return Subscription$ListenAllVisitor(
        visits: (l$visits as List<dynamic>)
            .map((e) => Subscription$ListenAllVisitor$visits.fromJson(
                (e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$ListenAllVisitor$visits> visits;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$visits = visits;
    _resultData['visits'] = l$visits.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$visits = visits;
    return Object.hashAll([Object.hashAll(l$visits.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ListenAllVisitor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$visits = visits;
    final lOther$visits = other.visits;
    if (l$visits.length != lOther$visits.length) {
      return false;
    }
    for (int i = 0; i < l$visits.length; i++) {
      final l$visits$entry = l$visits[i];
      final lOther$visits$entry = lOther$visits[i];
      if (l$visits$entry != lOther$visits$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$ListenAllVisitor
    on Subscription$ListenAllVisitor {
  CopyWith$Subscription$ListenAllVisitor<Subscription$ListenAllVisitor>
      get copyWith => CopyWith$Subscription$ListenAllVisitor(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllVisitor<TRes> {
  factory CopyWith$Subscription$ListenAllVisitor(
    Subscription$ListenAllVisitor instance,
    TRes Function(Subscription$ListenAllVisitor) then,
  ) = _CopyWithImpl$Subscription$ListenAllVisitor;

  factory CopyWith$Subscription$ListenAllVisitor.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllVisitor;

  TRes call({List<Subscription$ListenAllVisitor$visits>? visits});
  TRes visits(
      Iterable<Subscription$ListenAllVisitor$visits> Function(
              Iterable<
                  CopyWith$Subscription$ListenAllVisitor$visits<
                      Subscription$ListenAllVisitor$visits>>)
          _fn);
}

class _CopyWithImpl$Subscription$ListenAllVisitor<TRes>
    implements CopyWith$Subscription$ListenAllVisitor<TRes> {
  _CopyWithImpl$Subscription$ListenAllVisitor(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllVisitor _instance;

  final TRes Function(Subscription$ListenAllVisitor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? visits = _undefined}) =>
      _then(Subscription$ListenAllVisitor(
          visits: visits == _undefined || visits == null
              ? _instance.visits
              : (visits as List<Subscription$ListenAllVisitor$visits>)));

  TRes visits(
          Iterable<Subscription$ListenAllVisitor$visits> Function(
                  Iterable<
                      CopyWith$Subscription$ListenAllVisitor$visits<
                          Subscription$ListenAllVisitor$visits>>)
              _fn) =>
      call(
          visits: _fn(_instance.visits
              .map((e) => CopyWith$Subscription$ListenAllVisitor$visits(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$ListenAllVisitor<TRes>
    implements CopyWith$Subscription$ListenAllVisitor<TRes> {
  _CopyWithStubImpl$Subscription$ListenAllVisitor(this._res);

  TRes _res;

  call({List<Subscription$ListenAllVisitor$visits>? visits}) => _res;

  visits(_fn) => _res;
}

const documentNodeSubscriptionListenAllVisitor = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenAllVisitor'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'host_employee')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'visits'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'host_employee'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'host_employee')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reg_no'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'visitorByVisitor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'fileByPhoto'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'file_url'),
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
                name: NameNode(value: 'phone_number'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_number'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'check_in_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'check_out_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'date'),
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
      )
    ]),
  ),
]);
Subscription$ListenAllVisitor _parserFn$Subscription$ListenAllVisitor(
        Map<String, dynamic> data) =>
    Subscription$ListenAllVisitor.fromJson(data);

class Options$Subscription$ListenAllVisitor
    extends graphql.SubscriptionOptions<Subscription$ListenAllVisitor> {
  Options$Subscription$ListenAllVisitor({
    String? operationName,
    required Variables$Subscription$ListenAllVisitor variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenAllVisitor? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionListenAllVisitor,
          parserFn: _parserFn$Subscription$ListenAllVisitor,
        );
}

class WatchOptions$Subscription$ListenAllVisitor
    extends graphql.WatchQueryOptions<Subscription$ListenAllVisitor> {
  WatchOptions$Subscription$ListenAllVisitor({
    String? operationName,
    required Variables$Subscription$ListenAllVisitor variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenAllVisitor? typedOptimisticResult,
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
          document: documentNodeSubscriptionListenAllVisitor,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenAllVisitor,
        );
}

class FetchMoreOptions$Subscription$ListenAllVisitor
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenAllVisitor({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$ListenAllVisitor variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionListenAllVisitor,
        );
}

extension ClientExtension$Subscription$ListenAllVisitor
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenAllVisitor>>
      subscribe$ListenAllVisitor(
              Options$Subscription$ListenAllVisitor options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$ListenAllVisitor>
      watchSubscription$ListenAllVisitor(
              WatchOptions$Subscription$ListenAllVisitor options) =>
          this.watchQuery(options);
}

class Subscription$ListenAllVisitor$visits {
  Subscription$ListenAllVisitor$visits({
    required this.id,
    this.reg_no,
    this.reason,
    required this.visitorByVisitor,
    this.status,
    this.check_in_at,
    this.check_out_at,
    this.date,
    this.$__typename = 'visits',
  });

  factory Subscription$ListenAllVisitor$visits.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$reg_no = json['reg_no'];
    final l$reason = json['reason'];
    final l$visitorByVisitor = json['visitorByVisitor'];
    final l$status = json['status'];
    final l$check_in_at = json['check_in_at'];
    final l$check_out_at = json['check_out_at'];
    final l$date = json['date'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenAllVisitor$visits(
      id: (l$id as String),
      reg_no: (l$reg_no as String?),
      reason: (l$reason as String?),
      visitorByVisitor:
          Subscription$ListenAllVisitor$visits$visitorByVisitor.fromJson(
              (l$visitorByVisitor as Map<String, dynamic>)),
      status: l$status == null
          ? null
          : fromJson$Enum$visit_status_enum((l$status as String)),
      check_in_at: (l$check_in_at as String?),
      check_out_at: (l$check_out_at as String?),
      date: (l$date as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? reg_no;

  final String? reason;

  final Subscription$ListenAllVisitor$visits$visitorByVisitor visitorByVisitor;

  final Enum$visit_status_enum? status;

  final String? check_in_at;

  final String? check_out_at;

  final String? date;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$reg_no = reg_no;
    _resultData['reg_no'] = l$reg_no;
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$visitorByVisitor = visitorByVisitor;
    _resultData['visitorByVisitor'] = l$visitorByVisitor.toJson();
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$visit_status_enum(l$status);
    final l$check_in_at = check_in_at;
    _resultData['check_in_at'] = l$check_in_at;
    final l$check_out_at = check_out_at;
    _resultData['check_out_at'] = l$check_out_at;
    final l$date = date;
    _resultData['date'] = l$date;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$reg_no = reg_no;
    final l$reason = reason;
    final l$visitorByVisitor = visitorByVisitor;
    final l$status = status;
    final l$check_in_at = check_in_at;
    final l$check_out_at = check_out_at;
    final l$date = date;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$reg_no,
      l$reason,
      l$visitorByVisitor,
      l$status,
      l$check_in_at,
      l$check_out_at,
      l$date,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ListenAllVisitor$visits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reg_no = reg_no;
    final lOther$reg_no = other.reg_no;
    if (l$reg_no != lOther$reg_no) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
      return false;
    }
    final l$visitorByVisitor = visitorByVisitor;
    final lOther$visitorByVisitor = other.visitorByVisitor;
    if (l$visitorByVisitor != lOther$visitorByVisitor) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$check_in_at = check_in_at;
    final lOther$check_in_at = other.check_in_at;
    if (l$check_in_at != lOther$check_in_at) {
      return false;
    }
    final l$check_out_at = check_out_at;
    final lOther$check_out_at = other.check_out_at;
    if (l$check_out_at != lOther$check_out_at) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
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

extension UtilityExtension$Subscription$ListenAllVisitor$visits
    on Subscription$ListenAllVisitor$visits {
  CopyWith$Subscription$ListenAllVisitor$visits<
          Subscription$ListenAllVisitor$visits>
      get copyWith => CopyWith$Subscription$ListenAllVisitor$visits(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllVisitor$visits<TRes> {
  factory CopyWith$Subscription$ListenAllVisitor$visits(
    Subscription$ListenAllVisitor$visits instance,
    TRes Function(Subscription$ListenAllVisitor$visits) then,
  ) = _CopyWithImpl$Subscription$ListenAllVisitor$visits;

  factory CopyWith$Subscription$ListenAllVisitor$visits.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllVisitor$visits;

  TRes call({
    String? id,
    String? reg_no,
    String? reason,
    Subscription$ListenAllVisitor$visits$visitorByVisitor? visitorByVisitor,
    Enum$visit_status_enum? status,
    String? check_in_at,
    String? check_out_at,
    String? date,
    String? $__typename,
  });
  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes>
      get visitorByVisitor;
}

class _CopyWithImpl$Subscription$ListenAllVisitor$visits<TRes>
    implements CopyWith$Subscription$ListenAllVisitor$visits<TRes> {
  _CopyWithImpl$Subscription$ListenAllVisitor$visits(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllVisitor$visits _instance;

  final TRes Function(Subscription$ListenAllVisitor$visits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? reg_no = _undefined,
    Object? reason = _undefined,
    Object? visitorByVisitor = _undefined,
    Object? status = _undefined,
    Object? check_in_at = _undefined,
    Object? check_out_at = _undefined,
    Object? date = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenAllVisitor$visits(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        reg_no: reg_no == _undefined ? _instance.reg_no : (reg_no as String?),
        reason: reason == _undefined ? _instance.reason : (reason as String?),
        visitorByVisitor:
            visitorByVisitor == _undefined || visitorByVisitor == null
                ? _instance.visitorByVisitor
                : (visitorByVisitor
                    as Subscription$ListenAllVisitor$visits$visitorByVisitor),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$visit_status_enum?),
        check_in_at: check_in_at == _undefined
            ? _instance.check_in_at
            : (check_in_at as String?),
        check_out_at: check_out_at == _undefined
            ? _instance.check_out_at
            : (check_out_at as String?),
        date: date == _undefined ? _instance.date : (date as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes>
      get visitorByVisitor {
    final local$visitorByVisitor = _instance.visitorByVisitor;
    return CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor(
        local$visitorByVisitor, (e) => call(visitorByVisitor: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenAllVisitor$visits<TRes>
    implements CopyWith$Subscription$ListenAllVisitor$visits<TRes> {
  _CopyWithStubImpl$Subscription$ListenAllVisitor$visits(this._res);

  TRes _res;

  call({
    String? id,
    String? reg_no,
    String? reason,
    Subscription$ListenAllVisitor$visits$visitorByVisitor? visitorByVisitor,
    Enum$visit_status_enum? status,
    String? check_in_at,
    String? check_out_at,
    String? date,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes>
      get visitorByVisitor =>
          CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor.stub(
              _res);
}

class Subscription$ListenAllVisitor$visits$visitorByVisitor {
  Subscription$ListenAllVisitor$visits$visitorByVisitor({
    this.firstname,
    this.lastname,
    this.fileByPhoto,
    this.phone_number,
    this.id_number,
    this.$__typename = 'visitors',
  });

  factory Subscription$ListenAllVisitor$visits$visitorByVisitor.fromJson(
      Map<String, dynamic> json) {
    final l$firstname = json['firstname'];
    final l$lastname = json['lastname'];
    final l$fileByPhoto = json['fileByPhoto'];
    final l$phone_number = json['phone_number'];
    final l$id_number = json['id_number'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenAllVisitor$visits$visitorByVisitor(
      firstname: (l$firstname as String?),
      lastname: (l$lastname as String?),
      fileByPhoto: l$fileByPhoto == null
          ? null
          : Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto
              .fromJson((l$fileByPhoto as Map<String, dynamic>)),
      phone_number: (l$phone_number as String?),
      id_number: (l$id_number as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? firstname;

  final String? lastname;

  final Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto?
      fileByPhoto;

  final String? phone_number;

  final String? id_number;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$fileByPhoto = fileByPhoto;
    _resultData['fileByPhoto'] = l$fileByPhoto?.toJson();
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$id_number = id_number;
    _resultData['id_number'] = l$id_number;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firstname = firstname;
    final l$lastname = lastname;
    final l$fileByPhoto = fileByPhoto;
    final l$phone_number = phone_number;
    final l$id_number = id_number;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstname,
      l$lastname,
      l$fileByPhoto,
      l$phone_number,
      l$id_number,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ListenAllVisitor$visits$visitorByVisitor ||
        runtimeType != other.runtimeType) {
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
    final l$fileByPhoto = fileByPhoto;
    final lOther$fileByPhoto = other.fileByPhoto;
    if (l$fileByPhoto != lOther$fileByPhoto) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$id_number = id_number;
    final lOther$id_number = other.id_number;
    if (l$id_number != lOther$id_number) {
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

extension UtilityExtension$Subscription$ListenAllVisitor$visits$visitorByVisitor
    on Subscription$ListenAllVisitor$visits$visitorByVisitor {
  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<
          Subscription$ListenAllVisitor$visits$visitorByVisitor>
      get copyWith =>
          CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<
    TRes> {
  factory CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor(
    Subscription$ListenAllVisitor$visits$visitorByVisitor instance,
    TRes Function(Subscription$ListenAllVisitor$visits$visitorByVisitor) then,
  ) = _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor;

  factory CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor;

  TRes call({
    String? firstname,
    String? lastname,
    Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto?
        fileByPhoto,
    String? phone_number,
    String? id_number,
    String? $__typename,
  });
  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
      TRes> get fileByPhoto;
}

class _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes>
    implements
        CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes> {
  _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllVisitor$visits$visitorByVisitor _instance;

  final TRes Function(Subscription$ListenAllVisitor$visits$visitorByVisitor)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstname = _undefined,
    Object? lastname = _undefined,
    Object? fileByPhoto = _undefined,
    Object? phone_number = _undefined,
    Object? id_number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenAllVisitor$visits$visitorByVisitor(
        firstname: firstname == _undefined
            ? _instance.firstname
            : (firstname as String?),
        lastname:
            lastname == _undefined ? _instance.lastname : (lastname as String?),
        fileByPhoto: fileByPhoto == _undefined
            ? _instance.fileByPhoto
            : (fileByPhoto
                as Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto?),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        id_number: id_number == _undefined
            ? _instance.id_number
            : (id_number as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
      TRes> get fileByPhoto {
    final local$fileByPhoto = _instance.fileByPhoto;
    return local$fileByPhoto == null
        ? CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto
            .stub(_then(_instance))
        : CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
            local$fileByPhoto, (e) => call(fileByPhoto: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor<
        TRes>
    implements
        CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor<TRes> {
  _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor(
      this._res);

  TRes _res;

  call({
    String? firstname,
    String? lastname,
    Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto?
        fileByPhoto,
    String? phone_number,
    String? id_number,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
          TRes>
      get fileByPhoto =>
          CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto
              .stub(_res);
}

class Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto {
  Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto({
    this.file_url,
    this.$__typename = 'files',
  });

  factory Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto.fromJson(
      Map<String, dynamic> json) {
    final l$file_url = json['file_url'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
      file_url: (l$file_url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? file_url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$file_url = file_url;
    _resultData['file_url'] = l$file_url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$file_url = file_url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$file_url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_url = file_url;
    final lOther$file_url = other.file_url;
    if (l$file_url != lOther$file_url) {
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

extension UtilityExtension$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto
    on Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto {
  CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
          Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto>
      get copyWith =>
          CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
    TRes> {
  factory CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
    Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto instance,
    TRes Function(
            Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto)
        then,
  ) = _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto;

  factory CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto;

  TRes call({
    String? file_url,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
        TRes>
    implements
        CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
            TRes> {
  _CopyWithImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto
      _instance;

  final TRes Function(
      Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
        file_url:
            file_url == _undefined ? _instance.file_url : (file_url as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
        TRes>
    implements
        CopyWith$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenAllVisitor$visits$visitorByVisitor$fileByPhoto(
      this._res);

  TRes _res;

  call({
    String? file_url,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetVisitorDetails {
  factory Variables$Query$GetVisitorDetails({required String id}) =>
      Variables$Query$GetVisitorDetails._({
        r'id': id,
      });

  Variables$Query$GetVisitorDetails._(this._$data);

  factory Variables$Query$GetVisitorDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetVisitorDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetVisitorDetails<Variables$Query$GetVisitorDetails>
      get copyWith => CopyWith$Variables$Query$GetVisitorDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetVisitorDetails ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetVisitorDetails<TRes> {
  factory CopyWith$Variables$Query$GetVisitorDetails(
    Variables$Query$GetVisitorDetails instance,
    TRes Function(Variables$Query$GetVisitorDetails) then,
  ) = _CopyWithImpl$Variables$Query$GetVisitorDetails;

  factory CopyWith$Variables$Query$GetVisitorDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetVisitorDetails;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetVisitorDetails<TRes>
    implements CopyWith$Variables$Query$GetVisitorDetails<TRes> {
  _CopyWithImpl$Variables$Query$GetVisitorDetails(
    this._instance,
    this._then,
  );

  final Variables$Query$GetVisitorDetails _instance;

  final TRes Function(Variables$Query$GetVisitorDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetVisitorDetails._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetVisitorDetails<TRes>
    implements CopyWith$Variables$Query$GetVisitorDetails<TRes> {
  _CopyWithStubImpl$Variables$Query$GetVisitorDetails(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetVisitorDetails {
  Query$GetVisitorDetails({
    this.visits_by_pk,
    this.$__typename = 'query_root',
  });

  factory Query$GetVisitorDetails.fromJson(Map<String, dynamic> json) {
    final l$visits_by_pk = json['visits_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails(
      visits_by_pk: l$visits_by_pk == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk.fromJson(
              (l$visits_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetVisitorDetails$visits_by_pk? visits_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$visits_by_pk = visits_by_pk;
    _resultData['visits_by_pk'] = l$visits_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$visits_by_pk = visits_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$visits_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails || runtimeType != other.runtimeType) {
      return false;
    }
    final l$visits_by_pk = visits_by_pk;
    final lOther$visits_by_pk = other.visits_by_pk;
    if (l$visits_by_pk != lOther$visits_by_pk) {
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

extension UtilityExtension$Query$GetVisitorDetails on Query$GetVisitorDetails {
  CopyWith$Query$GetVisitorDetails<Query$GetVisitorDetails> get copyWith =>
      CopyWith$Query$GetVisitorDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetVisitorDetails<TRes> {
  factory CopyWith$Query$GetVisitorDetails(
    Query$GetVisitorDetails instance,
    TRes Function(Query$GetVisitorDetails) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails;

  factory CopyWith$Query$GetVisitorDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails;

  TRes call({
    Query$GetVisitorDetails$visits_by_pk? visits_by_pk,
    String? $__typename,
  });
  CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> get visits_by_pk;
}

class _CopyWithImpl$Query$GetVisitorDetails<TRes>
    implements CopyWith$Query$GetVisitorDetails<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails _instance;

  final TRes Function(Query$GetVisitorDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? visits_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails(
        visits_by_pk: visits_by_pk == _undefined
            ? _instance.visits_by_pk
            : (visits_by_pk as Query$GetVisitorDetails$visits_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> get visits_by_pk {
    final local$visits_by_pk = _instance.visits_by_pk;
    return local$visits_by_pk == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk.stub(_then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk(
            local$visits_by_pk, (e) => call(visits_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$GetVisitorDetails<TRes>
    implements CopyWith$Query$GetVisitorDetails<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails(this._res);

  TRes _res;

  call({
    Query$GetVisitorDetails$visits_by_pk? visits_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> get visits_by_pk =>
      CopyWith$Query$GetVisitorDetails$visits_by_pk.stub(_res);
}

const documentNodeQueryGetVisitorDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetVisitorDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'visits_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'department'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'text_content'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'content'),
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
          FieldNode(
            name: NameNode(value: 'employee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
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
                name: NameNode(value: 'firstname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'function'),
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
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'text_content'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'content'),
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
          FieldNode(
            name: NameNode(value: 'vehicle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'visitorByVisitor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_number'),
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
                name: NameNode(value: 'firstname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone_number'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'fileByPhoto'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'file_url'),
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
          FieldNode(
            name: NameNode(value: 'reason'),
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
            name: NameNode(value: 'reg_no'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'check_out_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'check_in_at'),
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
Query$GetVisitorDetails _parserFn$Query$GetVisitorDetails(
        Map<String, dynamic> data) =>
    Query$GetVisitorDetails.fromJson(data);
typedef OnQueryComplete$Query$GetVisitorDetails = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetVisitorDetails?,
);

class Options$Query$GetVisitorDetails
    extends graphql.QueryOptions<Query$GetVisitorDetails> {
  Options$Query$GetVisitorDetails({
    String? operationName,
    required Variables$Query$GetVisitorDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetVisitorDetails? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetVisitorDetails? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetVisitorDetails(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetVisitorDetails,
          parserFn: _parserFn$Query$GetVisitorDetails,
        );

  final OnQueryComplete$Query$GetVisitorDetails? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetVisitorDetails
    extends graphql.WatchQueryOptions<Query$GetVisitorDetails> {
  WatchOptions$Query$GetVisitorDetails({
    String? operationName,
    required Variables$Query$GetVisitorDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetVisitorDetails? typedOptimisticResult,
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
          document: documentNodeQueryGetVisitorDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetVisitorDetails,
        );
}

class FetchMoreOptions$Query$GetVisitorDetails
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetVisitorDetails({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetVisitorDetails variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetVisitorDetails,
        );
}

extension ClientExtension$Query$GetVisitorDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetVisitorDetails>> query$GetVisitorDetails(
          Options$Query$GetVisitorDetails options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetVisitorDetails> watchQuery$GetVisitorDetails(
          WatchOptions$Query$GetVisitorDetails options) =>
      this.watchQuery(options);
  void writeQuery$GetVisitorDetails({
    required Query$GetVisitorDetails data,
    required Variables$Query$GetVisitorDetails variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetVisitorDetails),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetVisitorDetails? readQuery$GetVisitorDetails({
    required Variables$Query$GetVisitorDetails variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetVisitorDetails),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetVisitorDetails.fromJson(result);
  }
}

class Query$GetVisitorDetails$visits_by_pk {
  Query$GetVisitorDetails$visits_by_pk({
    this.department,
    this.employee,
    this.service,
    this.vehicle,
    this.status,
    required this.visitorByVisitor,
    this.reason,
    required this.id,
    this.reg_no,
    this.date,
    this.check_out_at,
    this.check_in_at,
    this.$__typename = 'visits',
  });

  factory Query$GetVisitorDetails$visits_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$department = json['department'];
    final l$employee = json['employee'];
    final l$service = json['service'];
    final l$vehicle = json['vehicle'];
    final l$status = json['status'];
    final l$visitorByVisitor = json['visitorByVisitor'];
    final l$reason = json['reason'];
    final l$id = json['id'];
    final l$reg_no = json['reg_no'];
    final l$date = json['date'];
    final l$check_out_at = json['check_out_at'];
    final l$check_in_at = json['check_in_at'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk(
      department: l$department == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$department.fromJson(
              (l$department as Map<String, dynamic>)),
      employee: l$employee == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$employee.fromJson(
              (l$employee as Map<String, dynamic>)),
      service: l$service == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$service.fromJson(
              (l$service as Map<String, dynamic>)),
      vehicle: (l$vehicle as String?),
      status: l$status == null
          ? null
          : fromJson$Enum$visit_status_enum((l$status as String)),
      visitorByVisitor:
          Query$GetVisitorDetails$visits_by_pk$visitorByVisitor.fromJson(
              (l$visitorByVisitor as Map<String, dynamic>)),
      reason: (l$reason as String?),
      id: (l$id as String),
      reg_no: (l$reg_no as String?),
      date: (l$date as String?),
      check_out_at: (l$check_out_at as String?),
      check_in_at: (l$check_in_at as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetVisitorDetails$visits_by_pk$department? department;

  final Query$GetVisitorDetails$visits_by_pk$employee? employee;

  final Query$GetVisitorDetails$visits_by_pk$service? service;

  final String? vehicle;

  final Enum$visit_status_enum? status;

  final Query$GetVisitorDetails$visits_by_pk$visitorByVisitor visitorByVisitor;

  final String? reason;

  final String id;

  final String? reg_no;

  final String? date;

  final String? check_out_at;

  final String? check_in_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$department = department;
    _resultData['department'] = l$department?.toJson();
    final l$employee = employee;
    _resultData['employee'] = l$employee?.toJson();
    final l$service = service;
    _resultData['service'] = l$service?.toJson();
    final l$vehicle = vehicle;
    _resultData['vehicle'] = l$vehicle;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$visit_status_enum(l$status);
    final l$visitorByVisitor = visitorByVisitor;
    _resultData['visitorByVisitor'] = l$visitorByVisitor.toJson();
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$reg_no = reg_no;
    _resultData['reg_no'] = l$reg_no;
    final l$date = date;
    _resultData['date'] = l$date;
    final l$check_out_at = check_out_at;
    _resultData['check_out_at'] = l$check_out_at;
    final l$check_in_at = check_in_at;
    _resultData['check_in_at'] = l$check_in_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$department = department;
    final l$employee = employee;
    final l$service = service;
    final l$vehicle = vehicle;
    final l$status = status;
    final l$visitorByVisitor = visitorByVisitor;
    final l$reason = reason;
    final l$id = id;
    final l$reg_no = reg_no;
    final l$date = date;
    final l$check_out_at = check_out_at;
    final l$check_in_at = check_in_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$department,
      l$employee,
      l$service,
      l$vehicle,
      l$status,
      l$visitorByVisitor,
      l$reason,
      l$id,
      l$reg_no,
      l$date,
      l$check_out_at,
      l$check_in_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$department = department;
    final lOther$department = other.department;
    if (l$department != lOther$department) {
      return false;
    }
    final l$employee = employee;
    final lOther$employee = other.employee;
    if (l$employee != lOther$employee) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
      return false;
    }
    final l$vehicle = vehicle;
    final lOther$vehicle = other.vehicle;
    if (l$vehicle != lOther$vehicle) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$visitorByVisitor = visitorByVisitor;
    final lOther$visitorByVisitor = other.visitorByVisitor;
    if (l$visitorByVisitor != lOther$visitorByVisitor) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reg_no = reg_no;
    final lOther$reg_no = other.reg_no;
    if (l$reg_no != lOther$reg_no) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$check_out_at = check_out_at;
    final lOther$check_out_at = other.check_out_at;
    if (l$check_out_at != lOther$check_out_at) {
      return false;
    }
    final l$check_in_at = check_in_at;
    final lOther$check_in_at = other.check_in_at;
    if (l$check_in_at != lOther$check_in_at) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk
    on Query$GetVisitorDetails$visits_by_pk {
  CopyWith$Query$GetVisitorDetails$visits_by_pk<
          Query$GetVisitorDetails$visits_by_pk>
      get copyWith => CopyWith$Query$GetVisitorDetails$visits_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk(
    Query$GetVisitorDetails$visits_by_pk instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk;

  TRes call({
    Query$GetVisitorDetails$visits_by_pk$department? department,
    Query$GetVisitorDetails$visits_by_pk$employee? employee,
    Query$GetVisitorDetails$visits_by_pk$service? service,
    String? vehicle,
    Enum$visit_status_enum? status,
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor? visitorByVisitor,
    String? reason,
    String? id,
    String? reg_no,
    String? date,
    String? check_out_at,
    String? check_in_at,
    String? $__typename,
  });
  CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes> get department;
  CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> get employee;
  CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> get service;
  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes>
      get visitorByVisitor;
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? department = _undefined,
    Object? employee = _undefined,
    Object? service = _undefined,
    Object? vehicle = _undefined,
    Object? status = _undefined,
    Object? visitorByVisitor = _undefined,
    Object? reason = _undefined,
    Object? id = _undefined,
    Object? reg_no = _undefined,
    Object? date = _undefined,
    Object? check_out_at = _undefined,
    Object? check_in_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk(
        department: department == _undefined
            ? _instance.department
            : (department as Query$GetVisitorDetails$visits_by_pk$department?),
        employee: employee == _undefined
            ? _instance.employee
            : (employee as Query$GetVisitorDetails$visits_by_pk$employee?),
        service: service == _undefined
            ? _instance.service
            : (service as Query$GetVisitorDetails$visits_by_pk$service?),
        vehicle:
            vehicle == _undefined ? _instance.vehicle : (vehicle as String?),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$visit_status_enum?),
        visitorByVisitor:
            visitorByVisitor == _undefined || visitorByVisitor == null
                ? _instance.visitorByVisitor
                : (visitorByVisitor
                    as Query$GetVisitorDetails$visits_by_pk$visitorByVisitor),
        reason: reason == _undefined ? _instance.reason : (reason as String?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        reg_no: reg_no == _undefined ? _instance.reg_no : (reg_no as String?),
        date: date == _undefined ? _instance.date : (date as String?),
        check_out_at: check_out_at == _undefined
            ? _instance.check_out_at
            : (check_out_at as String?),
        check_in_at: check_in_at == _undefined
            ? _instance.check_in_at
            : (check_in_at as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes>
      get department {
    final local$department = _instance.department;
    return local$department == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$department.stub(
            _then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$department(
            local$department, (e) => call(department: e));
  }

  CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> get employee {
    final local$employee = _instance.employee;
    return local$employee == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$employee.stub(
            _then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$employee(
            local$employee, (e) => call(employee: e));
  }

  CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> get service {
    final local$service = _instance.service;
    return local$service == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$service.stub(
            _then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$service(
            local$service, (e) => call(service: e));
  }

  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes>
      get visitorByVisitor {
    final local$visitorByVisitor = _instance.visitorByVisitor;
    return CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
        local$visitorByVisitor, (e) => call(visitorByVisitor: e));
  }
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk(this._res);

  TRes _res;

  call({
    Query$GetVisitorDetails$visits_by_pk$department? department,
    Query$GetVisitorDetails$visits_by_pk$employee? employee,
    Query$GetVisitorDetails$visits_by_pk$service? service,
    String? vehicle,
    Enum$visit_status_enum? status,
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor? visitorByVisitor,
    String? reason,
    String? id,
    String? reg_no,
    String? date,
    String? check_out_at,
    String? check_in_at,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes>
      get department =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$department.stub(_res);

  CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> get employee =>
      CopyWith$Query$GetVisitorDetails$visits_by_pk$employee.stub(_res);

  CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> get service =>
      CopyWith$Query$GetVisitorDetails$visits_by_pk$service.stub(_res);

  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes>
      get visitorByVisitor =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor.stub(
              _res);
}

class Query$GetVisitorDetails$visits_by_pk$department {
  Query$GetVisitorDetails$visits_by_pk$department({
    required this.id,
    this.text_content,
    this.$__typename = 'departments',
  });

  factory Query$GetVisitorDetails$visits_by_pk$department.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text_content = json['text_content'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$department(
      id: (l$id as String),
      text_content: l$text_content == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$department$text_content
              .fromJson((l$text_content as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetVisitorDetails$visits_by_pk$department$text_content?
      text_content;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text_content = text_content;
    _resultData['text_content'] = l$text_content?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text_content = text_content;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text_content,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk$department ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text_content = text_content;
    final lOther$text_content = other.text_content;
    if (l$text_content != lOther$text_content) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$department
    on Query$GetVisitorDetails$visits_by_pk$department {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$department<
          Query$GetVisitorDetails$visits_by_pk$department>
      get copyWith => CopyWith$Query$GetVisitorDetails$visits_by_pk$department(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$department(
    Query$GetVisitorDetails$visits_by_pk$department instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$department) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$department.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department;

  TRes call({
    String? id,
    Query$GetVisitorDetails$visits_by_pk$department$text_content? text_content,
    String? $__typename,
  });
  CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<TRes>
      get text_content;
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$department _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk$department) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text_content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$department(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text_content: text_content == _undefined
            ? _instance.text_content
            : (text_content
                as Query$GetVisitorDetails$visits_by_pk$department$text_content?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<TRes>
      get text_content {
    final local$text_content = _instance.text_content;
    return local$text_content == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content
            .stub(_then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content(
            local$text_content, (e) => call(text_content: e));
  }
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$department<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetVisitorDetails$visits_by_pk$department$text_content? text_content,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<TRes>
      get text_content =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content
              .stub(_res);
}

class Query$GetVisitorDetails$visits_by_pk$department$text_content {
  Query$GetVisitorDetails$visits_by_pk$department$text_content({
    required this.content,
    this.$__typename = 'text_content',
  });

  factory Query$GetVisitorDetails$visits_by_pk$department$text_content.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$department$text_content(
      content: (l$content as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String content;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$content = content;
    _resultData['content'] = l$content;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$content,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetVisitorDetails$visits_by_pk$department$text_content ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$department$text_content
    on Query$GetVisitorDetails$visits_by_pk$department$text_content {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<
          Query$GetVisitorDetails$visits_by_pk$department$text_content>
      get copyWith =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<
    TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content(
    Query$GetVisitorDetails$visits_by_pk$department$text_content instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$department$text_content)
        then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content;

  TRes call({
    String? content,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<
            TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$department$text_content _instance;

  final TRes Function(
      Query$GetVisitorDetails$visits_by_pk$department$text_content) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$department$text_content(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$department$text_content<
            TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$department$text_content(
      this._res);

  TRes _res;

  call({
    String? content,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetVisitorDetails$visits_by_pk$employee {
  Query$GetVisitorDetails$visits_by_pk$employee({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.function,
    this.$__typename = 'employees',
  });

  factory Query$GetVisitorDetails$visits_by_pk$employee.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lastname = json['lastname'];
    final l$firstname = json['firstname'];
    final l$function = json['function'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$employee(
      id: (l$id as String),
      lastname: (l$lastname as String),
      firstname: (l$firstname as String),
      function: (l$function as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String lastname;

  final String firstname;

  final String function;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$function = function;
    _resultData['function'] = l$function;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$lastname = lastname;
    final l$firstname = firstname;
    final l$function = function;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$lastname,
      l$firstname,
      l$function,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk$employee ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$lastname = lastname;
    final lOther$lastname = other.lastname;
    if (l$lastname != lOther$lastname) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (l$firstname != lOther$firstname) {
      return false;
    }
    final l$function = function;
    final lOther$function = other.function;
    if (l$function != lOther$function) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$employee
    on Query$GetVisitorDetails$visits_by_pk$employee {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<
          Query$GetVisitorDetails$visits_by_pk$employee>
      get copyWith => CopyWith$Query$GetVisitorDetails$visits_by_pk$employee(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$employee(
    Query$GetVisitorDetails$visits_by_pk$employee instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$employee) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$employee;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$employee.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$employee;

  TRes call({
    String? id,
    String? lastname,
    String? firstname,
    String? function,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$employee<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$employee(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$employee _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk$employee) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? lastname = _undefined,
    Object? firstname = _undefined,
    Object? function = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$employee(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lastname: lastname == _undefined || lastname == null
            ? _instance.lastname
            : (lastname as String),
        firstname: firstname == _undefined || firstname == null
            ? _instance.firstname
            : (firstname as String),
        function: function == _undefined || function == null
            ? _instance.function
            : (function as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$employee<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$employee<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$employee(this._res);

  TRes _res;

  call({
    String? id,
    String? lastname,
    String? firstname,
    String? function,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetVisitorDetails$visits_by_pk$service {
  Query$GetVisitorDetails$visits_by_pk$service({
    required this.id,
    this.text_content,
    this.$__typename = 'services',
  });

  factory Query$GetVisitorDetails$visits_by_pk$service.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text_content = json['text_content'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$service(
      id: (l$id as String),
      text_content: l$text_content == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$service$text_content.fromJson(
              (l$text_content as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetVisitorDetails$visits_by_pk$service$text_content? text_content;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text_content = text_content;
    _resultData['text_content'] = l$text_content?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text_content = text_content;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text_content,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk$service ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text_content = text_content;
    final lOther$text_content = other.text_content;
    if (l$text_content != lOther$text_content) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$service
    on Query$GetVisitorDetails$visits_by_pk$service {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$service<
          Query$GetVisitorDetails$visits_by_pk$service>
      get copyWith => CopyWith$Query$GetVisitorDetails$visits_by_pk$service(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$service(
    Query$GetVisitorDetails$visits_by_pk$service instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$service) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$service.stub(TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service;

  TRes call({
    String? id,
    Query$GetVisitorDetails$visits_by_pk$service$text_content? text_content,
    String? $__typename,
  });
  CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<TRes>
      get text_content;
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$service _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk$service) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text_content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$service(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text_content: text_content == _undefined
            ? _instance.text_content
            : (text_content
                as Query$GetVisitorDetails$visits_by_pk$service$text_content?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<TRes>
      get text_content {
    final local$text_content = _instance.text_content;
    return local$text_content == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content
            .stub(_then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content(
            local$text_content, (e) => call(text_content: e));
  }
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service<TRes>
    implements CopyWith$Query$GetVisitorDetails$visits_by_pk$service<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetVisitorDetails$visits_by_pk$service$text_content? text_content,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<TRes>
      get text_content =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content
              .stub(_res);
}

class Query$GetVisitorDetails$visits_by_pk$service$text_content {
  Query$GetVisitorDetails$visits_by_pk$service$text_content({
    required this.content,
    this.$__typename = 'text_content',
  });

  factory Query$GetVisitorDetails$visits_by_pk$service$text_content.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$service$text_content(
      content: (l$content as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String content;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$content = content;
    _resultData['content'] = l$content;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$content,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk$service$text_content ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$service$text_content
    on Query$GetVisitorDetails$visits_by_pk$service$text_content {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<
          Query$GetVisitorDetails$visits_by_pk$service$text_content>
      get copyWith =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<
    TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content(
    Query$GetVisitorDetails$visits_by_pk$service$text_content instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$service$text_content)
        then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content;

  TRes call({
    String? content,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<
            TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$service$text_content _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk$service$text_content)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$service$text_content(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$service$text_content<
            TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$service$text_content(
      this._res);

  TRes _res;

  call({
    String? content,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetVisitorDetails$visits_by_pk$visitorByVisitor {
  Query$GetVisitorDetails$visits_by_pk$visitorByVisitor({
    required this.id,
    this.id_number,
    this.lastname,
    this.firstname,
    this.phone_number,
    this.fileByPhoto,
    this.$__typename = 'visitors',
  });

  factory Query$GetVisitorDetails$visits_by_pk$visitorByVisitor.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$id_number = json['id_number'];
    final l$lastname = json['lastname'];
    final l$firstname = json['firstname'];
    final l$phone_number = json['phone_number'];
    final l$fileByPhoto = json['fileByPhoto'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
      id: (l$id as String),
      id_number: (l$id_number as String?),
      lastname: (l$lastname as String?),
      firstname: (l$firstname as String?),
      phone_number: (l$phone_number as String?),
      fileByPhoto: l$fileByPhoto == null
          ? null
          : Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto
              .fromJson((l$fileByPhoto as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? id_number;

  final String? lastname;

  final String? firstname;

  final String? phone_number;

  final Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto?
      fileByPhoto;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$id_number = id_number;
    _resultData['id_number'] = l$id_number;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$fileByPhoto = fileByPhoto;
    _resultData['fileByPhoto'] = l$fileByPhoto?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$id_number = id_number;
    final l$lastname = lastname;
    final l$firstname = firstname;
    final l$phone_number = phone_number;
    final l$fileByPhoto = fileByPhoto;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$id_number,
      l$lastname,
      l$firstname,
      l$phone_number,
      l$fileByPhoto,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetVisitorDetails$visits_by_pk$visitorByVisitor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$id_number = id_number;
    final lOther$id_number = other.id_number;
    if (l$id_number != lOther$id_number) {
      return false;
    }
    final l$lastname = lastname;
    final lOther$lastname = other.lastname;
    if (l$lastname != lOther$lastname) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (l$firstname != lOther$firstname) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$fileByPhoto = fileByPhoto;
    final lOther$fileByPhoto = other.fileByPhoto;
    if (l$fileByPhoto != lOther$fileByPhoto) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor
    on Query$GetVisitorDetails$visits_by_pk$visitorByVisitor {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<
          Query$GetVisitorDetails$visits_by_pk$visitorByVisitor>
      get copyWith =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<
    TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor instance,
    TRes Function(Query$GetVisitorDetails$visits_by_pk$visitorByVisitor) then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor;

  TRes call({
    String? id,
    String? id_number,
    String? lastname,
    String? firstname,
    String? phone_number,
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto?
        fileByPhoto,
    String? $__typename,
  });
  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
      TRes> get fileByPhoto;
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$visitorByVisitor _instance;

  final TRes Function(Query$GetVisitorDetails$visits_by_pk$visitorByVisitor)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? id_number = _undefined,
    Object? lastname = _undefined,
    Object? firstname = _undefined,
    Object? phone_number = _undefined,
    Object? fileByPhoto = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        id_number: id_number == _undefined
            ? _instance.id_number
            : (id_number as String?),
        lastname:
            lastname == _undefined ? _instance.lastname : (lastname as String?),
        firstname: firstname == _undefined
            ? _instance.firstname
            : (firstname as String?),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        fileByPhoto: fileByPhoto == _undefined
            ? _instance.fileByPhoto
            : (fileByPhoto
                as Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
      TRes> get fileByPhoto {
    final local$fileByPhoto = _instance.fileByPhoto;
    return local$fileByPhoto == null
        ? CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto
            .stub(_then(_instance))
        : CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
            local$fileByPhoto, (e) => call(fileByPhoto: e));
  }
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor<TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor(
      this._res);

  TRes _res;

  call({
    String? id,
    String? id_number,
    String? lastname,
    String? firstname,
    String? phone_number,
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto?
        fileByPhoto,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
          TRes>
      get fileByPhoto =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto
              .stub(_res);
}

class Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto {
  Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto({
    this.file_url,
    required this.id,
    this.$__typename = 'files',
  });

  factory Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto.fromJson(
      Map<String, dynamic> json) {
    final l$file_url = json['file_url'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
      file_url: (l$file_url as String?),
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String? file_url;

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$file_url = file_url;
    _resultData['file_url'] = l$file_url;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$file_url = file_url;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$file_url,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_url = file_url;
    final lOther$file_url = other.file_url;
    if (l$file_url != lOther$file_url) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto
    on Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto {
  CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
          Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto>
      get copyWith =>
          CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
    TRes> {
  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
    Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto instance,
    TRes Function(
            Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto)
        then,
  ) = _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto;

  factory CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto;

  TRes call({
    String? file_url,
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
            TRes> {
  _CopyWithImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
    this._instance,
    this._then,
  );

  final Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto
      _instance;

  final TRes Function(
      Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_url = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
        file_url:
            file_url == _undefined ? _instance.file_url : (file_url as String?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
        TRes>
    implements
        CopyWith$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto<
            TRes> {
  _CopyWithStubImpl$Query$GetVisitorDetails$visits_by_pk$visitorByVisitor$fileByPhoto(
      this._res);

  TRes _res;

  call({
    String? file_url,
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ClockOutVisits {
  factory Variables$Mutation$ClockOutVisits({required String id}) =>
      Variables$Mutation$ClockOutVisits._({
        r'id': id,
      });

  Variables$Mutation$ClockOutVisits._(this._$data);

  factory Variables$Mutation$ClockOutVisits.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$ClockOutVisits._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ClockOutVisits<Variables$Mutation$ClockOutVisits>
      get copyWith => CopyWith$Variables$Mutation$ClockOutVisits(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ClockOutVisits ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$ClockOutVisits<TRes> {
  factory CopyWith$Variables$Mutation$ClockOutVisits(
    Variables$Mutation$ClockOutVisits instance,
    TRes Function(Variables$Mutation$ClockOutVisits) then,
  ) = _CopyWithImpl$Variables$Mutation$ClockOutVisits;

  factory CopyWith$Variables$Mutation$ClockOutVisits.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ClockOutVisits;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$ClockOutVisits<TRes>
    implements CopyWith$Variables$Mutation$ClockOutVisits<TRes> {
  _CopyWithImpl$Variables$Mutation$ClockOutVisits(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ClockOutVisits _instance;

  final TRes Function(Variables$Mutation$ClockOutVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$ClockOutVisits._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ClockOutVisits<TRes>
    implements CopyWith$Variables$Mutation$ClockOutVisits<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ClockOutVisits(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$ClockOutVisits {
  Mutation$ClockOutVisits({
    this.update_visits_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$ClockOutVisits.fromJson(Map<String, dynamic> json) {
    final l$update_visits_by_pk = json['update_visits_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockOutVisits(
      update_visits_by_pk: l$update_visits_by_pk == null
          ? null
          : Mutation$ClockOutVisits$update_visits_by_pk.fromJson(
              (l$update_visits_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ClockOutVisits$update_visits_by_pk? update_visits_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_visits_by_pk = update_visits_by_pk;
    _resultData['update_visits_by_pk'] = l$update_visits_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_visits_by_pk = update_visits_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_visits_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ClockOutVisits || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_visits_by_pk = update_visits_by_pk;
    final lOther$update_visits_by_pk = other.update_visits_by_pk;
    if (l$update_visits_by_pk != lOther$update_visits_by_pk) {
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

extension UtilityExtension$Mutation$ClockOutVisits on Mutation$ClockOutVisits {
  CopyWith$Mutation$ClockOutVisits<Mutation$ClockOutVisits> get copyWith =>
      CopyWith$Mutation$ClockOutVisits(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ClockOutVisits<TRes> {
  factory CopyWith$Mutation$ClockOutVisits(
    Mutation$ClockOutVisits instance,
    TRes Function(Mutation$ClockOutVisits) then,
  ) = _CopyWithImpl$Mutation$ClockOutVisits;

  factory CopyWith$Mutation$ClockOutVisits.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockOutVisits;

  TRes call({
    Mutation$ClockOutVisits$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes>
      get update_visits_by_pk;
}

class _CopyWithImpl$Mutation$ClockOutVisits<TRes>
    implements CopyWith$Mutation$ClockOutVisits<TRes> {
  _CopyWithImpl$Mutation$ClockOutVisits(
    this._instance,
    this._then,
  );

  final Mutation$ClockOutVisits _instance;

  final TRes Function(Mutation$ClockOutVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_visits_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockOutVisits(
        update_visits_by_pk: update_visits_by_pk == _undefined
            ? _instance.update_visits_by_pk
            : (update_visits_by_pk
                as Mutation$ClockOutVisits$update_visits_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes>
      get update_visits_by_pk {
    final local$update_visits_by_pk = _instance.update_visits_by_pk;
    return local$update_visits_by_pk == null
        ? CopyWith$Mutation$ClockOutVisits$update_visits_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$ClockOutVisits$update_visits_by_pk(
            local$update_visits_by_pk, (e) => call(update_visits_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$ClockOutVisits<TRes>
    implements CopyWith$Mutation$ClockOutVisits<TRes> {
  _CopyWithStubImpl$Mutation$ClockOutVisits(this._res);

  TRes _res;

  call({
    Mutation$ClockOutVisits$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes>
      get update_visits_by_pk =>
          CopyWith$Mutation$ClockOutVisits$update_visits_by_pk.stub(_res);
}

const documentNodeMutationClockOutVisits = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ClockOutVisits'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_visits_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'check_out_at'),
                value: EnumValueNode(name: NameNode(value: 'now')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
Mutation$ClockOutVisits _parserFn$Mutation$ClockOutVisits(
        Map<String, dynamic> data) =>
    Mutation$ClockOutVisits.fromJson(data);
typedef OnMutationCompleted$Mutation$ClockOutVisits = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ClockOutVisits?,
);

class Options$Mutation$ClockOutVisits
    extends graphql.MutationOptions<Mutation$ClockOutVisits> {
  Options$Mutation$ClockOutVisits({
    String? operationName,
    required Variables$Mutation$ClockOutVisits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockOutVisits? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ClockOutVisits? onCompleted,
    graphql.OnMutationUpdate<Mutation$ClockOutVisits>? update,
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
                        : _parserFn$Mutation$ClockOutVisits(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationClockOutVisits,
          parserFn: _parserFn$Mutation$ClockOutVisits,
        );

  final OnMutationCompleted$Mutation$ClockOutVisits? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ClockOutVisits
    extends graphql.WatchQueryOptions<Mutation$ClockOutVisits> {
  WatchOptions$Mutation$ClockOutVisits({
    String? operationName,
    required Variables$Mutation$ClockOutVisits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockOutVisits? typedOptimisticResult,
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
          document: documentNodeMutationClockOutVisits,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ClockOutVisits,
        );
}

extension ClientExtension$Mutation$ClockOutVisits on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ClockOutVisits>> mutate$ClockOutVisits(
          Options$Mutation$ClockOutVisits options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ClockOutVisits> watchMutation$ClockOutVisits(
          WatchOptions$Mutation$ClockOutVisits options) =>
      this.watchMutation(options);
}

class Mutation$ClockOutVisits$update_visits_by_pk {
  Mutation$ClockOutVisits$update_visits_by_pk({
    required this.id,
    this.$__typename = 'visits',
  });

  factory Mutation$ClockOutVisits$update_visits_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockOutVisits$update_visits_by_pk(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ClockOutVisits$update_visits_by_pk ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$ClockOutVisits$update_visits_by_pk
    on Mutation$ClockOutVisits$update_visits_by_pk {
  CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<
          Mutation$ClockOutVisits$update_visits_by_pk>
      get copyWith => CopyWith$Mutation$ClockOutVisits$update_visits_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes> {
  factory CopyWith$Mutation$ClockOutVisits$update_visits_by_pk(
    Mutation$ClockOutVisits$update_visits_by_pk instance,
    TRes Function(Mutation$ClockOutVisits$update_visits_by_pk) then,
  ) = _CopyWithImpl$Mutation$ClockOutVisits$update_visits_by_pk;

  factory CopyWith$Mutation$ClockOutVisits$update_visits_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockOutVisits$update_visits_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ClockOutVisits$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes> {
  _CopyWithImpl$Mutation$ClockOutVisits$update_visits_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$ClockOutVisits$update_visits_by_pk _instance;

  final TRes Function(Mutation$ClockOutVisits$update_visits_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockOutVisits$update_visits_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ClockOutVisits$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$ClockOutVisits$update_visits_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$ClockOutVisits$update_visits_by_pk(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AcceptVisit {
  factory Variables$Mutation$AcceptVisit({required String id}) =>
      Variables$Mutation$AcceptVisit._({
        r'id': id,
      });

  Variables$Mutation$AcceptVisit._(this._$data);

  factory Variables$Mutation$AcceptVisit.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$AcceptVisit._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$AcceptVisit<Variables$Mutation$AcceptVisit>
      get copyWith => CopyWith$Variables$Mutation$AcceptVisit(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AcceptVisit ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$AcceptVisit<TRes> {
  factory CopyWith$Variables$Mutation$AcceptVisit(
    Variables$Mutation$AcceptVisit instance,
    TRes Function(Variables$Mutation$AcceptVisit) then,
  ) = _CopyWithImpl$Variables$Mutation$AcceptVisit;

  factory CopyWith$Variables$Mutation$AcceptVisit.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AcceptVisit;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$AcceptVisit<TRes>
    implements CopyWith$Variables$Mutation$AcceptVisit<TRes> {
  _CopyWithImpl$Variables$Mutation$AcceptVisit(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AcceptVisit _instance;

  final TRes Function(Variables$Mutation$AcceptVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$AcceptVisit._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AcceptVisit<TRes>
    implements CopyWith$Variables$Mutation$AcceptVisit<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AcceptVisit(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$AcceptVisit {
  Mutation$AcceptVisit({
    this.update_visits_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$AcceptVisit.fromJson(Map<String, dynamic> json) {
    final l$update_visits_by_pk = json['update_visits_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$AcceptVisit(
      update_visits_by_pk: l$update_visits_by_pk == null
          ? null
          : Mutation$AcceptVisit$update_visits_by_pk.fromJson(
              (l$update_visits_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AcceptVisit$update_visits_by_pk? update_visits_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_visits_by_pk = update_visits_by_pk;
    _resultData['update_visits_by_pk'] = l$update_visits_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_visits_by_pk = update_visits_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_visits_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AcceptVisit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_visits_by_pk = update_visits_by_pk;
    final lOther$update_visits_by_pk = other.update_visits_by_pk;
    if (l$update_visits_by_pk != lOther$update_visits_by_pk) {
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

extension UtilityExtension$Mutation$AcceptVisit on Mutation$AcceptVisit {
  CopyWith$Mutation$AcceptVisit<Mutation$AcceptVisit> get copyWith =>
      CopyWith$Mutation$AcceptVisit(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AcceptVisit<TRes> {
  factory CopyWith$Mutation$AcceptVisit(
    Mutation$AcceptVisit instance,
    TRes Function(Mutation$AcceptVisit) then,
  ) = _CopyWithImpl$Mutation$AcceptVisit;

  factory CopyWith$Mutation$AcceptVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AcceptVisit;

  TRes call({
    Mutation$AcceptVisit$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk;
}

class _CopyWithImpl$Mutation$AcceptVisit<TRes>
    implements CopyWith$Mutation$AcceptVisit<TRes> {
  _CopyWithImpl$Mutation$AcceptVisit(
    this._instance,
    this._then,
  );

  final Mutation$AcceptVisit _instance;

  final TRes Function(Mutation$AcceptVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_visits_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AcceptVisit(
        update_visits_by_pk: update_visits_by_pk == _undefined
            ? _instance.update_visits_by_pk
            : (update_visits_by_pk
                as Mutation$AcceptVisit$update_visits_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk {
    final local$update_visits_by_pk = _instance.update_visits_by_pk;
    return local$update_visits_by_pk == null
        ? CopyWith$Mutation$AcceptVisit$update_visits_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$AcceptVisit$update_visits_by_pk(
            local$update_visits_by_pk, (e) => call(update_visits_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$AcceptVisit<TRes>
    implements CopyWith$Mutation$AcceptVisit<TRes> {
  _CopyWithStubImpl$Mutation$AcceptVisit(this._res);

  TRes _res;

  call({
    Mutation$AcceptVisit$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk =>
          CopyWith$Mutation$AcceptVisit$update_visits_by_pk.stub(_res);
}

const documentNodeMutationAcceptVisit = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AcceptVisit'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_visits_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: EnumValueNode(name: NameNode(value: 'ACCEPTED')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'check_in_at'),
                value: EnumValueNode(name: NameNode(value: 'now')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: EnumValueNode(name: NameNode(value: 'now')),
              ),
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
Mutation$AcceptVisit _parserFn$Mutation$AcceptVisit(
        Map<String, dynamic> data) =>
    Mutation$AcceptVisit.fromJson(data);
typedef OnMutationCompleted$Mutation$AcceptVisit = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AcceptVisit?,
);

class Options$Mutation$AcceptVisit
    extends graphql.MutationOptions<Mutation$AcceptVisit> {
  Options$Mutation$AcceptVisit({
    String? operationName,
    required Variables$Mutation$AcceptVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptVisit? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AcceptVisit? onCompleted,
    graphql.OnMutationUpdate<Mutation$AcceptVisit>? update,
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
                    data == null ? null : _parserFn$Mutation$AcceptVisit(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAcceptVisit,
          parserFn: _parserFn$Mutation$AcceptVisit,
        );

  final OnMutationCompleted$Mutation$AcceptVisit? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AcceptVisit
    extends graphql.WatchQueryOptions<Mutation$AcceptVisit> {
  WatchOptions$Mutation$AcceptVisit({
    String? operationName,
    required Variables$Mutation$AcceptVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptVisit? typedOptimisticResult,
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
          document: documentNodeMutationAcceptVisit,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AcceptVisit,
        );
}

extension ClientExtension$Mutation$AcceptVisit on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AcceptVisit>> mutate$AcceptVisit(
          Options$Mutation$AcceptVisit options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AcceptVisit> watchMutation$AcceptVisit(
          WatchOptions$Mutation$AcceptVisit options) =>
      this.watchMutation(options);
}

class Mutation$AcceptVisit$update_visits_by_pk {
  Mutation$AcceptVisit$update_visits_by_pk({
    required this.id,
    this.$__typename = 'visits',
  });

  factory Mutation$AcceptVisit$update_visits_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$AcceptVisit$update_visits_by_pk(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AcceptVisit$update_visits_by_pk ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$AcceptVisit$update_visits_by_pk
    on Mutation$AcceptVisit$update_visits_by_pk {
  CopyWith$Mutation$AcceptVisit$update_visits_by_pk<
          Mutation$AcceptVisit$update_visits_by_pk>
      get copyWith => CopyWith$Mutation$AcceptVisit$update_visits_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes> {
  factory CopyWith$Mutation$AcceptVisit$update_visits_by_pk(
    Mutation$AcceptVisit$update_visits_by_pk instance,
    TRes Function(Mutation$AcceptVisit$update_visits_by_pk) then,
  ) = _CopyWithImpl$Mutation$AcceptVisit$update_visits_by_pk;

  factory CopyWith$Mutation$AcceptVisit$update_visits_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AcceptVisit$update_visits_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AcceptVisit$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes> {
  _CopyWithImpl$Mutation$AcceptVisit$update_visits_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$AcceptVisit$update_visits_by_pk _instance;

  final TRes Function(Mutation$AcceptVisit$update_visits_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AcceptVisit$update_visits_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AcceptVisit$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$AcceptVisit$update_visits_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$AcceptVisit$update_visits_by_pk(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RejectVisit {
  factory Variables$Mutation$RejectVisit({required String id}) =>
      Variables$Mutation$RejectVisit._({
        r'id': id,
      });

  Variables$Mutation$RejectVisit._(this._$data);

  factory Variables$Mutation$RejectVisit.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$RejectVisit._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$RejectVisit<Variables$Mutation$RejectVisit>
      get copyWith => CopyWith$Variables$Mutation$RejectVisit(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RejectVisit ||
        runtimeType != other.runtimeType) {
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
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$RejectVisit<TRes> {
  factory CopyWith$Variables$Mutation$RejectVisit(
    Variables$Mutation$RejectVisit instance,
    TRes Function(Variables$Mutation$RejectVisit) then,
  ) = _CopyWithImpl$Variables$Mutation$RejectVisit;

  factory CopyWith$Variables$Mutation$RejectVisit.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RejectVisit;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$RejectVisit<TRes>
    implements CopyWith$Variables$Mutation$RejectVisit<TRes> {
  _CopyWithImpl$Variables$Mutation$RejectVisit(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RejectVisit _instance;

  final TRes Function(Variables$Mutation$RejectVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$RejectVisit._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RejectVisit<TRes>
    implements CopyWith$Variables$Mutation$RejectVisit<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RejectVisit(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$RejectVisit {
  Mutation$RejectVisit({
    this.update_visits_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$RejectVisit.fromJson(Map<String, dynamic> json) {
    final l$update_visits_by_pk = json['update_visits_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$RejectVisit(
      update_visits_by_pk: l$update_visits_by_pk == null
          ? null
          : Mutation$RejectVisit$update_visits_by_pk.fromJson(
              (l$update_visits_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RejectVisit$update_visits_by_pk? update_visits_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_visits_by_pk = update_visits_by_pk;
    _resultData['update_visits_by_pk'] = l$update_visits_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_visits_by_pk = update_visits_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_visits_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RejectVisit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_visits_by_pk = update_visits_by_pk;
    final lOther$update_visits_by_pk = other.update_visits_by_pk;
    if (l$update_visits_by_pk != lOther$update_visits_by_pk) {
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

extension UtilityExtension$Mutation$RejectVisit on Mutation$RejectVisit {
  CopyWith$Mutation$RejectVisit<Mutation$RejectVisit> get copyWith =>
      CopyWith$Mutation$RejectVisit(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RejectVisit<TRes> {
  factory CopyWith$Mutation$RejectVisit(
    Mutation$RejectVisit instance,
    TRes Function(Mutation$RejectVisit) then,
  ) = _CopyWithImpl$Mutation$RejectVisit;

  factory CopyWith$Mutation$RejectVisit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RejectVisit;

  TRes call({
    Mutation$RejectVisit$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk;
}

class _CopyWithImpl$Mutation$RejectVisit<TRes>
    implements CopyWith$Mutation$RejectVisit<TRes> {
  _CopyWithImpl$Mutation$RejectVisit(
    this._instance,
    this._then,
  );

  final Mutation$RejectVisit _instance;

  final TRes Function(Mutation$RejectVisit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_visits_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RejectVisit(
        update_visits_by_pk: update_visits_by_pk == _undefined
            ? _instance.update_visits_by_pk
            : (update_visits_by_pk
                as Mutation$RejectVisit$update_visits_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk {
    final local$update_visits_by_pk = _instance.update_visits_by_pk;
    return local$update_visits_by_pk == null
        ? CopyWith$Mutation$RejectVisit$update_visits_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$RejectVisit$update_visits_by_pk(
            local$update_visits_by_pk, (e) => call(update_visits_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$RejectVisit<TRes>
    implements CopyWith$Mutation$RejectVisit<TRes> {
  _CopyWithStubImpl$Mutation$RejectVisit(this._res);

  TRes _res;

  call({
    Mutation$RejectVisit$update_visits_by_pk? update_visits_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes>
      get update_visits_by_pk =>
          CopyWith$Mutation$RejectVisit$update_visits_by_pk.stub(_res);
}

const documentNodeMutationRejectVisit = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RejectVisit'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_visits_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: EnumValueNode(name: NameNode(value: 'REJECTED')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
Mutation$RejectVisit _parserFn$Mutation$RejectVisit(
        Map<String, dynamic> data) =>
    Mutation$RejectVisit.fromJson(data);
typedef OnMutationCompleted$Mutation$RejectVisit = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RejectVisit?,
);

class Options$Mutation$RejectVisit
    extends graphql.MutationOptions<Mutation$RejectVisit> {
  Options$Mutation$RejectVisit({
    String? operationName,
    required Variables$Mutation$RejectVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RejectVisit? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RejectVisit? onCompleted,
    graphql.OnMutationUpdate<Mutation$RejectVisit>? update,
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
                    data == null ? null : _parserFn$Mutation$RejectVisit(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRejectVisit,
          parserFn: _parserFn$Mutation$RejectVisit,
        );

  final OnMutationCompleted$Mutation$RejectVisit? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RejectVisit
    extends graphql.WatchQueryOptions<Mutation$RejectVisit> {
  WatchOptions$Mutation$RejectVisit({
    String? operationName,
    required Variables$Mutation$RejectVisit variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RejectVisit? typedOptimisticResult,
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
          document: documentNodeMutationRejectVisit,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RejectVisit,
        );
}

extension ClientExtension$Mutation$RejectVisit on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RejectVisit>> mutate$RejectVisit(
          Options$Mutation$RejectVisit options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RejectVisit> watchMutation$RejectVisit(
          WatchOptions$Mutation$RejectVisit options) =>
      this.watchMutation(options);
}

class Mutation$RejectVisit$update_visits_by_pk {
  Mutation$RejectVisit$update_visits_by_pk({
    required this.id,
    this.$__typename = 'visits',
  });

  factory Mutation$RejectVisit$update_visits_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$RejectVisit$update_visits_by_pk(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RejectVisit$update_visits_by_pk ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$RejectVisit$update_visits_by_pk
    on Mutation$RejectVisit$update_visits_by_pk {
  CopyWith$Mutation$RejectVisit$update_visits_by_pk<
          Mutation$RejectVisit$update_visits_by_pk>
      get copyWith => CopyWith$Mutation$RejectVisit$update_visits_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes> {
  factory CopyWith$Mutation$RejectVisit$update_visits_by_pk(
    Mutation$RejectVisit$update_visits_by_pk instance,
    TRes Function(Mutation$RejectVisit$update_visits_by_pk) then,
  ) = _CopyWithImpl$Mutation$RejectVisit$update_visits_by_pk;

  factory CopyWith$Mutation$RejectVisit$update_visits_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RejectVisit$update_visits_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RejectVisit$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes> {
  _CopyWithImpl$Mutation$RejectVisit$update_visits_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$RejectVisit$update_visits_by_pk _instance;

  final TRes Function(Mutation$RejectVisit$update_visits_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RejectVisit$update_visits_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RejectVisit$update_visits_by_pk<TRes>
    implements CopyWith$Mutation$RejectVisit$update_visits_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$RejectVisit$update_visits_by_pk(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
