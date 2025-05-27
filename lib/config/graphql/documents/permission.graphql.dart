import '../schema.graphqls.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$GetAllReason {
  Query$GetAllReason({
    required this.leave_type,
    this.$__typename = 'query_root',
  });

  factory Query$GetAllReason.fromJson(Map<String, dynamic> json) {
    final l$leave_type = json['leave_type'];
    final l$$__typename = json['__typename'];
    return Query$GetAllReason(
      leave_type: (l$leave_type as List<dynamic>)
          .map((e) => Query$GetAllReason$leave_type.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetAllReason$leave_type> leave_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$leave_type = leave_type;
    _resultData['leave_type'] = l$leave_type.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$leave_type = leave_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$leave_type.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllReason || runtimeType != other.runtimeType) {
      return false;
    }
    final l$leave_type = leave_type;
    final lOther$leave_type = other.leave_type;
    if (l$leave_type.length != lOther$leave_type.length) {
      return false;
    }
    for (int i = 0; i < l$leave_type.length; i++) {
      final l$leave_type$entry = l$leave_type[i];
      final lOther$leave_type$entry = lOther$leave_type[i];
      if (l$leave_type$entry != lOther$leave_type$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllReason on Query$GetAllReason {
  CopyWith$Query$GetAllReason<Query$GetAllReason> get copyWith =>
      CopyWith$Query$GetAllReason(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetAllReason<TRes> {
  factory CopyWith$Query$GetAllReason(
    Query$GetAllReason instance,
    TRes Function(Query$GetAllReason) then,
  ) = _CopyWithImpl$Query$GetAllReason;

  factory CopyWith$Query$GetAllReason.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllReason;

  TRes call({
    List<Query$GetAllReason$leave_type>? leave_type,
    String? $__typename,
  });
  TRes leave_type(
      Iterable<Query$GetAllReason$leave_type> Function(
              Iterable<
                  CopyWith$Query$GetAllReason$leave_type<
                      Query$GetAllReason$leave_type>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllReason<TRes>
    implements CopyWith$Query$GetAllReason<TRes> {
  _CopyWithImpl$Query$GetAllReason(
    this._instance,
    this._then,
  );

  final Query$GetAllReason _instance;

  final TRes Function(Query$GetAllReason) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? leave_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllReason(
        leave_type: leave_type == _undefined || leave_type == null
            ? _instance.leave_type
            : (leave_type as List<Query$GetAllReason$leave_type>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes leave_type(
          Iterable<Query$GetAllReason$leave_type> Function(
                  Iterable<
                      CopyWith$Query$GetAllReason$leave_type<
                          Query$GetAllReason$leave_type>>)
              _fn) =>
      call(
          leave_type: _fn(_instance.leave_type
              .map((e) => CopyWith$Query$GetAllReason$leave_type(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetAllReason<TRes>
    implements CopyWith$Query$GetAllReason<TRes> {
  _CopyWithStubImpl$Query$GetAllReason(this._res);

  TRes _res;

  call({
    List<Query$GetAllReason$leave_type>? leave_type,
    String? $__typename,
  }) =>
      _res;

  leave_type(_fn) => _res;
}

const documentNodeQueryGetAllReason = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllReason'),
    variableDefinitions: [],
    directives: [
      DirectiveNode(
        name: NameNode(value: 'cached'),
        arguments: [],
      )
    ],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'leave_type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'type'),
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
Query$GetAllReason _parserFn$Query$GetAllReason(Map<String, dynamic> data) =>
    Query$GetAllReason.fromJson(data);
typedef OnQueryComplete$Query$GetAllReason = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetAllReason?,
);

class Options$Query$GetAllReason
    extends graphql.QueryOptions<Query$GetAllReason> {
  Options$Query$GetAllReason({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllReason? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetAllReason? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$GetAllReason(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetAllReason,
          parserFn: _parserFn$Query$GetAllReason,
        );

  final OnQueryComplete$Query$GetAllReason? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetAllReason
    extends graphql.WatchQueryOptions<Query$GetAllReason> {
  WatchOptions$Query$GetAllReason({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllReason? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetAllReason,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetAllReason,
        );
}

class FetchMoreOptions$Query$GetAllReason extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllReason(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetAllReason,
        );
}

extension ClientExtension$Query$GetAllReason on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllReason>> query$GetAllReason(
          [Options$Query$GetAllReason? options]) async =>
      await this.query(options ?? Options$Query$GetAllReason());
  graphql.ObservableQuery<Query$GetAllReason> watchQuery$GetAllReason(
          [WatchOptions$Query$GetAllReason? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetAllReason());
  void writeQuery$GetAllReason({
    required Query$GetAllReason data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetAllReason)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetAllReason? readQuery$GetAllReason({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetAllReason)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetAllReason.fromJson(result);
  }
}

class Query$GetAllReason$leave_type {
  Query$GetAllReason$leave_type({
    required this.type,
    this.$__typename = 'leave_type',
  });

  factory Query$GetAllReason$leave_type.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Query$GetAllReason$leave_type(
      type: (l$type as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = l$type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllReason$leave_type ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension$Query$GetAllReason$leave_type
    on Query$GetAllReason$leave_type {
  CopyWith$Query$GetAllReason$leave_type<Query$GetAllReason$leave_type>
      get copyWith => CopyWith$Query$GetAllReason$leave_type(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllReason$leave_type<TRes> {
  factory CopyWith$Query$GetAllReason$leave_type(
    Query$GetAllReason$leave_type instance,
    TRes Function(Query$GetAllReason$leave_type) then,
  ) = _CopyWithImpl$Query$GetAllReason$leave_type;

  factory CopyWith$Query$GetAllReason$leave_type.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllReason$leave_type;

  TRes call({
    String? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllReason$leave_type<TRes>
    implements CopyWith$Query$GetAllReason$leave_type<TRes> {
  _CopyWithImpl$Query$GetAllReason$leave_type(
    this._instance,
    this._then,
  );

  final Query$GetAllReason$leave_type _instance;

  final TRes Function(Query$GetAllReason$leave_type) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllReason$leave_type(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllReason$leave_type<TRes>
    implements CopyWith$Query$GetAllReason$leave_type<TRes> {
  _CopyWithStubImpl$Query$GetAllReason$leave_type(this._res);

  TRes _res;

  call({
    String? type,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$InsertLeave {
  factory Variables$Mutation$InsertLeave({
    required String employee_id,
    required String end_date,
    String? file,
    String? comment,
    required Enum$leave_type_enum leave_type,
    String? other_description,
    required String start_date,
  }) =>
      Variables$Mutation$InsertLeave._({
        r'employee_id': employee_id,
        r'end_date': end_date,
        if (file != null) r'file': file,
        if (comment != null) r'comment': comment,
        r'leave_type': leave_type,
        if (other_description != null) r'other_description': other_description,
        r'start_date': start_date,
      });

  Variables$Mutation$InsertLeave._(this._$data);

  factory Variables$Mutation$InsertLeave.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    final l$end_date = data['end_date'];
    result$data['end_date'] = (l$end_date as String);
    if (data.containsKey('file')) {
      final l$file = data['file'];
      result$data['file'] = (l$file as String?);
    }
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    final l$leave_type = data['leave_type'];
    result$data['leave_type'] =
        fromJson$Enum$leave_type_enum((l$leave_type as String));
    if (data.containsKey('other_description')) {
      final l$other_description = data['other_description'];
      result$data['other_description'] = (l$other_description as String?);
    }
    final l$start_date = data['start_date'];
    result$data['start_date'] = (l$start_date as String);
    return Variables$Mutation$InsertLeave._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  String get end_date => (_$data['end_date'] as String);

  String? get file => (_$data['file'] as String?);

  String? get comment => (_$data['comment'] as String?);

  Enum$leave_type_enum get leave_type =>
      (_$data['leave_type'] as Enum$leave_type_enum);

  String? get other_description => (_$data['other_description'] as String?);

  String get start_date => (_$data['start_date'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    final l$end_date = end_date;
    result$data['end_date'] = l$end_date;
    if (_$data.containsKey('file')) {
      final l$file = file;
      result$data['file'] = l$file;
    }
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    final l$leave_type = leave_type;
    result$data['leave_type'] = toJson$Enum$leave_type_enum(l$leave_type);
    if (_$data.containsKey('other_description')) {
      final l$other_description = other_description;
      result$data['other_description'] = l$other_description;
    }
    final l$start_date = start_date;
    result$data['start_date'] = l$start_date;
    return result$data;
  }

  CopyWith$Variables$Mutation$InsertLeave<Variables$Mutation$InsertLeave>
      get copyWith => CopyWith$Variables$Mutation$InsertLeave(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InsertLeave ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
      return false;
    }
    final l$end_date = end_date;
    final lOther$end_date = other.end_date;
    if (l$end_date != lOther$end_date) {
      return false;
    }
    final l$file = file;
    final lOther$file = other.file;
    if (_$data.containsKey('file') != other._$data.containsKey('file')) {
      return false;
    }
    if (l$file != lOther$file) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$leave_type = leave_type;
    final lOther$leave_type = other.leave_type;
    if (l$leave_type != lOther$leave_type) {
      return false;
    }
    final l$other_description = other_description;
    final lOther$other_description = other.other_description;
    if (_$data.containsKey('other_description') !=
        other._$data.containsKey('other_description')) {
      return false;
    }
    if (l$other_description != lOther$other_description) {
      return false;
    }
    final l$start_date = start_date;
    final lOther$start_date = other.start_date;
    if (l$start_date != lOther$start_date) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$employee_id = employee_id;
    final l$end_date = end_date;
    final l$file = file;
    final l$comment = comment;
    final l$leave_type = leave_type;
    final l$other_description = other_description;
    final l$start_date = start_date;
    return Object.hashAll([
      l$employee_id,
      l$end_date,
      _$data.containsKey('file') ? l$file : const {},
      _$data.containsKey('comment') ? l$comment : const {},
      l$leave_type,
      _$data.containsKey('other_description') ? l$other_description : const {},
      l$start_date,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InsertLeave<TRes> {
  factory CopyWith$Variables$Mutation$InsertLeave(
    Variables$Mutation$InsertLeave instance,
    TRes Function(Variables$Mutation$InsertLeave) then,
  ) = _CopyWithImpl$Variables$Mutation$InsertLeave;

  factory CopyWith$Variables$Mutation$InsertLeave.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InsertLeave;

  TRes call({
    String? employee_id,
    String? end_date,
    String? file,
    String? comment,
    Enum$leave_type_enum? leave_type,
    String? other_description,
    String? start_date,
  });
}

class _CopyWithImpl$Variables$Mutation$InsertLeave<TRes>
    implements CopyWith$Variables$Mutation$InsertLeave<TRes> {
  _CopyWithImpl$Variables$Mutation$InsertLeave(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InsertLeave _instance;

  final TRes Function(Variables$Mutation$InsertLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? employee_id = _undefined,
    Object? end_date = _undefined,
    Object? file = _undefined,
    Object? comment = _undefined,
    Object? leave_type = _undefined,
    Object? other_description = _undefined,
    Object? start_date = _undefined,
  }) =>
      _then(Variables$Mutation$InsertLeave._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
        if (end_date != _undefined && end_date != null)
          'end_date': (end_date as String),
        if (file != _undefined) 'file': (file as String?),
        if (comment != _undefined) 'comment': (comment as String?),
        if (leave_type != _undefined && leave_type != null)
          'leave_type': (leave_type as Enum$leave_type_enum),
        if (other_description != _undefined)
          'other_description': (other_description as String?),
        if (start_date != _undefined && start_date != null)
          'start_date': (start_date as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$InsertLeave<TRes>
    implements CopyWith$Variables$Mutation$InsertLeave<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InsertLeave(this._res);

  TRes _res;

  call({
    String? employee_id,
    String? end_date,
    String? file,
    String? comment,
    Enum$leave_type_enum? leave_type,
    String? other_description,
    String? start_date,
  }) =>
      _res;
}

class Mutation$InsertLeave {
  Mutation$InsertLeave({
    this.insert_leaves_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$InsertLeave.fromJson(Map<String, dynamic> json) {
    final l$insert_leaves_one = json['insert_leaves_one'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertLeave(
      insert_leaves_one: l$insert_leaves_one == null
          ? null
          : Mutation$InsertLeave$insert_leaves_one.fromJson(
              (l$insert_leaves_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InsertLeave$insert_leaves_one? insert_leaves_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_leaves_one = insert_leaves_one;
    _resultData['insert_leaves_one'] = l$insert_leaves_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_leaves_one = insert_leaves_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_leaves_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InsertLeave || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_leaves_one = insert_leaves_one;
    final lOther$insert_leaves_one = other.insert_leaves_one;
    if (l$insert_leaves_one != lOther$insert_leaves_one) {
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

extension UtilityExtension$Mutation$InsertLeave on Mutation$InsertLeave {
  CopyWith$Mutation$InsertLeave<Mutation$InsertLeave> get copyWith =>
      CopyWith$Mutation$InsertLeave(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$InsertLeave<TRes> {
  factory CopyWith$Mutation$InsertLeave(
    Mutation$InsertLeave instance,
    TRes Function(Mutation$InsertLeave) then,
  ) = _CopyWithImpl$Mutation$InsertLeave;

  factory CopyWith$Mutation$InsertLeave.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InsertLeave;

  TRes call({
    Mutation$InsertLeave$insert_leaves_one? insert_leaves_one,
    String? $__typename,
  });
  CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> get insert_leaves_one;
}

class _CopyWithImpl$Mutation$InsertLeave<TRes>
    implements CopyWith$Mutation$InsertLeave<TRes> {
  _CopyWithImpl$Mutation$InsertLeave(
    this._instance,
    this._then,
  );

  final Mutation$InsertLeave _instance;

  final TRes Function(Mutation$InsertLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_leaves_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InsertLeave(
        insert_leaves_one: insert_leaves_one == _undefined
            ? _instance.insert_leaves_one
            : (insert_leaves_one as Mutation$InsertLeave$insert_leaves_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> get insert_leaves_one {
    final local$insert_leaves_one = _instance.insert_leaves_one;
    return local$insert_leaves_one == null
        ? CopyWith$Mutation$InsertLeave$insert_leaves_one.stub(_then(_instance))
        : CopyWith$Mutation$InsertLeave$insert_leaves_one(
            local$insert_leaves_one, (e) => call(insert_leaves_one: e));
  }
}

class _CopyWithStubImpl$Mutation$InsertLeave<TRes>
    implements CopyWith$Mutation$InsertLeave<TRes> {
  _CopyWithStubImpl$Mutation$InsertLeave(this._res);

  TRes _res;

  call({
    Mutation$InsertLeave$insert_leaves_one? insert_leaves_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> get insert_leaves_one =>
      CopyWith$Mutation$InsertLeave$insert_leaves_one.stub(_res);
}

const documentNodeMutationInsertLeave = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InsertLeave'),
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
        variable: VariableNode(name: NameNode(value: 'end_date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'file')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'comment')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'leave_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'leave_type_enum'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'other_description')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'start_date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_leaves_one'),
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
                name: NameNode(value: 'end_date'),
                value: VariableNode(name: NameNode(value: 'end_date')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'file'),
                value: VariableNode(name: NameNode(value: 'file')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'comment'),
                value: VariableNode(name: NameNode(value: 'comment')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'leave_type'),
                value: VariableNode(name: NameNode(value: 'leave_type')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'other_description'),
                value: VariableNode(name: NameNode(value: 'other_description')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'start_date'),
                value: VariableNode(name: NameNode(value: 'start_date')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: EnumValueNode(name: NameNode(value: 'PENDING')),
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
Mutation$InsertLeave _parserFn$Mutation$InsertLeave(
        Map<String, dynamic> data) =>
    Mutation$InsertLeave.fromJson(data);
typedef OnMutationCompleted$Mutation$InsertLeave = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$InsertLeave?,
);

class Options$Mutation$InsertLeave
    extends graphql.MutationOptions<Mutation$InsertLeave> {
  Options$Mutation$InsertLeave({
    String? operationName,
    required Variables$Mutation$InsertLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InsertLeave? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InsertLeave? onCompleted,
    graphql.OnMutationUpdate<Mutation$InsertLeave>? update,
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
                    data == null ? null : _parserFn$Mutation$InsertLeave(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInsertLeave,
          parserFn: _parserFn$Mutation$InsertLeave,
        );

  final OnMutationCompleted$Mutation$InsertLeave? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InsertLeave
    extends graphql.WatchQueryOptions<Mutation$InsertLeave> {
  WatchOptions$Mutation$InsertLeave({
    String? operationName,
    required Variables$Mutation$InsertLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InsertLeave? typedOptimisticResult,
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
          document: documentNodeMutationInsertLeave,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InsertLeave,
        );
}

extension ClientExtension$Mutation$InsertLeave on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InsertLeave>> mutate$InsertLeave(
          Options$Mutation$InsertLeave options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$InsertLeave> watchMutation$InsertLeave(
          WatchOptions$Mutation$InsertLeave options) =>
      this.watchMutation(options);
}

class Mutation$InsertLeave$insert_leaves_one {
  Mutation$InsertLeave$insert_leaves_one({
    required this.id,
    this.$__typename = 'leaves',
  });

  factory Mutation$InsertLeave$insert_leaves_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$InsertLeave$insert_leaves_one(
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
    if (other is! Mutation$InsertLeave$insert_leaves_one ||
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

extension UtilityExtension$Mutation$InsertLeave$insert_leaves_one
    on Mutation$InsertLeave$insert_leaves_one {
  CopyWith$Mutation$InsertLeave$insert_leaves_one<
          Mutation$InsertLeave$insert_leaves_one>
      get copyWith => CopyWith$Mutation$InsertLeave$insert_leaves_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> {
  factory CopyWith$Mutation$InsertLeave$insert_leaves_one(
    Mutation$InsertLeave$insert_leaves_one instance,
    TRes Function(Mutation$InsertLeave$insert_leaves_one) then,
  ) = _CopyWithImpl$Mutation$InsertLeave$insert_leaves_one;

  factory CopyWith$Mutation$InsertLeave$insert_leaves_one.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InsertLeave$insert_leaves_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InsertLeave$insert_leaves_one<TRes>
    implements CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> {
  _CopyWithImpl$Mutation$InsertLeave$insert_leaves_one(
    this._instance,
    this._then,
  );

  final Mutation$InsertLeave$insert_leaves_one _instance;

  final TRes Function(Mutation$InsertLeave$insert_leaves_one) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InsertLeave$insert_leaves_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$InsertLeave$insert_leaves_one<TRes>
    implements CopyWith$Mutation$InsertLeave$insert_leaves_one<TRes> {
  _CopyWithStubImpl$Mutation$InsertLeave$insert_leaves_one(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateLeave {
  factory Variables$Mutation$UpdateLeave({
    required String id,
    Enum$leave_type_enum? leave_type,
    String? end_date,
    String? start_date,
    String? other_description,
    String? comment,
    String? file,
  }) =>
      Variables$Mutation$UpdateLeave._({
        r'id': id,
        if (leave_type != null) r'leave_type': leave_type,
        if (end_date != null) r'end_date': end_date,
        if (start_date != null) r'start_date': start_date,
        if (other_description != null) r'other_description': other_description,
        if (comment != null) r'comment': comment,
        if (file != null) r'file': file,
      });

  Variables$Mutation$UpdateLeave._(this._$data);

  factory Variables$Mutation$UpdateLeave.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('leave_type')) {
      final l$leave_type = data['leave_type'];
      result$data['leave_type'] = l$leave_type == null
          ? null
          : fromJson$Enum$leave_type_enum((l$leave_type as String));
    }
    if (data.containsKey('end_date')) {
      final l$end_date = data['end_date'];
      result$data['end_date'] = (l$end_date as String?);
    }
    if (data.containsKey('start_date')) {
      final l$start_date = data['start_date'];
      result$data['start_date'] = (l$start_date as String?);
    }
    if (data.containsKey('other_description')) {
      final l$other_description = data['other_description'];
      result$data['other_description'] = (l$other_description as String?);
    }
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    if (data.containsKey('file')) {
      final l$file = data['file'];
      result$data['file'] = (l$file as String?);
    }
    return Variables$Mutation$UpdateLeave._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Enum$leave_type_enum? get leave_type =>
      (_$data['leave_type'] as Enum$leave_type_enum?);

  String? get end_date => (_$data['end_date'] as String?);

  String? get start_date => (_$data['start_date'] as String?);

  String? get other_description => (_$data['other_description'] as String?);

  String? get comment => (_$data['comment'] as String?);

  String? get file => (_$data['file'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('leave_type')) {
      final l$leave_type = leave_type;
      result$data['leave_type'] = l$leave_type == null
          ? null
          : toJson$Enum$leave_type_enum(l$leave_type);
    }
    if (_$data.containsKey('end_date')) {
      final l$end_date = end_date;
      result$data['end_date'] = l$end_date;
    }
    if (_$data.containsKey('start_date')) {
      final l$start_date = start_date;
      result$data['start_date'] = l$start_date;
    }
    if (_$data.containsKey('other_description')) {
      final l$other_description = other_description;
      result$data['other_description'] = l$other_description;
    }
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    if (_$data.containsKey('file')) {
      final l$file = file;
      result$data['file'] = l$file;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateLeave<Variables$Mutation$UpdateLeave>
      get copyWith => CopyWith$Variables$Mutation$UpdateLeave(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateLeave ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$leave_type = leave_type;
    final lOther$leave_type = other.leave_type;
    if (_$data.containsKey('leave_type') !=
        other._$data.containsKey('leave_type')) {
      return false;
    }
    if (l$leave_type != lOther$leave_type) {
      return false;
    }
    final l$end_date = end_date;
    final lOther$end_date = other.end_date;
    if (_$data.containsKey('end_date') !=
        other._$data.containsKey('end_date')) {
      return false;
    }
    if (l$end_date != lOther$end_date) {
      return false;
    }
    final l$start_date = start_date;
    final lOther$start_date = other.start_date;
    if (_$data.containsKey('start_date') !=
        other._$data.containsKey('start_date')) {
      return false;
    }
    if (l$start_date != lOther$start_date) {
      return false;
    }
    final l$other_description = other_description;
    final lOther$other_description = other.other_description;
    if (_$data.containsKey('other_description') !=
        other._$data.containsKey('other_description')) {
      return false;
    }
    if (l$other_description != lOther$other_description) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$file = file;
    final lOther$file = other.file;
    if (_$data.containsKey('file') != other._$data.containsKey('file')) {
      return false;
    }
    if (l$file != lOther$file) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$leave_type = leave_type;
    final l$end_date = end_date;
    final l$start_date = start_date;
    final l$other_description = other_description;
    final l$comment = comment;
    final l$file = file;
    return Object.hashAll([
      l$id,
      _$data.containsKey('leave_type') ? l$leave_type : const {},
      _$data.containsKey('end_date') ? l$end_date : const {},
      _$data.containsKey('start_date') ? l$start_date : const {},
      _$data.containsKey('other_description') ? l$other_description : const {},
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('file') ? l$file : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateLeave<TRes> {
  factory CopyWith$Variables$Mutation$UpdateLeave(
    Variables$Mutation$UpdateLeave instance,
    TRes Function(Variables$Mutation$UpdateLeave) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateLeave;

  factory CopyWith$Variables$Mutation$UpdateLeave.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateLeave;

  TRes call({
    String? id,
    Enum$leave_type_enum? leave_type,
    String? end_date,
    String? start_date,
    String? other_description,
    String? comment,
    String? file,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateLeave<TRes>
    implements CopyWith$Variables$Mutation$UpdateLeave<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateLeave(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateLeave _instance;

  final TRes Function(Variables$Mutation$UpdateLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? leave_type = _undefined,
    Object? end_date = _undefined,
    Object? start_date = _undefined,
    Object? other_description = _undefined,
    Object? comment = _undefined,
    Object? file = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateLeave._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (leave_type != _undefined)
          'leave_type': (leave_type as Enum$leave_type_enum?),
        if (end_date != _undefined) 'end_date': (end_date as String?),
        if (start_date != _undefined) 'start_date': (start_date as String?),
        if (other_description != _undefined)
          'other_description': (other_description as String?),
        if (comment != _undefined) 'comment': (comment as String?),
        if (file != _undefined) 'file': (file as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateLeave<TRes>
    implements CopyWith$Variables$Mutation$UpdateLeave<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateLeave(this._res);

  TRes _res;

  call({
    String? id,
    Enum$leave_type_enum? leave_type,
    String? end_date,
    String? start_date,
    String? other_description,
    String? comment,
    String? file,
  }) =>
      _res;
}

class Mutation$UpdateLeave {
  Mutation$UpdateLeave({
    this.update_leaves_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$UpdateLeave.fromJson(Map<String, dynamic> json) {
    final l$update_leaves_by_pk = json['update_leaves_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateLeave(
      update_leaves_by_pk: l$update_leaves_by_pk == null
          ? null
          : Mutation$UpdateLeave$update_leaves_by_pk.fromJson(
              (l$update_leaves_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateLeave$update_leaves_by_pk? update_leaves_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_leaves_by_pk = update_leaves_by_pk;
    _resultData['update_leaves_by_pk'] = l$update_leaves_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_leaves_by_pk = update_leaves_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_leaves_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateLeave || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_leaves_by_pk = update_leaves_by_pk;
    final lOther$update_leaves_by_pk = other.update_leaves_by_pk;
    if (l$update_leaves_by_pk != lOther$update_leaves_by_pk) {
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

extension UtilityExtension$Mutation$UpdateLeave on Mutation$UpdateLeave {
  CopyWith$Mutation$UpdateLeave<Mutation$UpdateLeave> get copyWith =>
      CopyWith$Mutation$UpdateLeave(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateLeave<TRes> {
  factory CopyWith$Mutation$UpdateLeave(
    Mutation$UpdateLeave instance,
    TRes Function(Mutation$UpdateLeave) then,
  ) = _CopyWithImpl$Mutation$UpdateLeave;

  factory CopyWith$Mutation$UpdateLeave.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateLeave;

  TRes call({
    Mutation$UpdateLeave$update_leaves_by_pk? update_leaves_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes>
      get update_leaves_by_pk;
}

class _CopyWithImpl$Mutation$UpdateLeave<TRes>
    implements CopyWith$Mutation$UpdateLeave<TRes> {
  _CopyWithImpl$Mutation$UpdateLeave(
    this._instance,
    this._then,
  );

  final Mutation$UpdateLeave _instance;

  final TRes Function(Mutation$UpdateLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? update_leaves_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateLeave(
        update_leaves_by_pk: update_leaves_by_pk == _undefined
            ? _instance.update_leaves_by_pk
            : (update_leaves_by_pk
                as Mutation$UpdateLeave$update_leaves_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes>
      get update_leaves_by_pk {
    final local$update_leaves_by_pk = _instance.update_leaves_by_pk;
    return local$update_leaves_by_pk == null
        ? CopyWith$Mutation$UpdateLeave$update_leaves_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateLeave$update_leaves_by_pk(
            local$update_leaves_by_pk, (e) => call(update_leaves_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateLeave<TRes>
    implements CopyWith$Mutation$UpdateLeave<TRes> {
  _CopyWithStubImpl$Mutation$UpdateLeave(this._res);

  TRes _res;

  call({
    Mutation$UpdateLeave$update_leaves_by_pk? update_leaves_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes>
      get update_leaves_by_pk =>
          CopyWith$Mutation$UpdateLeave$update_leaves_by_pk.stub(_res);
}

const documentNodeMutationUpdateLeave = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateLeave'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'leave_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'leave_type_enum'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'end_date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'start_date')),
        type: NamedTypeNode(
          name: NameNode(value: 'date'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'other_description')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'comment')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'file')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_leaves_by_pk'),
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
                name: NameNode(value: 'leave_type'),
                value: VariableNode(name: NameNode(value: 'leave_type')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'end_date'),
                value: VariableNode(name: NameNode(value: 'end_date')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'start_date'),
                value: VariableNode(name: NameNode(value: 'start_date')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'other_description'),
                value: VariableNode(name: NameNode(value: 'other_description')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'comment'),
                value: VariableNode(name: NameNode(value: 'comment')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'file'),
                value: VariableNode(name: NameNode(value: 'file')),
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
Mutation$UpdateLeave _parserFn$Mutation$UpdateLeave(
        Map<String, dynamic> data) =>
    Mutation$UpdateLeave.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateLeave = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateLeave?,
);

class Options$Mutation$UpdateLeave
    extends graphql.MutationOptions<Mutation$UpdateLeave> {
  Options$Mutation$UpdateLeave({
    String? operationName,
    required Variables$Mutation$UpdateLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateLeave? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateLeave? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateLeave>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateLeave(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateLeave,
          parserFn: _parserFn$Mutation$UpdateLeave,
        );

  final OnMutationCompleted$Mutation$UpdateLeave? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateLeave
    extends graphql.WatchQueryOptions<Mutation$UpdateLeave> {
  WatchOptions$Mutation$UpdateLeave({
    String? operationName,
    required Variables$Mutation$UpdateLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateLeave? typedOptimisticResult,
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
          document: documentNodeMutationUpdateLeave,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateLeave,
        );
}

extension ClientExtension$Mutation$UpdateLeave on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateLeave>> mutate$UpdateLeave(
          Options$Mutation$UpdateLeave options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateLeave> watchMutation$UpdateLeave(
          WatchOptions$Mutation$UpdateLeave options) =>
      this.watchMutation(options);
}

class Mutation$UpdateLeave$update_leaves_by_pk {
  Mutation$UpdateLeave$update_leaves_by_pk({
    required this.id,
    this.$__typename = 'leaves',
  });

  factory Mutation$UpdateLeave$update_leaves_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateLeave$update_leaves_by_pk(
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
    if (other is! Mutation$UpdateLeave$update_leaves_by_pk ||
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

extension UtilityExtension$Mutation$UpdateLeave$update_leaves_by_pk
    on Mutation$UpdateLeave$update_leaves_by_pk {
  CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<
          Mutation$UpdateLeave$update_leaves_by_pk>
      get copyWith => CopyWith$Mutation$UpdateLeave$update_leaves_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes> {
  factory CopyWith$Mutation$UpdateLeave$update_leaves_by_pk(
    Mutation$UpdateLeave$update_leaves_by_pk instance,
    TRes Function(Mutation$UpdateLeave$update_leaves_by_pk) then,
  ) = _CopyWithImpl$Mutation$UpdateLeave$update_leaves_by_pk;

  factory CopyWith$Mutation$UpdateLeave$update_leaves_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateLeave$update_leaves_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateLeave$update_leaves_by_pk<TRes>
    implements CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes> {
  _CopyWithImpl$Mutation$UpdateLeave$update_leaves_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$UpdateLeave$update_leaves_by_pk _instance;

  final TRes Function(Mutation$UpdateLeave$update_leaves_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateLeave$update_leaves_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateLeave$update_leaves_by_pk<TRes>
    implements CopyWith$Mutation$UpdateLeave$update_leaves_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$UpdateLeave$update_leaves_by_pk(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteLeave {
  factory Variables$Mutation$DeleteLeave({required String id}) =>
      Variables$Mutation$DeleteLeave._({
        r'id': id,
      });

  Variables$Mutation$DeleteLeave._(this._$data);

  factory Variables$Mutation$DeleteLeave.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeleteLeave._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteLeave<Variables$Mutation$DeleteLeave>
      get copyWith => CopyWith$Variables$Mutation$DeleteLeave(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteLeave ||
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

abstract class CopyWith$Variables$Mutation$DeleteLeave<TRes> {
  factory CopyWith$Variables$Mutation$DeleteLeave(
    Variables$Mutation$DeleteLeave instance,
    TRes Function(Variables$Mutation$DeleteLeave) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteLeave;

  factory CopyWith$Variables$Mutation$DeleteLeave.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteLeave;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeleteLeave<TRes>
    implements CopyWith$Variables$Mutation$DeleteLeave<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteLeave(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteLeave _instance;

  final TRes Function(Variables$Mutation$DeleteLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeleteLeave._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteLeave<TRes>
    implements CopyWith$Variables$Mutation$DeleteLeave<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteLeave(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeleteLeave {
  Mutation$DeleteLeave({
    this.delete_leaves_by_pk,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$DeleteLeave.fromJson(Map<String, dynamic> json) {
    final l$delete_leaves_by_pk = json['delete_leaves_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteLeave(
      delete_leaves_by_pk: l$delete_leaves_by_pk == null
          ? null
          : Mutation$DeleteLeave$delete_leaves_by_pk.fromJson(
              (l$delete_leaves_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteLeave$delete_leaves_by_pk? delete_leaves_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_leaves_by_pk = delete_leaves_by_pk;
    _resultData['delete_leaves_by_pk'] = l$delete_leaves_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_leaves_by_pk = delete_leaves_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_leaves_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteLeave || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_leaves_by_pk = delete_leaves_by_pk;
    final lOther$delete_leaves_by_pk = other.delete_leaves_by_pk;
    if (l$delete_leaves_by_pk != lOther$delete_leaves_by_pk) {
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

extension UtilityExtension$Mutation$DeleteLeave on Mutation$DeleteLeave {
  CopyWith$Mutation$DeleteLeave<Mutation$DeleteLeave> get copyWith =>
      CopyWith$Mutation$DeleteLeave(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteLeave<TRes> {
  factory CopyWith$Mutation$DeleteLeave(
    Mutation$DeleteLeave instance,
    TRes Function(Mutation$DeleteLeave) then,
  ) = _CopyWithImpl$Mutation$DeleteLeave;

  factory CopyWith$Mutation$DeleteLeave.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteLeave;

  TRes call({
    Mutation$DeleteLeave$delete_leaves_by_pk? delete_leaves_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes>
      get delete_leaves_by_pk;
}

class _CopyWithImpl$Mutation$DeleteLeave<TRes>
    implements CopyWith$Mutation$DeleteLeave<TRes> {
  _CopyWithImpl$Mutation$DeleteLeave(
    this._instance,
    this._then,
  );

  final Mutation$DeleteLeave _instance;

  final TRes Function(Mutation$DeleteLeave) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delete_leaves_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteLeave(
        delete_leaves_by_pk: delete_leaves_by_pk == _undefined
            ? _instance.delete_leaves_by_pk
            : (delete_leaves_by_pk
                as Mutation$DeleteLeave$delete_leaves_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes>
      get delete_leaves_by_pk {
    final local$delete_leaves_by_pk = _instance.delete_leaves_by_pk;
    return local$delete_leaves_by_pk == null
        ? CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk(
            local$delete_leaves_by_pk, (e) => call(delete_leaves_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteLeave<TRes>
    implements CopyWith$Mutation$DeleteLeave<TRes> {
  _CopyWithStubImpl$Mutation$DeleteLeave(this._res);

  TRes _res;

  call({
    Mutation$DeleteLeave$delete_leaves_by_pk? delete_leaves_by_pk,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes>
      get delete_leaves_by_pk =>
          CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk.stub(_res);
}

const documentNodeMutationDeleteLeave = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteLeave'),
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
        name: NameNode(value: 'delete_leaves_by_pk'),
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
Mutation$DeleteLeave _parserFn$Mutation$DeleteLeave(
        Map<String, dynamic> data) =>
    Mutation$DeleteLeave.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteLeave = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteLeave?,
);

class Options$Mutation$DeleteLeave
    extends graphql.MutationOptions<Mutation$DeleteLeave> {
  Options$Mutation$DeleteLeave({
    String? operationName,
    required Variables$Mutation$DeleteLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteLeave? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteLeave? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteLeave>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteLeave(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteLeave,
          parserFn: _parserFn$Mutation$DeleteLeave,
        );

  final OnMutationCompleted$Mutation$DeleteLeave? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteLeave
    extends graphql.WatchQueryOptions<Mutation$DeleteLeave> {
  WatchOptions$Mutation$DeleteLeave({
    String? operationName,
    required Variables$Mutation$DeleteLeave variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteLeave? typedOptimisticResult,
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
          document: documentNodeMutationDeleteLeave,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteLeave,
        );
}

extension ClientExtension$Mutation$DeleteLeave on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteLeave>> mutate$DeleteLeave(
          Options$Mutation$DeleteLeave options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteLeave> watchMutation$DeleteLeave(
          WatchOptions$Mutation$DeleteLeave options) =>
      this.watchMutation(options);
}

class Mutation$DeleteLeave$delete_leaves_by_pk {
  Mutation$DeleteLeave$delete_leaves_by_pk({
    required this.id,
    this.$__typename = 'leaves',
  });

  factory Mutation$DeleteLeave$delete_leaves_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteLeave$delete_leaves_by_pk(
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
    if (other is! Mutation$DeleteLeave$delete_leaves_by_pk ||
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

extension UtilityExtension$Mutation$DeleteLeave$delete_leaves_by_pk
    on Mutation$DeleteLeave$delete_leaves_by_pk {
  CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<
          Mutation$DeleteLeave$delete_leaves_by_pk>
      get copyWith => CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes> {
  factory CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk(
    Mutation$DeleteLeave$delete_leaves_by_pk instance,
    TRes Function(Mutation$DeleteLeave$delete_leaves_by_pk) then,
  ) = _CopyWithImpl$Mutation$DeleteLeave$delete_leaves_by_pk;

  factory CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteLeave$delete_leaves_by_pk;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteLeave$delete_leaves_by_pk<TRes>
    implements CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes> {
  _CopyWithImpl$Mutation$DeleteLeave$delete_leaves_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$DeleteLeave$delete_leaves_by_pk _instance;

  final TRes Function(Mutation$DeleteLeave$delete_leaves_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteLeave$delete_leaves_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteLeave$delete_leaves_by_pk<TRes>
    implements CopyWith$Mutation$DeleteLeave$delete_leaves_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$DeleteLeave$delete_leaves_by_pk(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$GetLeaves {
  factory Variables$Subscription$GetLeaves({
    required int limit,
    required int offset,
    required String $_eq,
  }) =>
      Variables$Subscription$GetLeaves._({
        r'limit': limit,
        r'offset': offset,
        r'_eq': $_eq,
      });

  Variables$Subscription$GetLeaves._(this._$data);

  factory Variables$Subscription$GetLeaves.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    final l$$_eq = data['_eq'];
    result$data['_eq'] = (l$$_eq as String);
    return Variables$Subscription$GetLeaves._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);

  int get offset => (_$data['offset'] as int);

  String get $_eq => (_$data['_eq'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    final l$$_eq = $_eq;
    result$data['_eq'] = l$$_eq;
    return result$data;
  }

  CopyWith$Variables$Subscription$GetLeaves<Variables$Subscription$GetLeaves>
      get copyWith => CopyWith$Variables$Subscription$GetLeaves(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$GetLeaves ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    final l$$_eq = $_eq;
    return Object.hashAll([
      l$limit,
      l$offset,
      l$$_eq,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$GetLeaves<TRes> {
  factory CopyWith$Variables$Subscription$GetLeaves(
    Variables$Subscription$GetLeaves instance,
    TRes Function(Variables$Subscription$GetLeaves) then,
  ) = _CopyWithImpl$Variables$Subscription$GetLeaves;

  factory CopyWith$Variables$Subscription$GetLeaves.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$GetLeaves;

  TRes call({
    int? limit,
    int? offset,
    String? $_eq,
  });
}

class _CopyWithImpl$Variables$Subscription$GetLeaves<TRes>
    implements CopyWith$Variables$Subscription$GetLeaves<TRes> {
  _CopyWithImpl$Variables$Subscription$GetLeaves(
    this._instance,
    this._then,
  );

  final Variables$Subscription$GetLeaves _instance;

  final TRes Function(Variables$Subscription$GetLeaves) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? $_eq = _undefined,
  }) =>
      _then(Variables$Subscription$GetLeaves._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
        if ($_eq != _undefined && $_eq != null) '_eq': ($_eq as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$GetLeaves<TRes>
    implements CopyWith$Variables$Subscription$GetLeaves<TRes> {
  _CopyWithStubImpl$Variables$Subscription$GetLeaves(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
    String? $_eq,
  }) =>
      _res;
}

class Subscription$GetLeaves {
  Subscription$GetLeaves({required this.leaves});

  factory Subscription$GetLeaves.fromJson(Map<String, dynamic> json) {
    final l$leaves = json['leaves'];
    return Subscription$GetLeaves(
        leaves: (l$leaves as List<dynamic>)
            .map((e) => Subscription$GetLeaves$leaves.fromJson(
                (e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$GetLeaves$leaves> leaves;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$leaves = leaves;
    _resultData['leaves'] = l$leaves.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$leaves = leaves;
    return Object.hashAll([Object.hashAll(l$leaves.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetLeaves || runtimeType != other.runtimeType) {
      return false;
    }
    final l$leaves = leaves;
    final lOther$leaves = other.leaves;
    if (l$leaves.length != lOther$leaves.length) {
      return false;
    }
    for (int i = 0; i < l$leaves.length; i++) {
      final l$leaves$entry = l$leaves[i];
      final lOther$leaves$entry = lOther$leaves[i];
      if (l$leaves$entry != lOther$leaves$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetLeaves on Subscription$GetLeaves {
  CopyWith$Subscription$GetLeaves<Subscription$GetLeaves> get copyWith =>
      CopyWith$Subscription$GetLeaves(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$GetLeaves<TRes> {
  factory CopyWith$Subscription$GetLeaves(
    Subscription$GetLeaves instance,
    TRes Function(Subscription$GetLeaves) then,
  ) = _CopyWithImpl$Subscription$GetLeaves;

  factory CopyWith$Subscription$GetLeaves.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetLeaves;

  TRes call({List<Subscription$GetLeaves$leaves>? leaves});
  TRes leaves(
      Iterable<Subscription$GetLeaves$leaves> Function(
              Iterable<
                  CopyWith$Subscription$GetLeaves$leaves<
                      Subscription$GetLeaves$leaves>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetLeaves<TRes>
    implements CopyWith$Subscription$GetLeaves<TRes> {
  _CopyWithImpl$Subscription$GetLeaves(
    this._instance,
    this._then,
  );

  final Subscription$GetLeaves _instance;

  final TRes Function(Subscription$GetLeaves) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? leaves = _undefined}) => _then(Subscription$GetLeaves(
      leaves: leaves == _undefined || leaves == null
          ? _instance.leaves
          : (leaves as List<Subscription$GetLeaves$leaves>)));

  TRes leaves(
          Iterable<Subscription$GetLeaves$leaves> Function(
                  Iterable<
                      CopyWith$Subscription$GetLeaves$leaves<
                          Subscription$GetLeaves$leaves>>)
              _fn) =>
      call(
          leaves: _fn(_instance.leaves
              .map((e) => CopyWith$Subscription$GetLeaves$leaves(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetLeaves<TRes>
    implements CopyWith$Subscription$GetLeaves<TRes> {
  _CopyWithStubImpl$Subscription$GetLeaves(this._res);

  TRes _res;

  call({List<Subscription$GetLeaves$leaves>? leaves}) => _res;

  leaves(_fn) => _res;
}

const documentNodeSubscriptionGetLeaves = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetLeaves'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_eq')),
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
        name: NameNode(value: 'leaves'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'created_at'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: '_eq')),
                  )
                ]),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'start_date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'leave_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'end_date'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comment'),
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
                name: NameNode(value: 'file'),
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
Subscription$GetLeaves _parserFn$Subscription$GetLeaves(
        Map<String, dynamic> data) =>
    Subscription$GetLeaves.fromJson(data);

class Options$Subscription$GetLeaves
    extends graphql.SubscriptionOptions<Subscription$GetLeaves> {
  Options$Subscription$GetLeaves({
    String? operationName,
    required Variables$Subscription$GetLeaves variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetLeaves? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionGetLeaves,
          parserFn: _parserFn$Subscription$GetLeaves,
        );
}

class WatchOptions$Subscription$GetLeaves
    extends graphql.WatchQueryOptions<Subscription$GetLeaves> {
  WatchOptions$Subscription$GetLeaves({
    String? operationName,
    required Variables$Subscription$GetLeaves variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetLeaves? typedOptimisticResult,
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
          document: documentNodeSubscriptionGetLeaves,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetLeaves,
        );
}

class FetchMoreOptions$Subscription$GetLeaves extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetLeaves({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$GetLeaves variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionGetLeaves,
        );
}

extension ClientExtension$Subscription$GetLeaves on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetLeaves>> subscribe$GetLeaves(
          Options$Subscription$GetLeaves options) =>
      this.subscribe(options);
  graphql.ObservableQuery<Subscription$GetLeaves> watchSubscription$GetLeaves(
          WatchOptions$Subscription$GetLeaves options) =>
      this.watchQuery(options);
}

class Subscription$GetLeaves$leaves {
  Subscription$GetLeaves$leaves({
    required this.id,
    this.status,
    required this.start_date,
    this.leave_type,
    required this.end_date,
    this.comment,
    this.employee,
    this.$__typename = 'leaves',
  });

  factory Subscription$GetLeaves$leaves.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$start_date = json['start_date'];
    final l$leave_type = json['leave_type'];
    final l$end_date = json['end_date'];
    final l$comment = json['comment'];
    final l$employee = json['employee'];
    final l$$__typename = json['__typename'];
    return Subscription$GetLeaves$leaves(
      id: (l$id as String),
      status: l$status == null
          ? null
          : fromJson$Enum$leave_status_enum((l$status as String)),
      start_date: (l$start_date as String),
      leave_type: l$leave_type == null
          ? null
          : fromJson$Enum$leave_type_enum((l$leave_type as String)),
      end_date: (l$end_date as String),
      comment: (l$comment as String?),
      employee: l$employee == null
          ? null
          : Subscription$GetLeaves$leaves$employee.fromJson(
              (l$employee as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$leave_status_enum? status;

  final String start_date;

  final Enum$leave_type_enum? leave_type;

  final String end_date;

  final String? comment;

  final Subscription$GetLeaves$leaves$employee? employee;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$leave_status_enum(l$status);
    final l$start_date = start_date;
    _resultData['start_date'] = l$start_date;
    final l$leave_type = leave_type;
    _resultData['leave_type'] =
        l$leave_type == null ? null : toJson$Enum$leave_type_enum(l$leave_type);
    final l$end_date = end_date;
    _resultData['end_date'] = l$end_date;
    final l$comment = comment;
    _resultData['comment'] = l$comment;
    final l$employee = employee;
    _resultData['employee'] = l$employee?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$start_date = start_date;
    final l$leave_type = leave_type;
    final l$end_date = end_date;
    final l$comment = comment;
    final l$employee = employee;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$start_date,
      l$leave_type,
      l$end_date,
      l$comment,
      l$employee,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetLeaves$leaves ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$start_date = start_date;
    final lOther$start_date = other.start_date;
    if (l$start_date != lOther$start_date) {
      return false;
    }
    final l$leave_type = leave_type;
    final lOther$leave_type = other.leave_type;
    if (l$leave_type != lOther$leave_type) {
      return false;
    }
    final l$end_date = end_date;
    final lOther$end_date = other.end_date;
    if (l$end_date != lOther$end_date) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$employee = employee;
    final lOther$employee = other.employee;
    if (l$employee != lOther$employee) {
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

extension UtilityExtension$Subscription$GetLeaves$leaves
    on Subscription$GetLeaves$leaves {
  CopyWith$Subscription$GetLeaves$leaves<Subscription$GetLeaves$leaves>
      get copyWith => CopyWith$Subscription$GetLeaves$leaves(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetLeaves$leaves<TRes> {
  factory CopyWith$Subscription$GetLeaves$leaves(
    Subscription$GetLeaves$leaves instance,
    TRes Function(Subscription$GetLeaves$leaves) then,
  ) = _CopyWithImpl$Subscription$GetLeaves$leaves;

  factory CopyWith$Subscription$GetLeaves$leaves.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetLeaves$leaves;

  TRes call({
    String? id,
    Enum$leave_status_enum? status,
    String? start_date,
    Enum$leave_type_enum? leave_type,
    String? end_date,
    String? comment,
    Subscription$GetLeaves$leaves$employee? employee,
    String? $__typename,
  });
  CopyWith$Subscription$GetLeaves$leaves$employee<TRes> get employee;
}

class _CopyWithImpl$Subscription$GetLeaves$leaves<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves<TRes> {
  _CopyWithImpl$Subscription$GetLeaves$leaves(
    this._instance,
    this._then,
  );

  final Subscription$GetLeaves$leaves _instance;

  final TRes Function(Subscription$GetLeaves$leaves) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? start_date = _undefined,
    Object? leave_type = _undefined,
    Object? end_date = _undefined,
    Object? comment = _undefined,
    Object? employee = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetLeaves$leaves(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$leave_status_enum?),
        start_date: start_date == _undefined || start_date == null
            ? _instance.start_date
            : (start_date as String),
        leave_type: leave_type == _undefined
            ? _instance.leave_type
            : (leave_type as Enum$leave_type_enum?),
        end_date: end_date == _undefined || end_date == null
            ? _instance.end_date
            : (end_date as String),
        comment:
            comment == _undefined ? _instance.comment : (comment as String?),
        employee: employee == _undefined
            ? _instance.employee
            : (employee as Subscription$GetLeaves$leaves$employee?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$GetLeaves$leaves$employee<TRes> get employee {
    final local$employee = _instance.employee;
    return local$employee == null
        ? CopyWith$Subscription$GetLeaves$leaves$employee.stub(_then(_instance))
        : CopyWith$Subscription$GetLeaves$leaves$employee(
            local$employee, (e) => call(employee: e));
  }
}

class _CopyWithStubImpl$Subscription$GetLeaves$leaves<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves<TRes> {
  _CopyWithStubImpl$Subscription$GetLeaves$leaves(this._res);

  TRes _res;

  call({
    String? id,
    Enum$leave_status_enum? status,
    String? start_date,
    Enum$leave_type_enum? leave_type,
    String? end_date,
    String? comment,
    Subscription$GetLeaves$leaves$employee? employee,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$GetLeaves$leaves$employee<TRes> get employee =>
      CopyWith$Subscription$GetLeaves$leaves$employee.stub(_res);
}

class Subscription$GetLeaves$leaves$employee {
  Subscription$GetLeaves$leaves$employee({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.function,
    this.file,
    this.$__typename = 'employees',
  });

  factory Subscription$GetLeaves$leaves$employee.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lastname = json['lastname'];
    final l$firstname = json['firstname'];
    final l$function = json['function'];
    final l$file = json['file'];
    final l$$__typename = json['__typename'];
    return Subscription$GetLeaves$leaves$employee(
      id: (l$id as String),
      lastname: (l$lastname as String),
      firstname: (l$firstname as String),
      function: (l$function as String),
      file: l$file == null
          ? null
          : Subscription$GetLeaves$leaves$employee$file.fromJson(
              (l$file as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String lastname;

  final String firstname;

  final String function;

  final Subscription$GetLeaves$leaves$employee$file? file;

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
    final l$file = file;
    _resultData['file'] = l$file?.toJson();
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
    final l$file = file;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$lastname,
      l$firstname,
      l$function,
      l$file,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetLeaves$leaves$employee ||
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
    final l$file = file;
    final lOther$file = other.file;
    if (l$file != lOther$file) {
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

extension UtilityExtension$Subscription$GetLeaves$leaves$employee
    on Subscription$GetLeaves$leaves$employee {
  CopyWith$Subscription$GetLeaves$leaves$employee<
          Subscription$GetLeaves$leaves$employee>
      get copyWith => CopyWith$Subscription$GetLeaves$leaves$employee(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetLeaves$leaves$employee<TRes> {
  factory CopyWith$Subscription$GetLeaves$leaves$employee(
    Subscription$GetLeaves$leaves$employee instance,
    TRes Function(Subscription$GetLeaves$leaves$employee) then,
  ) = _CopyWithImpl$Subscription$GetLeaves$leaves$employee;

  factory CopyWith$Subscription$GetLeaves$leaves$employee.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee;

  TRes call({
    String? id,
    String? lastname,
    String? firstname,
    String? function,
    Subscription$GetLeaves$leaves$employee$file? file,
    String? $__typename,
  });
  CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> get file;
}

class _CopyWithImpl$Subscription$GetLeaves$leaves$employee<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves$employee<TRes> {
  _CopyWithImpl$Subscription$GetLeaves$leaves$employee(
    this._instance,
    this._then,
  );

  final Subscription$GetLeaves$leaves$employee _instance;

  final TRes Function(Subscription$GetLeaves$leaves$employee) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? lastname = _undefined,
    Object? firstname = _undefined,
    Object? function = _undefined,
    Object? file = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetLeaves$leaves$employee(
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
        file: file == _undefined
            ? _instance.file
            : (file as Subscription$GetLeaves$leaves$employee$file?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> get file {
    final local$file = _instance.file;
    return local$file == null
        ? CopyWith$Subscription$GetLeaves$leaves$employee$file.stub(
            _then(_instance))
        : CopyWith$Subscription$GetLeaves$leaves$employee$file(
            local$file, (e) => call(file: e));
  }
}

class _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves$employee<TRes> {
  _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee(this._res);

  TRes _res;

  call({
    String? id,
    String? lastname,
    String? firstname,
    String? function,
    Subscription$GetLeaves$leaves$employee$file? file,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> get file =>
      CopyWith$Subscription$GetLeaves$leaves$employee$file.stub(_res);
}

class Subscription$GetLeaves$leaves$employee$file {
  Subscription$GetLeaves$leaves$employee$file({
    required this.id,
    this.file_url,
    this.$__typename = 'files',
  });

  factory Subscription$GetLeaves$leaves$employee$file.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$file_url = json['file_url'];
    final l$$__typename = json['__typename'];
    return Subscription$GetLeaves$leaves$employee$file(
      id: (l$id as String),
      file_url: (l$file_url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? file_url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$file_url = file_url;
    _resultData['file_url'] = l$file_url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$file_url = file_url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$file_url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetLeaves$leaves$employee$file ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Subscription$GetLeaves$leaves$employee$file
    on Subscription$GetLeaves$leaves$employee$file {
  CopyWith$Subscription$GetLeaves$leaves$employee$file<
          Subscription$GetLeaves$leaves$employee$file>
      get copyWith => CopyWith$Subscription$GetLeaves$leaves$employee$file(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> {
  factory CopyWith$Subscription$GetLeaves$leaves$employee$file(
    Subscription$GetLeaves$leaves$employee$file instance,
    TRes Function(Subscription$GetLeaves$leaves$employee$file) then,
  ) = _CopyWithImpl$Subscription$GetLeaves$leaves$employee$file;

  factory CopyWith$Subscription$GetLeaves$leaves$employee$file.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee$file;

  TRes call({
    String? id,
    String? file_url,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetLeaves$leaves$employee$file<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> {
  _CopyWithImpl$Subscription$GetLeaves$leaves$employee$file(
    this._instance,
    this._then,
  );

  final Subscription$GetLeaves$leaves$employee$file _instance;

  final TRes Function(Subscription$GetLeaves$leaves$employee$file) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? file_url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetLeaves$leaves$employee$file(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        file_url:
            file_url == _undefined ? _instance.file_url : (file_url as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee$file<TRes>
    implements CopyWith$Subscription$GetLeaves$leaves$employee$file<TRes> {
  _CopyWithStubImpl$Subscription$GetLeaves$leaves$employee$file(this._res);

  TRes _res;

  call({
    String? id,
    String? file_url,
    String? $__typename,
  }) =>
      _res;
}
