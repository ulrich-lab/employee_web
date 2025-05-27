import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$ListenAllNotifications {
  factory Variables$Subscription$ListenAllNotifications(
          {required String employee_id}) =>
      Variables$Subscription$ListenAllNotifications._({
        r'employee_id': employee_id,
      });

  Variables$Subscription$ListenAllNotifications._(this._$data);

  factory Variables$Subscription$ListenAllNotifications.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    return Variables$Subscription$ListenAllNotifications._(result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$ListenAllNotifications<
          Variables$Subscription$ListenAllNotifications>
      get copyWith => CopyWith$Variables$Subscription$ListenAllNotifications(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$ListenAllNotifications ||
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

abstract class CopyWith$Variables$Subscription$ListenAllNotifications<TRes> {
  factory CopyWith$Variables$Subscription$ListenAllNotifications(
    Variables$Subscription$ListenAllNotifications instance,
    TRes Function(Variables$Subscription$ListenAllNotifications) then,
  ) = _CopyWithImpl$Variables$Subscription$ListenAllNotifications;

  factory CopyWith$Variables$Subscription$ListenAllNotifications.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ListenAllNotifications;

  TRes call({String? employee_id});
}

class _CopyWithImpl$Variables$Subscription$ListenAllNotifications<TRes>
    implements CopyWith$Variables$Subscription$ListenAllNotifications<TRes> {
  _CopyWithImpl$Variables$Subscription$ListenAllNotifications(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ListenAllNotifications _instance;

  final TRes Function(Variables$Subscription$ListenAllNotifications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? employee_id = _undefined}) =>
      _then(Variables$Subscription$ListenAllNotifications._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$ListenAllNotifications<TRes>
    implements CopyWith$Variables$Subscription$ListenAllNotifications<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ListenAllNotifications(this._res);

  TRes _res;

  call({String? employee_id}) => _res;
}

class Subscription$ListenAllNotifications {
  Subscription$ListenAllNotifications(
      {required this.employee_notifications_stream});

  factory Subscription$ListenAllNotifications.fromJson(
      Map<String, dynamic> json) {
    final l$employee_notifications_stream =
        json['employee_notifications_stream'];
    return Subscription$ListenAllNotifications(
        employee_notifications_stream: (l$employee_notifications_stream
                as List<dynamic>)
            .map((e) =>
                Subscription$ListenAllNotifications$employee_notifications_stream
                    .fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$ListenAllNotifications$employee_notifications_stream>
      employee_notifications_stream;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$employee_notifications_stream = employee_notifications_stream;
    _resultData['employee_notifications_stream'] =
        l$employee_notifications_stream.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$employee_notifications_stream = employee_notifications_stream;
    return Object.hashAll(
        [Object.hashAll(l$employee_notifications_stream.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$ListenAllNotifications ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employee_notifications_stream = employee_notifications_stream;
    final lOther$employee_notifications_stream =
        other.employee_notifications_stream;
    if (l$employee_notifications_stream.length !=
        lOther$employee_notifications_stream.length) {
      return false;
    }
    for (int i = 0; i < l$employee_notifications_stream.length; i++) {
      final l$employee_notifications_stream$entry =
          l$employee_notifications_stream[i];
      final lOther$employee_notifications_stream$entry =
          lOther$employee_notifications_stream[i];
      if (l$employee_notifications_stream$entry !=
          lOther$employee_notifications_stream$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$ListenAllNotifications
    on Subscription$ListenAllNotifications {
  CopyWith$Subscription$ListenAllNotifications<
          Subscription$ListenAllNotifications>
      get copyWith => CopyWith$Subscription$ListenAllNotifications(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllNotifications<TRes> {
  factory CopyWith$Subscription$ListenAllNotifications(
    Subscription$ListenAllNotifications instance,
    TRes Function(Subscription$ListenAllNotifications) then,
  ) = _CopyWithImpl$Subscription$ListenAllNotifications;

  factory CopyWith$Subscription$ListenAllNotifications.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllNotifications;

  TRes call(
      {List<Subscription$ListenAllNotifications$employee_notifications_stream>?
          employee_notifications_stream});
  TRes employee_notifications_stream(
      Iterable<Subscription$ListenAllNotifications$employee_notifications_stream> Function(
              Iterable<
                  CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
                      Subscription$ListenAllNotifications$employee_notifications_stream>>)
          _fn);
}

class _CopyWithImpl$Subscription$ListenAllNotifications<TRes>
    implements CopyWith$Subscription$ListenAllNotifications<TRes> {
  _CopyWithImpl$Subscription$ListenAllNotifications(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllNotifications _instance;

  final TRes Function(Subscription$ListenAllNotifications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? employee_notifications_stream = _undefined}) =>
      _then(Subscription$ListenAllNotifications(
          employee_notifications_stream: employee_notifications_stream ==
                      _undefined ||
                  employee_notifications_stream == null
              ? _instance.employee_notifications_stream
              : (employee_notifications_stream as List<
                  Subscription$ListenAllNotifications$employee_notifications_stream>)));

  TRes employee_notifications_stream(
          Iterable<Subscription$ListenAllNotifications$employee_notifications_stream> Function(
                  Iterable<
                      CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
                          Subscription$ListenAllNotifications$employee_notifications_stream>>)
              _fn) =>
      call(
          employee_notifications_stream: _fn(
              _instance.employee_notifications_stream.map((e) =>
                  CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$ListenAllNotifications<TRes>
    implements CopyWith$Subscription$ListenAllNotifications<TRes> {
  _CopyWithStubImpl$Subscription$ListenAllNotifications(this._res);

  TRes _res;

  call(
          {List<Subscription$ListenAllNotifications$employee_notifications_stream>?
              employee_notifications_stream}) =>
      _res;

  employee_notifications_stream(_fn) => _res;
}

const documentNodeSubscriptionListenAllNotifications =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenAllNotifications'),
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
        name: NameNode(value: 'employee_notifications_stream'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'batch_size'),
            value: IntValueNode(value: '1'),
          ),
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
                name: NameNode(value: 'messageByMessageId'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'message_statuses'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_or'),
                        value: ListValueNode(values: [
                          ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'status'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: StringValueNode(
                                    value: 'SENT',
                                    isBlock: false,
                                  ),
                                )
                              ]),
                            )
                          ]),
                          ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'status'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: StringValueNode(
                                    value: 'DELIVERED',
                                    isBlock: false,
                                  ),
                                )
                              ]),
                            )
                          ]),
                        ]),
                      )
                    ]),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'cursor'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'initial_value'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'created_at'),
                    value: StringValueNode(
                      value: '2022-01-01',
                      isBlock: false,
                    ),
                  )
                ]),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_read'),
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
            name: NameNode(value: 'event_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'employee_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'action'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'created_at'),
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
Subscription$ListenAllNotifications
    _parserFn$Subscription$ListenAllNotifications(Map<String, dynamic> data) =>
        Subscription$ListenAllNotifications.fromJson(data);

