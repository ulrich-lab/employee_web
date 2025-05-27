import '../schema.graphqls.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$GetAllAppointments {
  factory Variables$Subscription$GetAllAppointments({
    required String company_id,
    String? date,
    required String employee_id,
  }) =>
      Variables$Subscription$GetAllAppointments._({
        r'company_id': company_id,
        if (date != null) r'date': date,
        r'employee_id': employee_id,
      });

  Variables$Subscription$GetAllAppointments._(this._$data);

  factory Variables$Subscription$GetAllAppointments.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$company_id = data['company_id'];
    result$data['company_id'] = (l$company_id as String);
    if (data.containsKey('date')) {
      final l$date = data['date'];
      result$data['date'] = (l$date as String?);
    }
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    return Variables$Subscription$GetAllAppointments._(result$data);
  }

  Map<String, dynamic> _$data;

  String get company_id => (_$data['company_id'] as String);

  String? get date => (_$data['date'] as String?);

  String get employee_id => (_$data['employee_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$company_id = company_id;
    result$data['company_id'] = l$company_id;
    if (_$data.containsKey('date')) {
      final l$date = date;
      result$data['date'] = l$date;
    }
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$GetAllAppointments<
          Variables$Subscription$GetAllAppointments>
      get copyWith => CopyWith$Variables$Subscription$GetAllAppointments(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$GetAllAppointments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$company_id = company_id;
    final lOther$company_id = other.company_id;
    if (l$company_id != lOther$company_id) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (_$data.containsKey('date') != other._$data.containsKey('date')) {
      return false;
    }
    if (l$date != lOther$date) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$company_id = company_id;
    final l$date = date;
    final l$employee_id = employee_id;
    return Object.hashAll([
      l$company_id,
      _$data.containsKey('date') ? l$date : const {},
      l$employee_id,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$GetAllAppointments<TRes> {
  factory CopyWith$Variables$Subscription$GetAllAppointments(
    Variables$Subscription$GetAllAppointments instance,
    TRes Function(Variables$Subscription$GetAllAppointments) then,
  ) = _CopyWithImpl$Variables$Subscription$GetAllAppointments;

  factory CopyWith$Variables$Subscription$GetAllAppointments.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$GetAllAppointments;

  TRes call({
    String? company_id,
    String? date,
    String? employee_id,
  });
}

class _CopyWithImpl$Variables$Subscription$GetAllAppointments<TRes>
    implements CopyWith$Variables$Subscription$GetAllAppointments<TRes> {
  _CopyWithImpl$Variables$Subscription$GetAllAppointments(
    this._instance,
    this._then,
  );

  final Variables$Subscription$GetAllAppointments _instance;

  final TRes Function(Variables$Subscription$GetAllAppointments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? company_id = _undefined,
    Object? date = _undefined,
    Object? employee_id = _undefined,
  }) =>
      _then(Variables$Subscription$GetAllAppointments._({
        ..._instance._$data,
        if (company_id != _undefined && company_id != null)
          'company_id': (company_id as String),
        if (date != _undefined) 'date': (date as String?),
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$GetAllAppointments<TRes>
    implements CopyWith$Variables$Subscription$GetAllAppointments<TRes> {
  _CopyWithStubImpl$Variables$Subscription$GetAllAppointments(this._res);

  TRes _res;

  call({
    String? company_id,
    String? date,
    String? employee_id,
  }) =>
      _res;
}

class Subscription$GetAllAppointments {
  Subscription$GetAllAppointments({required this.appointments});

  factory Subscription$GetAllAppointments.fromJson(Map<String, dynamic> json) {
    final l$appointments = json['appointments'];
    return Subscription$GetAllAppointments(
        appointments: (l$appointments as List<dynamic>)
            .map((e) => Subscription$GetAllAppointments$appointments.fromJson(
                (e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$GetAllAppointments$appointments> appointments;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$appointments = appointments;
    _resultData['appointments'] =
        l$appointments.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$appointments = appointments;
    return Object.hashAll([Object.hashAll(l$appointments.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetAllAppointments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$appointments = appointments;
    final lOther$appointments = other.appointments;
    if (l$appointments.length != lOther$appointments.length) {
      return false;
    }
    for (int i = 0; i < l$appointments.length; i++) {
      final l$appointments$entry = l$appointments[i];
      final lOther$appointments$entry = lOther$appointments[i];
      if (l$appointments$entry != lOther$appointments$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetAllAppointments
    on Subscription$GetAllAppointments {
  CopyWith$Subscription$GetAllAppointments<Subscription$GetAllAppointments>
      get copyWith => CopyWith$Subscription$GetAllAppointments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetAllAppointments<TRes> {
  factory CopyWith$Subscription$GetAllAppointments(
    Subscription$GetAllAppointments instance,
    TRes Function(Subscription$GetAllAppointments) then,
  ) = _CopyWithImpl$Subscription$GetAllAppointments;

  factory CopyWith$Subscription$GetAllAppointments.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetAllAppointments;

  TRes call({List<Subscription$GetAllAppointments$appointments>? appointments});
  TRes appointments(
      Iterable<Subscription$GetAllAppointments$appointments> Function(
              Iterable<
                  CopyWith$Subscription$GetAllAppointments$appointments<
                      Subscription$GetAllAppointments$appointments>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetAllAppointments<TRes>
    implements CopyWith$Subscription$GetAllAppointments<TRes> {
  _CopyWithImpl$Subscription$GetAllAppointments(
    this._instance,
    this._then,
  );

  final Subscription$GetAllAppointments _instance;

  final TRes Function(Subscription$GetAllAppointments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? appointments = _undefined}) =>
      _then(Subscription$GetAllAppointments(
          appointments: appointments == _undefined || appointments == null
              ? _instance.appointments
              : (appointments
                  as List<Subscription$GetAllAppointments$appointments>)));

  TRes appointments(
          Iterable<Subscription$GetAllAppointments$appointments> Function(
                  Iterable<
                      CopyWith$Subscription$GetAllAppointments$appointments<
                          Subscription$GetAllAppointments$appointments>>)
              _fn) =>
      call(
          appointments: _fn(_instance.appointments
              .map((e) => CopyWith$Subscription$GetAllAppointments$appointments(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetAllAppointments<TRes>
    implements CopyWith$Subscription$GetAllAppointments<TRes> {
  _CopyWithStubImpl$Subscription$GetAllAppointments(this._res);

  TRes _res;

  call({List<Subscription$GetAllAppointments$appointments>? appointments}) =>
      _res;

  appointments(_fn) => _res;
}

const documentNodeSubscriptionGetAllAppointments = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetAllAppointments'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'company_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(
            value: EnumValueNode(name: NameNode(value: 'now'))),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'appointments'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'employee'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'company_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'company_id')),
                      )
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'date'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: VariableNode(name: NameNode(value: 'date')),
                      )
                    ]),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'employee_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'employee_id')),
                      )
                    ]),
                  ),
                ]),
              ),
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
            name: NameNode(value: 'date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'employee'),
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
            name: NameNode(value: 'start_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'visitor'),
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
                name: NameNode(value: 'phone_number'),
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
      )
    ]),
  ),
]);
Subscription$GetAllAppointments _parserFn$Subscription$GetAllAppointments(
        Map<String, dynamic> data) =>
    Subscription$GetAllAppointments.fromJson(data);

class Options$Subscription$GetAllAppointments
    extends graphql.SubscriptionOptions<Subscription$GetAllAppointments> {
  Options$Subscription$GetAllAppointments({
    String? operationName,
    required Variables$Subscription$GetAllAppointments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetAllAppointments? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionGetAllAppointments,
          parserFn: _parserFn$Subscription$GetAllAppointments,
        );
}

class WatchOptions$Subscription$GetAllAppointments
    extends graphql.WatchQueryOptions<Subscription$GetAllAppointments> {
  WatchOptions$Subscription$GetAllAppointments({
    String? operationName,
    required Variables$Subscription$GetAllAppointments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetAllAppointments? typedOptimisticResult,
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
          document: documentNodeSubscriptionGetAllAppointments,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetAllAppointments,
        );
}

class FetchMoreOptions$Subscription$GetAllAppointments
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetAllAppointments({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$GetAllAppointments variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionGetAllAppointments,
        );
}

extension ClientExtension$Subscription$GetAllAppointments
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetAllAppointments>>
      subscribe$GetAllAppointments(
              Options$Subscription$GetAllAppointments options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$GetAllAppointments>
      watchSubscription$GetAllAppointments(
              WatchOptions$Subscription$GetAllAppointments options) =>
          this.watchQuery(options);
}

class Subscription$GetAllAppointments$appointments {
  Subscription$GetAllAppointments$appointments({
    required this.id,
    this.date,
    this.description,
    this.employee,
    this.status,
    this.start_time,
    this.visitor,
    this.$__typename = 'appointments',
  });

  factory Subscription$GetAllAppointments$appointments.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$date = json['date'];
    final l$description = json['description'];
    final l$employee = json['employee'];
    final l$status = json['status'];
    final l$start_time = json['start_time'];
    final l$visitor = json['visitor'];
    final l$$__typename = json['__typename'];
    return Subscription$GetAllAppointments$appointments(
      id: (l$id as String),
      date: (l$date as String?),
      description: (l$description as String?),
      employee: l$employee == null
          ? null
          : Subscription$GetAllAppointments$appointments$employee.fromJson(
              (l$employee as Map<String, dynamic>)),
      status: l$status == null
          ? null
          : fromJson$Enum$appointment_status_enum((l$status as String)),
      start_time: (l$start_time as String?),
      visitor: l$visitor == null
          ? null
          : Subscription$GetAllAppointments$appointments$visitor.fromJson(
              (l$visitor as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? date;

  final String? description;

  final Subscription$GetAllAppointments$appointments$employee? employee;

  final Enum$appointment_status_enum? status;

  final String? start_time;

  final Subscription$GetAllAppointments$appointments$visitor? visitor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$date = date;
    _resultData['date'] = l$date;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$employee = employee;
    _resultData['employee'] = l$employee?.toJson();
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$appointment_status_enum(l$status);
    final l$start_time = start_time;
    _resultData['start_time'] = l$start_time;
    final l$visitor = visitor;
    _resultData['visitor'] = l$visitor?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$date = date;
    final l$description = description;
    final l$employee = employee;
    final l$status = status;
    final l$start_time = start_time;
    final l$visitor = visitor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$date,
      l$description,
      l$employee,
      l$status,
      l$start_time,
      l$visitor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetAllAppointments$appointments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$employee = employee;
    final lOther$employee = other.employee;
    if (l$employee != lOther$employee) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$start_time = start_time;
    final lOther$start_time = other.start_time;
    if (l$start_time != lOther$start_time) {
      return false;
    }
    final l$visitor = visitor;
    final lOther$visitor = other.visitor;
    if (l$visitor != lOther$visitor) {
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

extension UtilityExtension$Subscription$GetAllAppointments$appointments
    on Subscription$GetAllAppointments$appointments {
  CopyWith$Subscription$GetAllAppointments$appointments<
          Subscription$GetAllAppointments$appointments>
      get copyWith => CopyWith$Subscription$GetAllAppointments$appointments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetAllAppointments$appointments<TRes> {
  factory CopyWith$Subscription$GetAllAppointments$appointments(
    Subscription$GetAllAppointments$appointments instance,
    TRes Function(Subscription$GetAllAppointments$appointments) then,
  ) = _CopyWithImpl$Subscription$GetAllAppointments$appointments;

  factory CopyWith$Subscription$GetAllAppointments$appointments.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetAllAppointments$appointments;

  TRes call({
    String? id,
    String? date,
    String? description,
    Subscription$GetAllAppointments$appointments$employee? employee,
    Enum$appointment_status_enum? status,
    String? start_time,
    Subscription$GetAllAppointments$appointments$visitor? visitor,
    String? $__typename,
  });
  CopyWith$Subscription$GetAllAppointments$appointments$employee<TRes>
      get employee;
  CopyWith$Subscription$GetAllAppointments$appointments$visitor<TRes>
      get visitor;
}

class _CopyWithImpl$Subscription$GetAllAppointments$appointments<TRes>
    implements CopyWith$Subscription$GetAllAppointments$appointments<TRes> {
  _CopyWithImpl$Subscription$GetAllAppointments$appointments(
    this._instance,
    this._then,
  );

  final Subscription$GetAllAppointments$appointments _instance;

  final TRes Function(Subscription$GetAllAppointments$appointments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? date = _undefined,
    Object? description = _undefined,
    Object? employee = _undefined,
    Object? status = _undefined,
    Object? start_time = _undefined,
    Object? visitor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetAllAppointments$appointments(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        date: date == _undefined ? _instance.date : (date as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        employee: employee == _undefined
            ? _instance.employee
            : (employee
                as Subscription$GetAllAppointments$appointments$employee?),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$appointment_status_enum?),
        start_time: start_time == _undefined
            ? _instance.start_time
            : (start_time as String?),
        visitor: visitor == _undefined
            ? _instance.visitor
            : (visitor
                as Subscription$GetAllAppointments$appointments$visitor?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$GetAllAppointments$appointments$employee<TRes>
      get employee {
    final local$employee = _instance.employee;
    return local$employee == null
        ? CopyWith$Subscription$GetAllAppointments$appointments$employee.stub(
            _then(_instance))
        : CopyWith$Subscription$GetAllAppointments$appointments$employee(
            local$employee, (e) => call(employee: e));
  }

  CopyWith$Subscription$GetAllAppointments$appointments$visitor<TRes>
      get visitor {
    final local$visitor = _instance.visitor;
    return local$visitor == null
        ? CopyWith$Subscription$GetAllAppointments$appointments$visitor.stub(
            _then(_instance))
        : CopyWith$Subscription$GetAllAppointments$appointments$visitor(
            local$visitor, (e) => call(visitor: e));
  }
}

class _CopyWithStubImpl$Subscription$GetAllAppointments$appointments<TRes>
    implements CopyWith$Subscription$GetAllAppointments$appointments<TRes> {
  _CopyWithStubImpl$Subscription$GetAllAppointments$appointments(this._res);

  TRes _res;

  call({
    String? id,
    String? date,
    String? description,
    Subscription$GetAllAppointments$appointments$employee? employee,
    Enum$appointment_status_enum? status,
    String? start_time,
    Subscription$GetAllAppointments$appointments$visitor? visitor,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$GetAllAppointments$appointments$employee<TRes>
      get employee =>
          CopyWith$Subscription$GetAllAppointments$appointments$employee.stub(
              _res);

  CopyWith$Subscription$GetAllAppointments$appointments$visitor<TRes>
      get visitor =>
          CopyWith$Subscription$GetAllAppointments$appointments$visitor.stub(
              _res);
}

class Subscription$GetAllAppointments$appointments$employee {
  Subscription$GetAllAppointments$appointments$employee({
    required this.firstname,
    required this.id,
    required this.lastname,
    this.$__typename = 'employees',
  });

  factory Subscription$GetAllAppointments$appointments$employee.fromJson(
      Map<String, dynamic> json) {
    final l$firstname = json['firstname'];
    final l$id = json['id'];
    final l$lastname = json['lastname'];
    final l$$__typename = json['__typename'];
    return Subscription$GetAllAppointments$appointments$employee(
      firstname: (l$firstname as String),
      id: (l$id as String),
      lastname: (l$lastname as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstname;

  final String id;

  final String lastname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firstname = firstname;
    final l$id = id;
    final l$lastname = lastname;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstname,
      l$id,
      l$lastname,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetAllAppointments$appointments$employee ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (l$firstname != lOther$firstname) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetAllAppointments$appointments$employee
    on Subscription$GetAllAppointments$appointments$employee {
  CopyWith$Subscription$GetAllAppointments$appointments$employee<
          Subscription$GetAllAppointments$appointments$employee>
      get copyWith =>
          CopyWith$Subscription$GetAllAppointments$appointments$employee(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetAllAppointments$appointments$employee<
    TRes> {
  factory CopyWith$Subscription$GetAllAppointments$appointments$employee(
    Subscription$GetAllAppointments$appointments$employee instance,
    TRes Function(Subscription$GetAllAppointments$appointments$employee) then,
  ) = _CopyWithImpl$Subscription$GetAllAppointments$appointments$employee;

  factory CopyWith$Subscription$GetAllAppointments$appointments$employee.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$employee;

  TRes call({
    String? firstname,
    String? id,
    String? lastname,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetAllAppointments$appointments$employee<TRes>
    implements
        CopyWith$Subscription$GetAllAppointments$appointments$employee<TRes> {
  _CopyWithImpl$Subscription$GetAllAppointments$appointments$employee(
    this._instance,
    this._then,
  );

  final Subscription$GetAllAppointments$appointments$employee _instance;

  final TRes Function(Subscription$GetAllAppointments$appointments$employee)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstname = _undefined,
    Object? id = _undefined,
    Object? lastname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetAllAppointments$appointments$employee(
        firstname: firstname == _undefined || firstname == null
            ? _instance.firstname
            : (firstname as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lastname: lastname == _undefined || lastname == null
            ? _instance.lastname
            : (lastname as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$employee<
        TRes>
    implements
        CopyWith$Subscription$GetAllAppointments$appointments$employee<TRes> {
  _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$employee(
      this._res);

  TRes _res;

  call({
    String? firstname,
    String? id,
    String? lastname,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetAllAppointments$appointments$visitor {
  Subscription$GetAllAppointments$appointments$visitor({
    required this.id,
    this.lastname,
    this.phone_number,
    this.firstname,
    this.$__typename = 'visitors',
  });

  factory Subscription$GetAllAppointments$appointments$visitor.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lastname = json['lastname'];
    final l$phone_number = json['phone_number'];
    final l$firstname = json['firstname'];
    final l$$__typename = json['__typename'];
    return Subscription$GetAllAppointments$appointments$visitor(
      id: (l$id as String),
      lastname: (l$lastname as String?),
      phone_number: (l$phone_number as String?),
      firstname: (l$firstname as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? lastname;

  final String? phone_number;

  final String? firstname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$lastname = lastname;
    final l$phone_number = phone_number;
    final l$firstname = firstname;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$lastname,
      l$phone_number,
      l$firstname,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetAllAppointments$appointments$visitor ||
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$firstname = firstname;
    final lOther$firstname = other.firstname;
    if (l$firstname != lOther$firstname) {
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

extension UtilityExtension$Subscription$GetAllAppointments$appointments$visitor
    on Subscription$GetAllAppointments$appointments$visitor {
  CopyWith$Subscription$GetAllAppointments$appointments$visitor<
          Subscription$GetAllAppointments$appointments$visitor>
      get copyWith =>
          CopyWith$Subscription$GetAllAppointments$appointments$visitor(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetAllAppointments$appointments$visitor<
    TRes> {
  factory CopyWith$Subscription$GetAllAppointments$appointments$visitor(
    Subscription$GetAllAppointments$appointments$visitor instance,
    TRes Function(Subscription$GetAllAppointments$appointments$visitor) then,
  ) = _CopyWithImpl$Subscription$GetAllAppointments$appointments$visitor;

  factory CopyWith$Subscription$GetAllAppointments$appointments$visitor.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$visitor;

  TRes call({
    String? id,
    String? lastname,
    String? phone_number,
    String? firstname,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetAllAppointments$appointments$visitor<TRes>
    implements
        CopyWith$Subscription$GetAllAppointments$appointments$visitor<TRes> {
  _CopyWithImpl$Subscription$GetAllAppointments$appointments$visitor(
    this._instance,
    this._then,
  );

  final Subscription$GetAllAppointments$appointments$visitor _instance;

  final TRes Function(Subscription$GetAllAppointments$appointments$visitor)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? lastname = _undefined,
    Object? phone_number = _undefined,
    Object? firstname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetAllAppointments$appointments$visitor(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lastname:
            lastname == _undefined ? _instance.lastname : (lastname as String?),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        firstname: firstname == _undefined
            ? _instance.firstname
            : (firstname as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$visitor<
        TRes>
    implements
        CopyWith$Subscription$GetAllAppointments$appointments$visitor<TRes> {
  _CopyWithStubImpl$Subscription$GetAllAppointments$appointments$visitor(
      this._res);

  TRes _res;

  call({
    String? id,
    String? lastname,
    String? phone_number,
    String? firstname,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$InsertAppintmentWithVisits {
  factory Variables$Mutation$InsertAppintmentWithVisits({
    required String employee_id,
    String? end_time,
    required String start_time,
    String? lastname,
    String? phone_number,
    String? firstname,
    String? description,
    String? date,
  }) =>
      Variables$Mutation$InsertAppintmentWithVisits._({
        r'employee_id': employee_id,
        if (end_time != null) r'end_time': end_time,
        r'start_time': start_time,
        if (lastname != null) r'lastname': lastname,
        if (phone_number != null) r'phone_number': phone_number,
        if (firstname != null) r'firstname': firstname,
        if (description != null) r'description': description,
        if (date != null) r'date': date,
      });

  Variables$Mutation$InsertAppintmentWithVisits._(this._$data);

  factory Variables$Mutation$InsertAppintmentWithVisits.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    if (data.containsKey('end_time')) {
      final l$end_time = data['end_time'];
      result$data['end_time'] = (l$end_time as String?);
    }
    final l$start_time = data['start_time'];
    result$data['start_time'] = (l$start_time as String);
    if (data.containsKey('lastname')) {
      final l$lastname = data['lastname'];
      result$data['lastname'] = (l$lastname as String?);
    }
    if (data.containsKey('phone_number')) {
      final l$phone_number = data['phone_number'];
      result$data['phone_number'] = (l$phone_number as String?);
    }
    if (data.containsKey('firstname')) {
      final l$firstname = data['firstname'];
      result$data['firstname'] = (l$firstname as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('date')) {
      final l$date = data['date'];
      result$data['date'] = (l$date as String?);
    }
    return Variables$Mutation$InsertAppintmentWithVisits._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  String? get end_time => (_$data['end_time'] as String?);

  String get start_time => (_$data['start_time'] as String);

  String? get lastname => (_$data['lastname'] as String?);

  String? get phone_number => (_$data['phone_number'] as String?);

  String? get firstname => (_$data['firstname'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get date => (_$data['date'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    if (_$data.containsKey('end_time')) {
      final l$end_time = end_time;
      result$data['end_time'] = l$end_time;
    }
    final l$start_time = start_time;
    result$data['start_time'] = l$start_time;
    if (_$data.containsKey('lastname')) {
      final l$lastname = lastname;
      result$data['lastname'] = l$lastname;
    }
    if (_$data.containsKey('phone_number')) {
      final l$phone_number = phone_number;
      result$data['phone_number'] = l$phone_number;
    }
    if (_$data.containsKey('firstname')) {
      final l$firstname = firstname;
      result$data['firstname'] = l$firstname;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('date')) {
      final l$date = date;
      result$data['date'] = l$date;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$InsertAppintmentWithVisits<
          Variables$Mutation$InsertAppintmentWithVisits>
      get copyWith => CopyWith$Variables$Mutation$InsertAppintmentWithVisits(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InsertAppintmentWithVisits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
      return false;
    }
    final l$end_time = end_time;
    final lOther$end_time = other.end_time;
    if (_$data.containsKey('end_time') !=
        other._$data.containsKey('end_time')) {
      return false;
    }
    if (l$end_time != lOther$end_time) {
      return false;
    }
    final l$start_time = start_time;
    final lOther$start_time = other.start_time;
    if (l$start_time != lOther$start_time) {
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
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (_$data.containsKey('phone_number') !=
        other._$data.containsKey('phone_number')) {
      return false;
    }
    if (l$phone_number != lOther$phone_number) {
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
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (_$data.containsKey('date') != other._$data.containsKey('date')) {
      return false;
    }
    if (l$date != lOther$date) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$employee_id = employee_id;
    final l$end_time = end_time;
    final l$start_time = start_time;
    final l$lastname = lastname;
    final l$phone_number = phone_number;
    final l$firstname = firstname;
    final l$description = description;
    final l$date = date;
    return Object.hashAll([
      l$employee_id,
      _$data.containsKey('end_time') ? l$end_time : const {},
      l$start_time,
      _$data.containsKey('lastname') ? l$lastname : const {},
      _$data.containsKey('phone_number') ? l$phone_number : const {},
      _$data.containsKey('firstname') ? l$firstname : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('date') ? l$date : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InsertAppintmentWithVisits<TRes> {
  factory CopyWith$Variables$Mutation$InsertAppintmentWithVisits(
    Variables$Mutation$InsertAppintmentWithVisits instance,
    TRes Function(Variables$Mutation$InsertAppintmentWithVisits) then,
  ) = _CopyWithImpl$Variables$Mutation$InsertAppintmentWithVisits;

  factory CopyWith$Variables$Mutation$InsertAppintmentWithVisits.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InsertAppintmentWithVisits;

  TRes call({
    String? employee_id,
    String? end_time,
    String? start_time,
    String? lastname,
    String? phone_number,
    String? firstname,
    String? description,
    String? date,
  });
}

class _CopyWithImpl$Variables$Mutation$InsertAppintmentWithVisits<TRes>
    implements CopyWith$Variables$Mutation$InsertAppintmentWithVisits<TRes> {
  _CopyWithImpl$Variables$Mutation$InsertAppintmentWithVisits(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InsertAppintmentWithVisits _instance;

  final TRes Function(Variables$Mutation$InsertAppintmentWithVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? employee_id = _undefined,
    Object? end_time = _undefined,
    Object? start_time = _undefined,
    Object? lastname = _undefined,
    Object? phone_number = _undefined,
    Object? firstname = _undefined,
    Object? description = _undefined,
    Object? date = _undefined,
  }) =>
      _then(Variables$Mutation$InsertAppintmentWithVisits._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
        if (end_time != _undefined) 'end_time': (end_time as String?),
        if (start_time != _undefined && start_time != null)
          'start_time': (start_time as String),
        if (lastname != _undefined) 'lastname': (lastname as String?),
        if (phone_number != _undefined)
          'phone_number': (phone_number as String?),
        if (firstname != _undefined) 'firstname': (firstname as String?),
        if (description != _undefined) 'description': (description as String?),
        if (date != _undefined) 'date': (date as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$InsertAppintmentWithVisits<TRes>
    implements CopyWith$Variables$Mutation$InsertAppintmentWithVisits<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InsertAppintmentWithVisits(this._res);

  TRes _res;

  call({
    String? employee_id,
    String? end_time,
    String? start_time,
    String? lastname,
    String? phone_number,
    String? firstname,
    String? description,
    String? date,
  }) =>
      _res;
}

class Mutation$InsertAppintmentWithVisits {
  Mutation$InsertAppintmentWithVisits({
    this.insert_appointments_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$InsertAppintmentWithVisits.fromJson(
      Map<String, dynamic> json) {
    final l$insert_appointments_one = json['insert_appointments_one'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertAppintmentWithVisits(
      insert_appointments_one: l$insert_appointments_one == null
          ? null
          : Mutation$InsertAppintmentWithVisits$insert_appointments_one
              .fromJson((l$insert_appointments_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InsertAppintmentWithVisits$insert_appointments_one?
      insert_appointments_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_appointments_one = insert_appointments_one;
    _resultData['insert_appointments_one'] =
        l$insert_appointments_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_appointments_one = insert_appointments_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_appointments_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InsertAppintmentWithVisits ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_appointments_one = insert_appointments_one;
    final lOther$insert_appointments_one = other.insert_appointments_one;
    if (l$insert_appointments_one != lOther$insert_appointments_one) {
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

extension UtilityExtension$Mutation$InsertAppintmentWithVisits
    on Mutation$InsertAppintmentWithVisits {
  CopyWith$Mutation$InsertAppintmentWithVisits<
          Mutation$InsertAppintmentWithVisits>
      get copyWith => CopyWith$Mutation$InsertAppintmentWithVisits(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertAppintmentWithVisits<TRes> {
  factory CopyWith$Mutation$InsertAppintmentWithVisits(
    Mutation$InsertAppintmentWithVisits instance,
    TRes Function(Mutation$InsertAppintmentWithVisits) then,
  ) = _CopyWithImpl$Mutation$InsertAppintmentWithVisits;

  factory CopyWith$Mutation$InsertAppintmentWithVisits.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits;

  TRes call({
    Mutation$InsertAppintmentWithVisits$insert_appointments_one?
        insert_appointments_one,
    String? $__typename,
  });
  CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<TRes>
      get insert_appointments_one;
}

class _CopyWithImpl$Mutation$InsertAppintmentWithVisits<TRes>
    implements CopyWith$Mutation$InsertAppintmentWithVisits<TRes> {
  _CopyWithImpl$Mutation$InsertAppintmentWithVisits(
    this._instance,
    this._then,
  );

  final Mutation$InsertAppintmentWithVisits _instance;

  final TRes Function(Mutation$InsertAppintmentWithVisits) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_appointments_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InsertAppintmentWithVisits(
        insert_appointments_one: insert_appointments_one == _undefined
            ? _instance.insert_appointments_one
            : (insert_appointments_one
                as Mutation$InsertAppintmentWithVisits$insert_appointments_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<TRes>
      get insert_appointments_one {
    final local$insert_appointments_one = _instance.insert_appointments_one;
    return local$insert_appointments_one == null
        ? CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one
            .stub(_then(_instance))
        : CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one(
            local$insert_appointments_one,
            (e) => call(insert_appointments_one: e));
  }
}

class _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits<TRes>
    implements CopyWith$Mutation$InsertAppintmentWithVisits<TRes> {
  _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits(this._res);

  TRes _res;

  call({
    Mutation$InsertAppintmentWithVisits$insert_appointments_one?
        insert_appointments_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<TRes>
      get insert_appointments_one =>
          CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one
              .stub(_res);
}

const documentNodeMutationInsertAppintmentWithVisits =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InsertAppintmentWithVisits'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'end_time')),
        type: NamedTypeNode(
          name: NameNode(value: 'time'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'start_time')),
        type: NamedTypeNode(
          name: NameNode(value: 'time'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lastname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phone_number')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firstname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'description')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(
            value: StringValueNode(
          value: '',
          isBlock: false,
        )),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_appointments_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: VariableNode(name: NameNode(value: 'employee_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'end_time'),
                value: VariableNode(name: NameNode(value: 'end_time')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'start_time'),
                value: VariableNode(name: NameNode(value: 'start_time')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: EnumValueNode(name: NameNode(value: 'PENDING')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'visitor'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'data'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'lastname'),
                        value: VariableNode(name: NameNode(value: 'lastname')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'phone_number'),
                        value:
                            VariableNode(name: NameNode(value: 'phone_number')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'firstname'),
                        value: VariableNode(name: NameNode(value: 'firstname')),
                      ),
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'description'),
                value: VariableNode(name: NameNode(value: 'description')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: VariableNode(name: NameNode(value: 'date')),
              ),
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
Mutation$InsertAppintmentWithVisits
    _parserFn$Mutation$InsertAppintmentWithVisits(Map<String, dynamic> data) =>
        Mutation$InsertAppintmentWithVisits.fromJson(data);
typedef OnMutationCompleted$Mutation$InsertAppintmentWithVisits = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$InsertAppintmentWithVisits?,
);

class Options$Mutation$InsertAppintmentWithVisits
    extends graphql.MutationOptions<Mutation$InsertAppintmentWithVisits> {
  Options$Mutation$InsertAppintmentWithVisits({
    String? operationName,
    required Variables$Mutation$InsertAppintmentWithVisits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InsertAppintmentWithVisits? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InsertAppintmentWithVisits? onCompleted,
    graphql.OnMutationUpdate<Mutation$InsertAppintmentWithVisits>? update,
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
                        : _parserFn$Mutation$InsertAppintmentWithVisits(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInsertAppintmentWithVisits,
          parserFn: _parserFn$Mutation$InsertAppintmentWithVisits,
        );

  final OnMutationCompleted$Mutation$InsertAppintmentWithVisits?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InsertAppintmentWithVisits
    extends graphql.WatchQueryOptions<Mutation$InsertAppintmentWithVisits> {
  WatchOptions$Mutation$InsertAppintmentWithVisits({
    String? operationName,
    required Variables$Mutation$InsertAppintmentWithVisits variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InsertAppintmentWithVisits? typedOptimisticResult,
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
          document: documentNodeMutationInsertAppintmentWithVisits,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InsertAppintmentWithVisits,
        );
}

extension ClientExtension$Mutation$InsertAppintmentWithVisits
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InsertAppintmentWithVisits>>
      mutate$InsertAppintmentWithVisits(
              Options$Mutation$InsertAppintmentWithVisits options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$InsertAppintmentWithVisits>
      watchMutation$InsertAppintmentWithVisits(
              WatchOptions$Mutation$InsertAppintmentWithVisits options) =>
          this.watchMutation(options);
}

class Mutation$InsertAppintmentWithVisits$insert_appointments_one {
  Mutation$InsertAppintmentWithVisits$insert_appointments_one({
    required this.id,
    this.$__typename = 'appointments',
  });

  factory Mutation$InsertAppintmentWithVisits$insert_appointments_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertAppintmentWithVisits$insert_appointments_one(
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
    if (other is! Mutation$InsertAppintmentWithVisits$insert_appointments_one ||
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

extension UtilityExtension$Mutation$InsertAppintmentWithVisits$insert_appointments_one
    on Mutation$InsertAppintmentWithVisits$insert_appointments_one {
  CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
          Mutation$InsertAppintmentWithVisits$insert_appointments_one>
      get copyWith =>
          CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
    TRes> {
  factory CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one(
    Mutation$InsertAppintmentWithVisits$insert_appointments_one instance,
    TRes Function(Mutation$InsertAppintmentWithVisits$insert_appointments_one)
        then,
  ) = _CopyWithImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one;

  factory CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
        TRes>
    implements
        CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
            TRes> {
  _CopyWithImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one(
    this._instance,
    this._then,
  );

  final Mutation$InsertAppintmentWithVisits$insert_appointments_one _instance;

  final TRes Function(
      Mutation$InsertAppintmentWithVisits$insert_appointments_one) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InsertAppintmentWithVisits$insert_appointments_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
        TRes>
    implements
        CopyWith$Mutation$InsertAppintmentWithVisits$insert_appointments_one<
            TRes> {
  _CopyWithStubImpl$Mutation$InsertAppintmentWithVisits$insert_appointments_one(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CompletedAppointment {
  factory Variables$Mutation$CompletedAppointment({required String id}) =>
      Variables$Mutation$CompletedAppointment._({
        r'id': id,
      });

  Variables$Mutation$CompletedAppointment._(this._$data);

  factory Variables$Mutation$CompletedAppointment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$CompletedAppointment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$CompletedAppointment<
          Variables$Mutation$CompletedAppointment>
      get copyWith => CopyWith$Variables$Mutation$CompletedAppointment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CompletedAppointment ||
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

abstract class CopyWith$Variables$Mutation$CompletedAppointment<TRes> {
  factory CopyWith$Variables$Mutation$CompletedAppointment(
    Variables$Mutation$CompletedAppointment instance,
    TRes Function(Variables$Mutation$CompletedAppointment) then,
  ) = _CopyWithImpl$Variables$Mutation$CompletedAppointment;

  factory CopyWith$Variables$Mutation$CompletedAppointment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CompletedAppointment;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$CompletedAppointment<TRes>
    implements CopyWith$Variables$Mutation$CompletedAppointment<TRes> {
  _CopyWithImpl$Variables$Mutation$CompletedAppointment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CompletedAppointment _instance;

  final TRes Function(Variables$Mutation$CompletedAppointment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$CompletedAppointment._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CompletedAppointment<TRes>
    implements CopyWith$Variables$Mutation$CompletedAppointment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CompletedAppointment(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$CompletedAppointment {
  Mutation$CompletedAppointment({
    this.update_appointments_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$CompletedAppointment.fromJson(Map<String, dynamic> json) {
    final l$update_appointments_by_pk = json['update_appointments_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletedAppointment(
      update_appointments_by_pk: l$update_appointments_by_pk == null
          ? null
          : Mutation$CompletedAppointment$update_appointments_by_pk.fromJson(
              (l$update_appointments_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CompletedAppointment$update_appointments_by_pk?
      update_appointments_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_appointments_by_pk = update_appointments_by_pk;
    _resultData['update_appointments_by_pk'] =
        l$update_appointments_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_appointments_by_pk = update_appointments_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_appointments_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CompletedAppointment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_appointments_by_pk = update_appointments_by_pk;
    final lOther$update_appointments_by_pk = other.update_appointments_by_pk;
    if (l$update_appointments_by_pk != lOther$update_appointments_by_pk) {
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

extension UtilityExtension$Mutation$CompletedAppointment
    on Mutation$CompletedAppointment {
  CopyWith$Mutation$CompletedAppointment<Mutation$CompletedAppointment>
      get copyWith => CopyWith$Mutation$CompletedAppointment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CompletedAppointment<TRes> {
  factory CopyWith$Mutation$CompletedAppointment(
    Mutation$CompletedAppointment instance,
    TRes Function(Mutation$CompletedAppointment) then,
  ) = _CopyWithImpl$Mutation$CompletedAppointment;

  factory CopyWith$Mutation$CompletedAppointment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CompletedAppointment;

  TRes call({
    Mutation$CompletedAppointment$update_appointments_by_pk?
        update_appointments_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<TRes>
      get update_appointments_by_pk;
}

class _CopyWithImpl$Mutation$CompletedAppointment<TRes>
    implements CopyWith$Mutation$CompletedAppointment<TRes> {
  _CopyWithImpl$Mutation$CompletedAppointment(
    this._instance,
    this._then,
  );

  final Mutation$CompletedAppointment _instance;

  final TRes Function(Mutation$CompletedAppointment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_appointments_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CompletedAppointment(
        update_appointments_by_pk: update_appointments_by_pk == _undefined
            ? _instance.update_appointments_by_pk
            : (update_appointments_by_pk
                as Mutation$CompletedAppointment$update_appointments_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<TRes>
      get update_appointments_by_pk {
    final local$update_appointments_by_pk = _instance.update_appointments_by_pk;
    return local$update_appointments_by_pk == null
        ? CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk(
            local$update_appointments_by_pk,
            (e) => call(update_appointments_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$CompletedAppointment<TRes>
    implements CopyWith$Mutation$CompletedAppointment<TRes> {
  _CopyWithStubImpl$Mutation$CompletedAppointment(this._res);

  TRes _res;

  call({
    Mutation$CompletedAppointment$update_appointments_by_pk?
        update_appointments_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<TRes>
      get update_appointments_by_pk =>
          CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk.stub(
              _res);
}

const documentNodeMutationCompletedAppointment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CompletedAppointment'),
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
        name: NameNode(value: 'update_appointments_by_pk'),
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
                value: EnumValueNode(name: NameNode(value: 'COMPLETED')),
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
Mutation$CompletedAppointment _parserFn$Mutation$CompletedAppointment(
        Map<String, dynamic> data) =>
    Mutation$CompletedAppointment.fromJson(data);
typedef OnMutationCompleted$Mutation$CompletedAppointment = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CompletedAppointment?,
);

class Options$Mutation$CompletedAppointment
    extends graphql.MutationOptions<Mutation$CompletedAppointment> {
  Options$Mutation$CompletedAppointment({
    String? operationName,
    required Variables$Mutation$CompletedAppointment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CompletedAppointment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CompletedAppointment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CompletedAppointment>? update,
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
                        : _parserFn$Mutation$CompletedAppointment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCompletedAppointment,
          parserFn: _parserFn$Mutation$CompletedAppointment,
        );

  final OnMutationCompleted$Mutation$CompletedAppointment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CompletedAppointment
    extends graphql.WatchQueryOptions<Mutation$CompletedAppointment> {
  WatchOptions$Mutation$CompletedAppointment({
    String? operationName,
    required Variables$Mutation$CompletedAppointment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CompletedAppointment? typedOptimisticResult,
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
          document: documentNodeMutationCompletedAppointment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CompletedAppointment,
        );
}

extension ClientExtension$Mutation$CompletedAppointment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CompletedAppointment>>
      mutate$CompletedAppointment(
              Options$Mutation$CompletedAppointment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CompletedAppointment>
      watchMutation$CompletedAppointment(
              WatchOptions$Mutation$CompletedAppointment options) =>
          this.watchMutation(options);
}

class Mutation$CompletedAppointment$update_appointments_by_pk {
  Mutation$CompletedAppointment$update_appointments_by_pk({
    required this.id,
    this.$__typename = 'appointments',
  });

  factory Mutation$CompletedAppointment$update_appointments_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$CompletedAppointment$update_appointments_by_pk(
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
    if (other is! Mutation$CompletedAppointment$update_appointments_by_pk ||
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

extension UtilityExtension$Mutation$CompletedAppointment$update_appointments_by_pk
    on Mutation$CompletedAppointment$update_appointments_by_pk {
  CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<
          Mutation$CompletedAppointment$update_appointments_by_pk>
      get copyWith =>
          CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<
    TRes> {
  factory CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk(
    Mutation$CompletedAppointment$update_appointments_by_pk instance,
    TRes Function(Mutation$CompletedAppointment$update_appointments_by_pk) then,
  ) = _CopyWithImpl$Mutation$CompletedAppointment$update_appointments_by_pk;

  factory CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CompletedAppointment$update_appointments_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CompletedAppointment$update_appointments_by_pk<
        TRes>
    implements
        CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<TRes> {
  _CopyWithImpl$Mutation$CompletedAppointment$update_appointments_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$CompletedAppointment$update_appointments_by_pk _instance;

  final TRes Function(Mutation$CompletedAppointment$update_appointments_by_pk)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CompletedAppointment$update_appointments_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CompletedAppointment$update_appointments_by_pk<
        TRes>
    implements
        CopyWith$Mutation$CompletedAppointment$update_appointments_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$CompletedAppointment$update_appointments_by_pk(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
