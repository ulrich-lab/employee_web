import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ClockIn {
  factory Variables$Mutation$ClockIn({
    required String employee_id,
    String? location,
    required String building_id,
  }) =>
      Variables$Mutation$ClockIn._({
        r'employee_id': employee_id,
        if (location != null) r'location': location,
        r'building_id': building_id,
      });

  Variables$Mutation$ClockIn._(this._$data);

  factory Variables$Mutation$ClockIn.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    final l$building_id = data['building_id'];
    result$data['building_id'] = (l$building_id as String);
    return Variables$Mutation$ClockIn._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  String? get location => (_$data['location'] as String?);

  String get building_id => (_$data['building_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    final l$building_id = building_id;
    result$data['building_id'] = l$building_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ClockIn<Variables$Mutation$ClockIn>
      get copyWith => CopyWith$Variables$Mutation$ClockIn(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ClockIn ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$building_id = building_id;
    final lOther$building_id = other.building_id;
    if (l$building_id != lOther$building_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$employee_id = employee_id;
    final l$location = location;
    final l$building_id = building_id;
    return Object.hashAll([
      l$employee_id,
      _$data.containsKey('location') ? l$location : const {},
      l$building_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ClockIn<TRes> {
  factory CopyWith$Variables$Mutation$ClockIn(
    Variables$Mutation$ClockIn instance,
    TRes Function(Variables$Mutation$ClockIn) then,
  ) = _CopyWithImpl$Variables$Mutation$ClockIn;

  factory CopyWith$Variables$Mutation$ClockIn.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ClockIn;

  TRes call({
    String? employee_id,
    String? location,
    String? building_id,
  });
}

class _CopyWithImpl$Variables$Mutation$ClockIn<TRes>
    implements CopyWith$Variables$Mutation$ClockIn<TRes> {
  _CopyWithImpl$Variables$Mutation$ClockIn(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ClockIn _instance;

  final TRes Function(Variables$Mutation$ClockIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? employee_id = _undefined,
    Object? location = _undefined,
    Object? building_id = _undefined,
  }) =>
      _then(Variables$Mutation$ClockIn._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
        if (location != _undefined) 'location': (location as String?),
        if (building_id != _undefined && building_id != null)
          'building_id': (building_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ClockIn<TRes>
    implements CopyWith$Variables$Mutation$ClockIn<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ClockIn(this._res);

  TRes _res;

  call({
    String? employee_id,
    String? location,
    String? building_id,
  }) =>
      _res;
}

class Mutation$ClockIn {
  Mutation$ClockIn({
    this.insert_attendance_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$ClockIn.fromJson(Map<String, dynamic> json) {
    final l$insert_attendance_one = json['insert_attendance_one'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockIn(
      insert_attendance_one: l$insert_attendance_one == null
          ? null
          : Mutation$ClockIn$insert_attendance_one.fromJson(
              (l$insert_attendance_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ClockIn$insert_attendance_one? insert_attendance_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_attendance_one = insert_attendance_one;
    _resultData['insert_attendance_one'] = l$insert_attendance_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_attendance_one = insert_attendance_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_attendance_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ClockIn || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_attendance_one = insert_attendance_one;
    final lOther$insert_attendance_one = other.insert_attendance_one;
    if (l$insert_attendance_one != lOther$insert_attendance_one) {
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

extension UtilityExtension$Mutation$ClockIn on Mutation$ClockIn {
  CopyWith$Mutation$ClockIn<Mutation$ClockIn> get copyWith =>
      CopyWith$Mutation$ClockIn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ClockIn<TRes> {
  factory CopyWith$Mutation$ClockIn(
    Mutation$ClockIn instance,
    TRes Function(Mutation$ClockIn) then,
  ) = _CopyWithImpl$Mutation$ClockIn;

  factory CopyWith$Mutation$ClockIn.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockIn;

  TRes call({
    Mutation$ClockIn$insert_attendance_one? insert_attendance_one,
    String? $__typename,
  });
  CopyWith$Mutation$ClockIn$insert_attendance_one<TRes>
      get insert_attendance_one;
}

class _CopyWithImpl$Mutation$ClockIn<TRes>
    implements CopyWith$Mutation$ClockIn<TRes> {
  _CopyWithImpl$Mutation$ClockIn(
    this._instance,
    this._then,
  );

  final Mutation$ClockIn _instance;

  final TRes Function(Mutation$ClockIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_attendance_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockIn(
        insert_attendance_one: insert_attendance_one == _undefined
            ? _instance.insert_attendance_one
            : (insert_attendance_one
                as Mutation$ClockIn$insert_attendance_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ClockIn$insert_attendance_one<TRes>
      get insert_attendance_one {
    final local$insert_attendance_one = _instance.insert_attendance_one;
    return local$insert_attendance_one == null
        ? CopyWith$Mutation$ClockIn$insert_attendance_one.stub(_then(_instance))
        : CopyWith$Mutation$ClockIn$insert_attendance_one(
            local$insert_attendance_one, (e) => call(insert_attendance_one: e));
  }
}

class _CopyWithStubImpl$Mutation$ClockIn<TRes>
    implements CopyWith$Mutation$ClockIn<TRes> {
  _CopyWithStubImpl$Mutation$ClockIn(this._res);

  TRes _res;

  call({
    Mutation$ClockIn$insert_attendance_one? insert_attendance_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ClockIn$insert_attendance_one<TRes>
      get insert_attendance_one =>
          CopyWith$Mutation$ClockIn$insert_attendance_one.stub(_res);
}

const documentNodeMutationClockIn = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ClockIn'),
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
        variable: VariableNode(name: NameNode(value: 'location')),
        type: NamedTypeNode(
          name: NameNode(value: 'geometry'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'building_id')),
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
        name: NameNode(value: 'insert_attendance_one'),
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
                name: NameNode(value: 'location'),
                value: VariableNode(name: NameNode(value: 'location')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'clock_in_date'),
                value: EnumValueNode(name: NameNode(value: 'now')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'building_id'),
                value: VariableNode(name: NameNode(value: 'building_id')),
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
Mutation$ClockIn _parserFn$Mutation$ClockIn(Map<String, dynamic> data) =>
    Mutation$ClockIn.fromJson(data);
typedef OnMutationCompleted$Mutation$ClockIn = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ClockIn?,
);

class Options$Mutation$ClockIn
    extends graphql.MutationOptions<Mutation$ClockIn> {
  Options$Mutation$ClockIn({
    String? operationName,
    required Variables$Mutation$ClockIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockIn? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ClockIn? onCompleted,
    graphql.OnMutationUpdate<Mutation$ClockIn>? update,
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
                    data == null ? null : _parserFn$Mutation$ClockIn(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationClockIn,
          parserFn: _parserFn$Mutation$ClockIn,
        );

  final OnMutationCompleted$Mutation$ClockIn? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ClockIn
    extends graphql.WatchQueryOptions<Mutation$ClockIn> {
  WatchOptions$Mutation$ClockIn({
    String? operationName,
    required Variables$Mutation$ClockIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockIn? typedOptimisticResult,
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
          document: documentNodeMutationClockIn,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ClockIn,
        );
}

extension ClientExtension$Mutation$ClockIn on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ClockIn>> mutate$ClockIn(
          Options$Mutation$ClockIn options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ClockIn> watchMutation$ClockIn(
          WatchOptions$Mutation$ClockIn options) =>
      this.watchMutation(options);
}

class Mutation$ClockIn$insert_attendance_one {
  Mutation$ClockIn$insert_attendance_one({
    required this.id,
    this.$__typename = 'attendance',
  });

  factory Mutation$ClockIn$insert_attendance_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockIn$insert_attendance_one(
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
    if (other is! Mutation$ClockIn$insert_attendance_one ||
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

extension UtilityExtension$Mutation$ClockIn$insert_attendance_one
    on Mutation$ClockIn$insert_attendance_one {
  CopyWith$Mutation$ClockIn$insert_attendance_one<
          Mutation$ClockIn$insert_attendance_one>
      get copyWith => CopyWith$Mutation$ClockIn$insert_attendance_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ClockIn$insert_attendance_one<TRes> {
  factory CopyWith$Mutation$ClockIn$insert_attendance_one(
    Mutation$ClockIn$insert_attendance_one instance,
    TRes Function(Mutation$ClockIn$insert_attendance_one) then,
  ) = _CopyWithImpl$Mutation$ClockIn$insert_attendance_one;

  factory CopyWith$Mutation$ClockIn$insert_attendance_one.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockIn$insert_attendance_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ClockIn$insert_attendance_one<TRes>
    implements CopyWith$Mutation$ClockIn$insert_attendance_one<TRes> {
  _CopyWithImpl$Mutation$ClockIn$insert_attendance_one(
    this._instance,
    this._then,
  );

  final Mutation$ClockIn$insert_attendance_one _instance;

  final TRes Function(Mutation$ClockIn$insert_attendance_one) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockIn$insert_attendance_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ClockIn$insert_attendance_one<TRes>
    implements CopyWith$Mutation$ClockIn$insert_attendance_one<TRes> {
  _CopyWithStubImpl$Mutation$ClockIn$insert_attendance_one(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ClockOut {
  factory Variables$Mutation$ClockOut({required String employee_id}) =>
      Variables$Mutation$ClockOut._({
        r'employee_id': employee_id,
      });

  Variables$Mutation$ClockOut._(this._$data);

  factory Variables$Mutation$ClockOut.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    return Variables$Mutation$ClockOut._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ClockOut<Variables$Mutation$ClockOut>
      get copyWith => CopyWith$Variables$Mutation$ClockOut(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ClockOut ||
        runtimeType != other.runtimeType) {
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
    final l$employee_id = employee_id;
    return Object.hashAll([l$employee_id]);
  }
}

abstract class CopyWith$Variables$Mutation$ClockOut<TRes> {
  factory CopyWith$Variables$Mutation$ClockOut(
    Variables$Mutation$ClockOut instance,
    TRes Function(Variables$Mutation$ClockOut) then,
  ) = _CopyWithImpl$Variables$Mutation$ClockOut;

  factory CopyWith$Variables$Mutation$ClockOut.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ClockOut;

  TRes call({String? employee_id});
}

class _CopyWithImpl$Variables$Mutation$ClockOut<TRes>
    implements CopyWith$Variables$Mutation$ClockOut<TRes> {
  _CopyWithImpl$Variables$Mutation$ClockOut(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ClockOut _instance;

  final TRes Function(Variables$Mutation$ClockOut) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? employee_id = _undefined}) =>
      _then(Variables$Mutation$ClockOut._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ClockOut<TRes>
    implements CopyWith$Variables$Mutation$ClockOut<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ClockOut(this._res);

  TRes _res;

  call({String? employee_id}) => _res;
}

class Mutation$ClockOut {
  Mutation$ClockOut({
    this.update_attendance,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$ClockOut.fromJson(Map<String, dynamic> json) {
    final l$update_attendance = json['update_attendance'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockOut(
      update_attendance: l$update_attendance == null
          ? null
          : Mutation$ClockOut$update_attendance.fromJson(
              (l$update_attendance as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ClockOut$update_attendance? update_attendance;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_attendance = update_attendance;
    _resultData['update_attendance'] = l$update_attendance?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_attendance = update_attendance;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_attendance,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ClockOut || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_attendance = update_attendance;
    final lOther$update_attendance = other.update_attendance;
    if (l$update_attendance != lOther$update_attendance) {
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

extension UtilityExtension$Mutation$ClockOut on Mutation$ClockOut {
  CopyWith$Mutation$ClockOut<Mutation$ClockOut> get copyWith =>
      CopyWith$Mutation$ClockOut(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ClockOut<TRes> {
  factory CopyWith$Mutation$ClockOut(
    Mutation$ClockOut instance,
    TRes Function(Mutation$ClockOut) then,
  ) = _CopyWithImpl$Mutation$ClockOut;

  factory CopyWith$Mutation$ClockOut.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockOut;

  TRes call({
    Mutation$ClockOut$update_attendance? update_attendance,
    String? $__typename,
  });
  CopyWith$Mutation$ClockOut$update_attendance<TRes> get update_attendance;
}

class _CopyWithImpl$Mutation$ClockOut<TRes>
    implements CopyWith$Mutation$ClockOut<TRes> {
  _CopyWithImpl$Mutation$ClockOut(
    this._instance,
    this._then,
  );

  final Mutation$ClockOut _instance;

  final TRes Function(Mutation$ClockOut) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_attendance = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockOut(
        update_attendance: update_attendance == _undefined
            ? _instance.update_attendance
            : (update_attendance as Mutation$ClockOut$update_attendance?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ClockOut$update_attendance<TRes> get update_attendance {
    final local$update_attendance = _instance.update_attendance;
    return local$update_attendance == null
        ? CopyWith$Mutation$ClockOut$update_attendance.stub(_then(_instance))
        : CopyWith$Mutation$ClockOut$update_attendance(
            local$update_attendance, (e) => call(update_attendance: e));
  }
}

class _CopyWithStubImpl$Mutation$ClockOut<TRes>
    implements CopyWith$Mutation$ClockOut<TRes> {
  _CopyWithStubImpl$Mutation$ClockOut(this._res);

  TRes _res;

  call({
    Mutation$ClockOut$update_attendance? update_attendance,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ClockOut$update_attendance<TRes> get update_attendance =>
      CopyWith$Mutation$ClockOut$update_attendance.stub(_res);
}

const documentNodeMutationClockOut = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ClockOut'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
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
        name: NameNode(value: 'update_attendance'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'clock_in_date'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: EnumValueNode(name: NameNode(value: 'now')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'employee_id')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'clock_out_time'),
                value: EnumValueNode(name: NameNode(value: 'now')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'affected_rows'),
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
Mutation$ClockOut _parserFn$Mutation$ClockOut(Map<String, dynamic> data) =>
    Mutation$ClockOut.fromJson(data);
typedef OnMutationCompleted$Mutation$ClockOut = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ClockOut?,
);

class Options$Mutation$ClockOut
    extends graphql.MutationOptions<Mutation$ClockOut> {
  Options$Mutation$ClockOut({
    String? operationName,
    required Variables$Mutation$ClockOut variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockOut? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ClockOut? onCompleted,
    graphql.OnMutationUpdate<Mutation$ClockOut>? update,
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
                    data == null ? null : _parserFn$Mutation$ClockOut(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationClockOut,
          parserFn: _parserFn$Mutation$ClockOut,
        );

  final OnMutationCompleted$Mutation$ClockOut? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ClockOut
    extends graphql.WatchQueryOptions<Mutation$ClockOut> {
  WatchOptions$Mutation$ClockOut({
    String? operationName,
    required Variables$Mutation$ClockOut variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ClockOut? typedOptimisticResult,
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
          document: documentNodeMutationClockOut,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ClockOut,
        );
}

extension ClientExtension$Mutation$ClockOut on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ClockOut>> mutate$ClockOut(
          Options$Mutation$ClockOut options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ClockOut> watchMutation$ClockOut(
          WatchOptions$Mutation$ClockOut options) =>
      this.watchMutation(options);
}

class Mutation$ClockOut$update_attendance {
  Mutation$ClockOut$update_attendance({
    required this.affected_rows,
    this.$__typename = 'attendance_mutation_response',
  });

  factory Mutation$ClockOut$update_attendance.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$ClockOut$update_attendance(
      affected_rows: (l$affected_rows as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ClockOut$update_attendance ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$ClockOut$update_attendance
    on Mutation$ClockOut$update_attendance {
  CopyWith$Mutation$ClockOut$update_attendance<
          Mutation$ClockOut$update_attendance>
      get copyWith => CopyWith$Mutation$ClockOut$update_attendance(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ClockOut$update_attendance<TRes> {
  factory CopyWith$Mutation$ClockOut$update_attendance(
    Mutation$ClockOut$update_attendance instance,
    TRes Function(Mutation$ClockOut$update_attendance) then,
  ) = _CopyWithImpl$Mutation$ClockOut$update_attendance;

  factory CopyWith$Mutation$ClockOut$update_attendance.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ClockOut$update_attendance;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ClockOut$update_attendance<TRes>
    implements CopyWith$Mutation$ClockOut$update_attendance<TRes> {
  _CopyWithImpl$Mutation$ClockOut$update_attendance(
    this._instance,
    this._then,
  );

  final Mutation$ClockOut$update_attendance _instance;

  final TRes Function(Mutation$ClockOut$update_attendance) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ClockOut$update_attendance(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ClockOut$update_attendance<TRes>
    implements CopyWith$Mutation$ClockOut$update_attendance<TRes> {
  _CopyWithStubImpl$Mutation$ClockOut$update_attendance(this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$AttendanceStatus {
  factory Variables$Subscription$AttendanceStatus(
          {required String employee_id}) =>
      Variables$Subscription$AttendanceStatus._({
        r'employee_id': employee_id,
      });

  Variables$Subscription$AttendanceStatus._(this._$data);

  factory Variables$Subscription$AttendanceStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    return Variables$Subscription$AttendanceStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$AttendanceStatus<
          Variables$Subscription$AttendanceStatus>
      get copyWith => CopyWith$Variables$Subscription$AttendanceStatus(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$AttendanceStatus ||
        runtimeType != other.runtimeType) {
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
    final l$employee_id = employee_id;
    return Object.hashAll([l$employee_id]);
  }
}

abstract class CopyWith$Variables$Subscription$AttendanceStatus<TRes> {
  factory CopyWith$Variables$Subscription$AttendanceStatus(
    Variables$Subscription$AttendanceStatus instance,
    TRes Function(Variables$Subscription$AttendanceStatus) then,
  ) = _CopyWithImpl$Variables$Subscription$AttendanceStatus;

  factory CopyWith$Variables$Subscription$AttendanceStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$AttendanceStatus;

  TRes call({String? employee_id});
}

class _CopyWithImpl$Variables$Subscription$AttendanceStatus<TRes>
    implements CopyWith$Variables$Subscription$AttendanceStatus<TRes> {
  _CopyWithImpl$Variables$Subscription$AttendanceStatus(
    this._instance,
    this._then,
  );

  final Variables$Subscription$AttendanceStatus _instance;

  final TRes Function(Variables$Subscription$AttendanceStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? employee_id = _undefined}) =>
      _then(Variables$Subscription$AttendanceStatus._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$AttendanceStatus<TRes>
    implements CopyWith$Variables$Subscription$AttendanceStatus<TRes> {
  _CopyWithStubImpl$Variables$Subscription$AttendanceStatus(this._res);

  TRes _res;

  call({String? employee_id}) => _res;
}

class Subscription$AttendanceStatus {
  Subscription$AttendanceStatus({required this.attendance});

  factory Subscription$AttendanceStatus.fromJson(Map<String, dynamic> json) {
    final l$attendance = json['attendance'];
    return Subscription$AttendanceStatus(
        attendance: (l$attendance as List<dynamic>)
            .map((e) => Subscription$AttendanceStatus$attendance.fromJson(
                (e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$AttendanceStatus$attendance> attendance;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$attendance = attendance;
    _resultData['attendance'] = l$attendance.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$attendance = attendance;
    return Object.hashAll([Object.hashAll(l$attendance.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$AttendanceStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$attendance = attendance;
    final lOther$attendance = other.attendance;
    if (l$attendance.length != lOther$attendance.length) {
      return false;
    }
    for (int i = 0; i < l$attendance.length; i++) {
      final l$attendance$entry = l$attendance[i];
      final lOther$attendance$entry = lOther$attendance[i];
      if (l$attendance$entry != lOther$attendance$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$AttendanceStatus
    on Subscription$AttendanceStatus {
  CopyWith$Subscription$AttendanceStatus<Subscription$AttendanceStatus>
      get copyWith => CopyWith$Subscription$AttendanceStatus(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$AttendanceStatus<TRes> {
  factory CopyWith$Subscription$AttendanceStatus(
    Subscription$AttendanceStatus instance,
    TRes Function(Subscription$AttendanceStatus) then,
  ) = _CopyWithImpl$Subscription$AttendanceStatus;

  factory CopyWith$Subscription$AttendanceStatus.stub(TRes res) =
      _CopyWithStubImpl$Subscription$AttendanceStatus;

  TRes call({List<Subscription$AttendanceStatus$attendance>? attendance});
  TRes attendance(
      Iterable<Subscription$AttendanceStatus$attendance> Function(
              Iterable<
                  CopyWith$Subscription$AttendanceStatus$attendance<
                      Subscription$AttendanceStatus$attendance>>)
          _fn);
}

class _CopyWithImpl$Subscription$AttendanceStatus<TRes>
    implements CopyWith$Subscription$AttendanceStatus<TRes> {
  _CopyWithImpl$Subscription$AttendanceStatus(
    this._instance,
    this._then,
  );

  final Subscription$AttendanceStatus _instance;

  final TRes Function(Subscription$AttendanceStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? attendance = _undefined}) =>
      _then(Subscription$AttendanceStatus(
          attendance: attendance == _undefined || attendance == null
              ? _instance.attendance
              : (attendance
                  as List<Subscription$AttendanceStatus$attendance>)));

  TRes attendance(
          Iterable<Subscription$AttendanceStatus$attendance> Function(
                  Iterable<
                      CopyWith$Subscription$AttendanceStatus$attendance<
                          Subscription$AttendanceStatus$attendance>>)
              _fn) =>
      call(
          attendance: _fn(_instance.attendance
              .map((e) => CopyWith$Subscription$AttendanceStatus$attendance(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$AttendanceStatus<TRes>
    implements CopyWith$Subscription$AttendanceStatus<TRes> {
  _CopyWithStubImpl$Subscription$AttendanceStatus(this._res);

  TRes _res;

  call({List<Subscription$AttendanceStatus$attendance>? attendance}) => _res;

  attendance(_fn) => _res;
}

const documentNodeSubscriptionAttendanceStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'AttendanceStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
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
        name: NameNode(value: 'attendance'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'employee_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'clock_in_date'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'now()',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'attendance_state'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'is_late'),
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
            name: NameNode(value: 'clock_in_date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'clock_in_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'clock_out_time'),
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
Subscription$AttendanceStatus _parserFn$Subscription$AttendanceStatus(
        Map<String, dynamic> data) =>
    Subscription$AttendanceStatus.fromJson(data);

class Options$Subscription$AttendanceStatus
    extends graphql.SubscriptionOptions<Subscription$AttendanceStatus> {
  Options$Subscription$AttendanceStatus({
    String? operationName,
    required Variables$Subscription$AttendanceStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$AttendanceStatus? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionAttendanceStatus,
          parserFn: _parserFn$Subscription$AttendanceStatus,
        );
}

class WatchOptions$Subscription$AttendanceStatus
    extends graphql.WatchQueryOptions<Subscription$AttendanceStatus> {
  WatchOptions$Subscription$AttendanceStatus({
    String? operationName,
    required Variables$Subscription$AttendanceStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$AttendanceStatus? typedOptimisticResult,
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
          document: documentNodeSubscriptionAttendanceStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$AttendanceStatus,
        );
}

class FetchMoreOptions$Subscription$AttendanceStatus
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$AttendanceStatus({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$AttendanceStatus variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionAttendanceStatus,
        );
}

extension ClientExtension$Subscription$AttendanceStatus
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$AttendanceStatus>>
      subscribe$AttendanceStatus(
              Options$Subscription$AttendanceStatus options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$AttendanceStatus>
      watchSubscription$AttendanceStatus(
              WatchOptions$Subscription$AttendanceStatus options) =>
          this.watchQuery(options);
}

class Subscription$AttendanceStatus$attendance {
  Subscription$AttendanceStatus$attendance({
    this.attendance_state,
    this.clock_in_date,
    this.clock_in_time,
    this.clock_out_time,
    this.$__typename = 'attendance',
  });

  factory Subscription$AttendanceStatus$attendance.fromJson(
      Map<String, dynamic> json) {
    final l$attendance_state = json['attendance_state'];
    final l$clock_in_date = json['clock_in_date'];
    final l$clock_in_time = json['clock_in_time'];
    final l$clock_out_time = json['clock_out_time'];
    final l$$__typename = json['__typename'];
    return Subscription$AttendanceStatus$attendance(
      attendance_state: l$attendance_state == null
          ? null
          : Subscription$AttendanceStatus$attendance$attendance_state.fromJson(
              (l$attendance_state as Map<String, dynamic>)),
      clock_in_date: (l$clock_in_date as String?),
      clock_in_time: (l$clock_in_time as String?),
      clock_out_time: (l$clock_out_time as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Subscription$AttendanceStatus$attendance$attendance_state?
      attendance_state;

  final String? clock_in_date;

  final String? clock_in_time;

  final String? clock_out_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$attendance_state = attendance_state;
    _resultData['attendance_state'] = l$attendance_state?.toJson();
    final l$clock_in_date = clock_in_date;
    _resultData['clock_in_date'] = l$clock_in_date;
    final l$clock_in_time = clock_in_time;
    _resultData['clock_in_time'] = l$clock_in_time;
    final l$clock_out_time = clock_out_time;
    _resultData['clock_out_time'] = l$clock_out_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$attendance_state = attendance_state;
    final l$clock_in_date = clock_in_date;
    final l$clock_in_time = clock_in_time;
    final l$clock_out_time = clock_out_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$attendance_state,
      l$clock_in_date,
      l$clock_in_time,
      l$clock_out_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$AttendanceStatus$attendance ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$attendance_state = attendance_state;
    final lOther$attendance_state = other.attendance_state;
    if (l$attendance_state != lOther$attendance_state) {
      return false;
    }
    final l$clock_in_date = clock_in_date;
    final lOther$clock_in_date = other.clock_in_date;
    if (l$clock_in_date != lOther$clock_in_date) {
      return false;
    }
    final l$clock_in_time = clock_in_time;
    final lOther$clock_in_time = other.clock_in_time;
    if (l$clock_in_time != lOther$clock_in_time) {
      return false;
    }
    final l$clock_out_time = clock_out_time;
    final lOther$clock_out_time = other.clock_out_time;
    if (l$clock_out_time != lOther$clock_out_time) {
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

extension UtilityExtension$Subscription$AttendanceStatus$attendance
    on Subscription$AttendanceStatus$attendance {
  CopyWith$Subscription$AttendanceStatus$attendance<
          Subscription$AttendanceStatus$attendance>
      get copyWith => CopyWith$Subscription$AttendanceStatus$attendance(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$AttendanceStatus$attendance<TRes> {
  factory CopyWith$Subscription$AttendanceStatus$attendance(
    Subscription$AttendanceStatus$attendance instance,
    TRes Function(Subscription$AttendanceStatus$attendance) then,
  ) = _CopyWithImpl$Subscription$AttendanceStatus$attendance;

  factory CopyWith$Subscription$AttendanceStatus$attendance.stub(TRes res) =
      _CopyWithStubImpl$Subscription$AttendanceStatus$attendance;

  TRes call({
    Subscription$AttendanceStatus$attendance$attendance_state? attendance_state,
    String? clock_in_date,
    String? clock_in_time,
    String? clock_out_time,
    String? $__typename,
  });
  CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<TRes>
      get attendance_state;
}

class _CopyWithImpl$Subscription$AttendanceStatus$attendance<TRes>
    implements CopyWith$Subscription$AttendanceStatus$attendance<TRes> {
  _CopyWithImpl$Subscription$AttendanceStatus$attendance(
    this._instance,
    this._then,
  );

  final Subscription$AttendanceStatus$attendance _instance;

  final TRes Function(Subscription$AttendanceStatus$attendance) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? attendance_state = _undefined,
    Object? clock_in_date = _undefined,
    Object? clock_in_time = _undefined,
    Object? clock_out_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$AttendanceStatus$attendance(
        attendance_state: attendance_state == _undefined
            ? _instance.attendance_state
            : (attendance_state
                as Subscription$AttendanceStatus$attendance$attendance_state?),
        clock_in_date: clock_in_date == _undefined
            ? _instance.clock_in_date
            : (clock_in_date as String?),
        clock_in_time: clock_in_time == _undefined
            ? _instance.clock_in_time
            : (clock_in_time as String?),
        clock_out_time: clock_out_time == _undefined
            ? _instance.clock_out_time
            : (clock_out_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<TRes>
      get attendance_state {
    final local$attendance_state = _instance.attendance_state;
    return local$attendance_state == null
        ? CopyWith$Subscription$AttendanceStatus$attendance$attendance_state
            .stub(_then(_instance))
        : CopyWith$Subscription$AttendanceStatus$attendance$attendance_state(
            local$attendance_state, (e) => call(attendance_state: e));
  }
}

class _CopyWithStubImpl$Subscription$AttendanceStatus$attendance<TRes>
    implements CopyWith$Subscription$AttendanceStatus$attendance<TRes> {
  _CopyWithStubImpl$Subscription$AttendanceStatus$attendance(this._res);

  TRes _res;

  call({
    Subscription$AttendanceStatus$attendance$attendance_state? attendance_state,
    String? clock_in_date,
    String? clock_in_time,
    String? clock_out_time,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<TRes>
      get attendance_state =>
          CopyWith$Subscription$AttendanceStatus$attendance$attendance_state
              .stub(_res);
}

class Subscription$AttendanceStatus$attendance$attendance_state {
  Subscription$AttendanceStatus$attendance$attendance_state({
    this.is_late,
    required this.id,
    this.$__typename = 'attendance_state',
  });

  factory Subscription$AttendanceStatus$attendance$attendance_state.fromJson(
      Map<String, dynamic> json) {
    final l$is_late = json['is_late'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$AttendanceStatus$attendance$attendance_state(
      is_late: (l$is_late as bool?),
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? is_late;

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$is_late = is_late;
    _resultData['is_late'] = l$is_late;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$is_late = is_late;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$is_late,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$AttendanceStatus$attendance$attendance_state ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$is_late = is_late;
    final lOther$is_late = other.is_late;
    if (l$is_late != lOther$is_late) {
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

extension UtilityExtension$Subscription$AttendanceStatus$attendance$attendance_state
    on Subscription$AttendanceStatus$attendance$attendance_state {
  CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<
          Subscription$AttendanceStatus$attendance$attendance_state>
      get copyWith =>
          CopyWith$Subscription$AttendanceStatus$attendance$attendance_state(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<
    TRes> {
  factory CopyWith$Subscription$AttendanceStatus$attendance$attendance_state(
    Subscription$AttendanceStatus$attendance$attendance_state instance,
    TRes Function(Subscription$AttendanceStatus$attendance$attendance_state)
        then,
  ) = _CopyWithImpl$Subscription$AttendanceStatus$attendance$attendance_state;

  factory CopyWith$Subscription$AttendanceStatus$attendance$attendance_state.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$AttendanceStatus$attendance$attendance_state;

  TRes call({
    bool? is_late,
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$AttendanceStatus$attendance$attendance_state<
        TRes>
    implements
        CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<
            TRes> {
  _CopyWithImpl$Subscription$AttendanceStatus$attendance$attendance_state(
    this._instance,
    this._then,
  );

  final Subscription$AttendanceStatus$attendance$attendance_state _instance;

  final TRes Function(Subscription$AttendanceStatus$attendance$attendance_state)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? is_late = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$AttendanceStatus$attendance$attendance_state(
        is_late: is_late == _undefined ? _instance.is_late : (is_late as bool?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$AttendanceStatus$attendance$attendance_state<
        TRes>
    implements
        CopyWith$Subscription$AttendanceStatus$attendance$attendance_state<
            TRes> {
  _CopyWithStubImpl$Subscription$AttendanceStatus$attendance$attendance_state(
      this._res);

  TRes _res;

  call({
    bool? is_late,
    String? id,
    String? $__typename,
  }) =>
      _res;
}