class Options$Subscription$ListenAllNotifications
    extends graphql.SubscriptionOptions<Subscription$ListenAllNotifications> {
  Options$Subscription$ListenAllNotifications({
    String? operationName,
    required Variables$Subscription$ListenAllNotifications variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenAllNotifications? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionListenAllNotifications,
          parserFn: _parserFn$Subscription$ListenAllNotifications,
        );
}

class WatchOptions$Subscription$ListenAllNotifications
    extends graphql.WatchQueryOptions<Subscription$ListenAllNotifications> {
  WatchOptions$Subscription$ListenAllNotifications({
    String? operationName,
    required Variables$Subscription$ListenAllNotifications variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenAllNotifications? typedOptimisticResult,
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
          document: documentNodeSubscriptionListenAllNotifications,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenAllNotifications,
        );
}

class FetchMoreOptions$Subscription$ListenAllNotifications
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenAllNotifications({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$ListenAllNotifications variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionListenAllNotifications,
        );
}

extension ClientExtension$Subscription$ListenAllNotifications
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenAllNotifications>>
      subscribe$ListenAllNotifications(
              Options$Subscription$ListenAllNotifications options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$ListenAllNotifications>
      watchSubscription$ListenAllNotifications(
              WatchOptions$Subscription$ListenAllNotifications options) =>
          this.watchQuery(options);
}

class Subscription$ListenAllNotifications$employee_notifications_stream {
  Subscription$ListenAllNotifications$employee_notifications_stream({
    this.updated_at,
    this.type,
    required this.title,
    this.message_id,
    required this.message,
    this.is_read,
    required this.id,
    this.event_id,
    this.employee_id,
    required this.action,
    this.created_at,
    this.$__typename = 'employee_notifications',
  });

  factory Subscription$ListenAllNotifications$employee_notifications_stream.fromJson(
      Map<String, dynamic> json) {
    final l$updated_at = json['updated_at'];
    final l$type = json['type'];
    final l$title = json['title'];
    final l$message_id = json['message_id'];
    final l$message = json['message'];
    final l$is_read = json['is_read'];
    final l$id = json['id'];
    final l$event_id = json['event_id'];
    final l$employee_id = json['employee_id'];
    final l$action = json['action'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenAllNotifications$employee_notifications_stream(
      updated_at: (l$updated_at as String?),
      type: (l$type as String?),
      title: (l$title as String),
      message_id: (l$message_id as String?),
      message: (l$message as String),
      is_read: (l$is_read as bool?),
      id: (l$id as String),
      event_id: (l$event_id as String?),
      employee_id: (l$employee_id as String?),
      action: (l$action as String),
      created_at: (l$created_at as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? updated_at;

  final String? type;

  final String title;

  final String? message_id;

  final String message;

  final bool? is_read;

  final String id;

  final String? event_id;

  final String? employee_id;

  final String action;

  final String? created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$message_id = message_id;
    _resultData['message_id'] = l$message_id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$is_read = is_read;
    _resultData['is_read'] = l$is_read;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$event_id = event_id;
    _resultData['event_id'] = l$event_id;
    final l$employee_id = employee_id;
    _resultData['employee_id'] = l$employee_id;
    final l$action = action;
    _resultData['action'] = l$action;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updated_at = updated_at;
    final l$type = type;
    final l$title = title;
    final l$message_id = message_id;
    final l$message = message;
    final l$is_read = is_read;
    final l$id = id;
    final l$event_id = event_id;
    final l$employee_id = employee_id;
    final l$action = action;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updated_at,
      l$type,
      l$title,
      l$message_id,
      l$message,
      l$is_read,
      l$id,
      l$event_id,
      l$employee_id,
      l$action,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$ListenAllNotifications$employee_notifications_stream ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$message_id = message_id;
    final lOther$message_id = other.message_id;
    if (l$message_id != lOther$message_id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$is_read = is_read;
    final lOther$is_read = other.is_read;
    if (l$is_read != lOther$is_read) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$event_id = event_id;
    final lOther$event_id = other.event_id;
    if (l$event_id != lOther$event_id) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
      return false;
    }
    final l$action = action;
    final lOther$action = other.action;
    if (l$action != lOther$action) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Subscription$ListenAllNotifications$employee_notifications_stream
    on Subscription$ListenAllNotifications$employee_notifications_stream {
  CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
          Subscription$ListenAllNotifications$employee_notifications_stream>
      get copyWith =>
          CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
    TRes> {
  factory CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream(
    Subscription$ListenAllNotifications$employee_notifications_stream instance,
    TRes Function(
            Subscription$ListenAllNotifications$employee_notifications_stream)
        then,
  ) = _CopyWithImpl$Subscription$ListenAllNotifications$employee_notifications_stream;

  factory CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenAllNotifications$employee_notifications_stream;

  TRes call({
    String? updated_at,
    String? type,
    String? title,
    String? message_id,
    String? message,
    bool? is_read,
    String? id,
    String? event_id,
    String? employee_id,
    String? action,
    String? created_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$ListenAllNotifications$employee_notifications_stream<
        TRes>
    implements
        CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
            TRes> {
  _CopyWithImpl$Subscription$ListenAllNotifications$employee_notifications_stream(
    this._instance,
    this._then,
  );

  final Subscription$ListenAllNotifications$employee_notifications_stream
      _instance;

  final TRes Function(
      Subscription$ListenAllNotifications$employee_notifications_stream) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updated_at = _undefined,
    Object? type = _undefined,
    Object? title = _undefined,
    Object? message_id = _undefined,
    Object? message = _undefined,
    Object? is_read = _undefined,
    Object? id = _undefined,
    Object? event_id = _undefined,
    Object? employee_id = _undefined,
    Object? action = _undefined,
    Object? created_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenAllNotifications$employee_notifications_stream(
        updated_at: updated_at == _undefined
            ? _instance.updated_at
            : (updated_at as String?),
        type: type == _undefined ? _instance.type : (type as String?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        message_id: message_id == _undefined
            ? _instance.message_id
            : (message_id as String?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        is_read: is_read == _undefined ? _instance.is_read : (is_read as bool?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        event_id:
            event_id == _undefined ? _instance.event_id : (event_id as String?),
        employee_id: employee_id == _undefined
            ? _instance.employee_id
            : (employee_id as String?),
        action: action == _undefined || action == null
            ? _instance.action
            : (action as String),
        created_at: created_at == _undefined
            ? _instance.created_at
            : (created_at as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$ListenAllNotifications$employee_notifications_stream<
        TRes>
    implements
        CopyWith$Subscription$ListenAllNotifications$employee_notifications_stream<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenAllNotifications$employee_notifications_stream(
      this._res);

  TRes _res;

  call({
    String? updated_at,
    String? type,
    String? title,
    String? message_id,
    String? message,
    bool? is_read,
    String? id,
    String? event_id,
    String? employee_id,
    String? action,
    String? created_at,
    String? $__typename,
  }) =>
      _res;
}
