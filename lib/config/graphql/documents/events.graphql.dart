import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetUserEvents {
  factory Variables$Query$GetUserEvents({
    required String date,
    required String employeeId,
  }) =>
      Variables$Query$GetUserEvents._({
        r'date': date,
        r'employeeId': employeeId,
      });

  Variables$Query$GetUserEvents._(this._$data);

  factory Variables$Query$GetUserEvents.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$date = data['date'];
    result$data['date'] = (l$date as String);
    final l$employeeId = data['employeeId'];
    result$data['employeeId'] = (l$employeeId as String);
    return Variables$Query$GetUserEvents._(result$data);
  }

  Map<String, dynamic> _$data;

  String get date => (_$data['date'] as String);

  String get employeeId => (_$data['employeeId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$date = date;
    result$data['date'] = l$date;
    final l$employeeId = employeeId;
    result$data['employeeId'] = l$employeeId;
    return result$data;
  }

  CopyWith$Variables$Query$GetUserEvents<Variables$Query$GetUserEvents>
      get copyWith => CopyWith$Variables$Query$GetUserEvents(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserEvents ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    final l$employeeId = employeeId;
    final lOther$employeeId = other.employeeId;
    if (l$employeeId != lOther$employeeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$date = date;
    final l$employeeId = employeeId;
    return Object.hashAll([
      l$date,
      l$employeeId,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetUserEvents<TRes> {
  factory CopyWith$Variables$Query$GetUserEvents(
    Variables$Query$GetUserEvents instance,
    TRes Function(Variables$Query$GetUserEvents) then,
  ) = _CopyWithImpl$Variables$Query$GetUserEvents;

  factory CopyWith$Variables$Query$GetUserEvents.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserEvents;

  TRes call({
    String? date,
    String? employeeId,
  });
}

class _CopyWithImpl$Variables$Query$GetUserEvents<TRes>
    implements CopyWith$Variables$Query$GetUserEvents<TRes> {
  _CopyWithImpl$Variables$Query$GetUserEvents(
    this._instance,
    this._then,
  );

  final Variables$Query$GetUserEvents _instance;

  final TRes Function(Variables$Query$GetUserEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? date = _undefined,
    Object? employeeId = _undefined,
  }) =>
      _then(Variables$Query$GetUserEvents._({
        ..._instance._$data,
        if (date != _undefined && date != null) 'date': (date as String),
        if (employeeId != _undefined && employeeId != null)
          'employeeId': (employeeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetUserEvents<TRes>
    implements CopyWith$Variables$Query$GetUserEvents<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserEvents(this._res);

  TRes _res;

  call({
    String? date,
    String? employeeId,
  }) =>
      _res;
}

class Query$GetUserEvents {
  Query$GetUserEvents({
    required this.getEventsByUser,
    this.$__typename = 'query_root',
  });

  factory Query$GetUserEvents.fromJson(Map<String, dynamic> json) {
    final l$getEventsByUser = json['getEventsByUser'];
    final l$$__typename = json['__typename'];
    return Query$GetUserEvents(
      getEventsByUser: (l$getEventsByUser as List<dynamic>)
          .map((e) => Query$GetUserEvents$getEventsByUser.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUserEvents$getEventsByUser> getEventsByUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getEventsByUser = getEventsByUser;
    _resultData['getEventsByUser'] =
        l$getEventsByUser.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getEventsByUser = getEventsByUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getEventsByUser.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserEvents || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getEventsByUser = getEventsByUser;
    final lOther$getEventsByUser = other.getEventsByUser;
    if (l$getEventsByUser.length != lOther$getEventsByUser.length) {
      return false;
    }
    for (int i = 0; i < l$getEventsByUser.length; i++) {
      final l$getEventsByUser$entry = l$getEventsByUser[i];
      final lOther$getEventsByUser$entry = lOther$getEventsByUser[i];
      if (l$getEventsByUser$entry != lOther$getEventsByUser$entry) {
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

extension UtilityExtension$Query$GetUserEvents on Query$GetUserEvents {
  CopyWith$Query$GetUserEvents<Query$GetUserEvents> get copyWith =>
      CopyWith$Query$GetUserEvents(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserEvents<TRes> {
  factory CopyWith$Query$GetUserEvents(
    Query$GetUserEvents instance,
    TRes Function(Query$GetUserEvents) then,
  ) = _CopyWithImpl$Query$GetUserEvents;

  factory CopyWith$Query$GetUserEvents.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserEvents;

  TRes call({
    List<Query$GetUserEvents$getEventsByUser>? getEventsByUser,
    String? $__typename,
  });
  TRes getEventsByUser(
      Iterable<Query$GetUserEvents$getEventsByUser> Function(
              Iterable<
                  CopyWith$Query$GetUserEvents$getEventsByUser<
                      Query$GetUserEvents$getEventsByUser>>)
          _fn);
}

class _CopyWithImpl$Query$GetUserEvents<TRes>
    implements CopyWith$Query$GetUserEvents<TRes> {
  _CopyWithImpl$Query$GetUserEvents(
    this._instance,
    this._then,
  );

  final Query$GetUserEvents _instance;

  final TRes Function(Query$GetUserEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getEventsByUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserEvents(
        getEventsByUser: getEventsByUser == _undefined ||
                getEventsByUser == null
            ? _instance.getEventsByUser
            : (getEventsByUser as List<Query$GetUserEvents$getEventsByUser>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getEventsByUser(
          Iterable<Query$GetUserEvents$getEventsByUser> Function(
                  Iterable<
                      CopyWith$Query$GetUserEvents$getEventsByUser<
                          Query$GetUserEvents$getEventsByUser>>)
              _fn) =>
      call(
          getEventsByUser: _fn(_instance.getEventsByUser
              .map((e) => CopyWith$Query$GetUserEvents$getEventsByUser(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetUserEvents<TRes>
    implements CopyWith$Query$GetUserEvents<TRes> {
  _CopyWithStubImpl$Query$GetUserEvents(this._res);

  TRes _res;

  call({
    List<Query$GetUserEvents$getEventsByUser>? getEventsByUser,
    String? $__typename,
  }) =>
      _res;

  getEventsByUser(_fn) => _res;
}

const documentNodeQueryGetUserEvents = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUserEvents'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'date')),
        type: NamedTypeNode(
          name: NameNode(value: 'Date'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employeeId')),
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
        name: NameNode(value: 'getEventsByUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'inputs'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: VariableNode(name: NameNode(value: 'date')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'employeeId'),
                value: VariableNode(name: NameNode(value: 'employeeId')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'event'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'endTime'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'startTime'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'participant'),
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
  ),
]);
Query$GetUserEvents _parserFn$Query$GetUserEvents(Map<String, dynamic> data) =>
    Query$GetUserEvents.fromJson(data);
typedef OnQueryComplete$Query$GetUserEvents = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUserEvents?,
);

class Options$Query$GetUserEvents
    extends graphql.QueryOptions<Query$GetUserEvents> {
  Options$Query$GetUserEvents({
    String? operationName,
    required Variables$Query$GetUserEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserEvents? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserEvents? onComplete,
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
                    data == null ? null : _parserFn$Query$GetUserEvents(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUserEvents,
          parserFn: _parserFn$Query$GetUserEvents,
        );

  final OnQueryComplete$Query$GetUserEvents? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUserEvents
    extends graphql.WatchQueryOptions<Query$GetUserEvents> {
  WatchOptions$Query$GetUserEvents({
    String? operationName,
    required Variables$Query$GetUserEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserEvents? typedOptimisticResult,
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
          document: documentNodeQueryGetUserEvents,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUserEvents,
        );
}

class FetchMoreOptions$Query$GetUserEvents extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserEvents({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserEvents variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetUserEvents,
        );
}

extension ClientExtension$Query$GetUserEvents on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserEvents>> query$GetUserEvents(
          Options$Query$GetUserEvents options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetUserEvents> watchQuery$GetUserEvents(
          WatchOptions$Query$GetUserEvents options) =>
      this.watchQuery(options);
  void writeQuery$GetUserEvents({
    required Query$GetUserEvents data,
    required Variables$Query$GetUserEvents variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetUserEvents),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUserEvents? readQuery$GetUserEvents({
    required Variables$Query$GetUserEvents variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetUserEvents),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserEvents.fromJson(result);
  }
}

class Query$GetUserEvents$getEventsByUser {
  Query$GetUserEvents$getEventsByUser({
    required this.event,
    required this.participant,
    this.$__typename = 'EventWithUserParticipant',
  });

  factory Query$GetUserEvents$getEventsByUser.fromJson(
      Map<String, dynamic> json) {
    final l$event = json['event'];
    final l$participant = json['participant'];
    final l$$__typename = json['__typename'];
    return Query$GetUserEvents$getEventsByUser(
      event: Query$GetUserEvents$getEventsByUser$event.fromJson(
          (l$event as Map<String, dynamic>)),
      participant: (l$participant as List<dynamic>)
          .map((e) => Query$GetUserEvents$getEventsByUser$participant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserEvents$getEventsByUser$event event;

  final List<Query$GetUserEvents$getEventsByUser$participant> participant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$event = event;
    _resultData['event'] = l$event.toJson();
    final l$participant = participant;
    _resultData['participant'] = l$participant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$event = event;
    final l$participant = participant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$event,
      Object.hashAll(l$participant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserEvents$getEventsByUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$event = event;
    final lOther$event = other.event;
    if (l$event != lOther$event) {
      return false;
    }
    final l$participant = participant;
    final lOther$participant = other.participant;
    if (l$participant.length != lOther$participant.length) {
      return false;
    }
    for (int i = 0; i < l$participant.length; i++) {
      final l$participant$entry = l$participant[i];
      final lOther$participant$entry = lOther$participant[i];
      if (l$participant$entry != lOther$participant$entry) {
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

extension UtilityExtension$Query$GetUserEvents$getEventsByUser
    on Query$GetUserEvents$getEventsByUser {
  CopyWith$Query$GetUserEvents$getEventsByUser<
          Query$GetUserEvents$getEventsByUser>
      get copyWith => CopyWith$Query$GetUserEvents$getEventsByUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetUserEvents$getEventsByUser<TRes> {
  factory CopyWith$Query$GetUserEvents$getEventsByUser(
    Query$GetUserEvents$getEventsByUser instance,
    TRes Function(Query$GetUserEvents$getEventsByUser) then,
  ) = _CopyWithImpl$Query$GetUserEvents$getEventsByUser;

  factory CopyWith$Query$GetUserEvents$getEventsByUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser;

  TRes call({
    Query$GetUserEvents$getEventsByUser$event? event,
    List<Query$GetUserEvents$getEventsByUser$participant>? participant,
    String? $__typename,
  });
  CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> get event;
  TRes participant(
      Iterable<Query$GetUserEvents$getEventsByUser$participant> Function(
              Iterable<
                  CopyWith$Query$GetUserEvents$getEventsByUser$participant<
                      Query$GetUserEvents$getEventsByUser$participant>>)
          _fn);
}

class _CopyWithImpl$Query$GetUserEvents$getEventsByUser<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser<TRes> {
  _CopyWithImpl$Query$GetUserEvents$getEventsByUser(
    this._instance,
    this._then,
  );

  final Query$GetUserEvents$getEventsByUser _instance;

  final TRes Function(Query$GetUserEvents$getEventsByUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? event = _undefined,
    Object? participant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserEvents$getEventsByUser(
        event: event == _undefined || event == null
            ? _instance.event
            : (event as Query$GetUserEvents$getEventsByUser$event),
        participant: participant == _undefined || participant == null
            ? _instance.participant
            : (participant
                as List<Query$GetUserEvents$getEventsByUser$participant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> get event {
    final local$event = _instance.event;
    return CopyWith$Query$GetUserEvents$getEventsByUser$event(
        local$event, (e) => call(event: e));
  }

  TRes participant(
          Iterable<Query$GetUserEvents$getEventsByUser$participant> Function(
                  Iterable<
                      CopyWith$Query$GetUserEvents$getEventsByUser$participant<
                          Query$GetUserEvents$getEventsByUser$participant>>)
              _fn) =>
      call(
          participant: _fn(_instance.participant.map(
              (e) => CopyWith$Query$GetUserEvents$getEventsByUser$participant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser<TRes> {
  _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser(this._res);

  TRes _res;

  call({
    Query$GetUserEvents$getEventsByUser$event? event,
    List<Query$GetUserEvents$getEventsByUser$participant>? participant,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> get event =>
      CopyWith$Query$GetUserEvents$getEventsByUser$event.stub(_res);

  participant(_fn) => _res;
}

class Query$GetUserEvents$getEventsByUser$event {
  Query$GetUserEvents$getEventsByUser$event({
    required this.date,
    required this.description,
    required this.endTime,
    required this.startTime,
    required this.title,
    this.$__typename = 'EventType',
  });

  factory Query$GetUserEvents$getEventsByUser$event.fromJson(
      Map<String, dynamic> json) {
    final l$date = json['date'];
    final l$description = json['description'];
    final l$endTime = json['endTime'];
    final l$startTime = json['startTime'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$GetUserEvents$getEventsByUser$event(
      date: (l$date as String),
      description: (l$description as String),
      endTime: (l$endTime as String),
      startTime: (l$startTime as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String date;

  final String description;

  final String endTime;

  final String startTime;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$date = date;
    _resultData['date'] = l$date;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime;
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$date = date;
    final l$description = description;
    final l$endTime = endTime;
    final l$startTime = startTime;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$date,
      l$description,
      l$endTime,
      l$startTime,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserEvents$getEventsByUser$event ||
        runtimeType != other.runtimeType) {
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
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$GetUserEvents$getEventsByUser$event
    on Query$GetUserEvents$getEventsByUser$event {
  CopyWith$Query$GetUserEvents$getEventsByUser$event<
          Query$GetUserEvents$getEventsByUser$event>
      get copyWith => CopyWith$Query$GetUserEvents$getEventsByUser$event(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> {
  factory CopyWith$Query$GetUserEvents$getEventsByUser$event(
    Query$GetUserEvents$getEventsByUser$event instance,
    TRes Function(Query$GetUserEvents$getEventsByUser$event) then,
  ) = _CopyWithImpl$Query$GetUserEvents$getEventsByUser$event;

  factory CopyWith$Query$GetUserEvents$getEventsByUser$event.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$event;

  TRes call({
    String? date,
    String? description,
    String? endTime,
    String? startTime,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserEvents$getEventsByUser$event<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> {
  _CopyWithImpl$Query$GetUserEvents$getEventsByUser$event(
    this._instance,
    this._then,
  );

  final Query$GetUserEvents$getEventsByUser$event _instance;

  final TRes Function(Query$GetUserEvents$getEventsByUser$event) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? date = _undefined,
    Object? description = _undefined,
    Object? endTime = _undefined,
    Object? startTime = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserEvents$getEventsByUser$event(
        date: date == _undefined || date == null
            ? _instance.date
            : (date as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        endTime: endTime == _undefined || endTime == null
            ? _instance.endTime
            : (endTime as String),
        startTime: startTime == _undefined || startTime == null
            ? _instance.startTime
            : (startTime as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$event<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser$event<TRes> {
  _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$event(this._res);

  TRes _res;

  call({
    String? date,
    String? description,
    String? endTime,
    String? startTime,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetUserEvents$getEventsByUser$participant {
  Query$GetUserEvents$getEventsByUser$participant({
    required this.firstname,
    required this.lastname,
    this.$__typename = 'ParticipantType',
  });

  factory Query$GetUserEvents$getEventsByUser$participant.fromJson(
      Map<String, dynamic> json) {
    final l$firstname = json['firstname'];
    final l$lastname = json['lastname'];
    final l$$__typename = json['__typename'];
    return Query$GetUserEvents$getEventsByUser$participant(
      firstname: (l$firstname as String),
      lastname: (l$lastname as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstname;

  final String lastname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$firstname = firstname;
    final l$lastname = lastname;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (other is! Query$GetUserEvents$getEventsByUser$participant ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserEvents$getEventsByUser$participant
    on Query$GetUserEvents$getEventsByUser$participant {
  CopyWith$Query$GetUserEvents$getEventsByUser$participant<
          Query$GetUserEvents$getEventsByUser$participant>
      get copyWith => CopyWith$Query$GetUserEvents$getEventsByUser$participant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetUserEvents$getEventsByUser$participant<TRes> {
  factory CopyWith$Query$GetUserEvents$getEventsByUser$participant(
    Query$GetUserEvents$getEventsByUser$participant instance,
    TRes Function(Query$GetUserEvents$getEventsByUser$participant) then,
  ) = _CopyWithImpl$Query$GetUserEvents$getEventsByUser$participant;

  factory CopyWith$Query$GetUserEvents$getEventsByUser$participant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$participant;

  TRes call({
    String? firstname,
    String? lastname,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserEvents$getEventsByUser$participant<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser$participant<TRes> {
  _CopyWithImpl$Query$GetUserEvents$getEventsByUser$participant(
    this._instance,
    this._then,
  );

  final Query$GetUserEvents$getEventsByUser$participant _instance;

  final TRes Function(Query$GetUserEvents$getEventsByUser$participant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstname = _undefined,
    Object? lastname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserEvents$getEventsByUser$participant(
        firstname: firstname == _undefined || firstname == null
            ? _instance.firstname
            : (firstname as String),
        lastname: lastname == _undefined || lastname == null
            ? _instance.lastname
            : (lastname as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$participant<TRes>
    implements CopyWith$Query$GetUserEvents$getEventsByUser$participant<TRes> {
  _CopyWithStubImpl$Query$GetUserEvents$getEventsByUser$participant(this._res);

  TRes _res;

  call({
    String? firstname,
    String? lastname,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeclineEvents {
  factory Variables$Mutation$DeclineEvents({required String id}) =>
      Variables$Mutation$DeclineEvents._({
        r'id': id,
      });

  Variables$Mutation$DeclineEvents._(this._$data);

  factory Variables$Mutation$DeclineEvents.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeclineEvents._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeclineEvents<Variables$Mutation$DeclineEvents>
      get copyWith => CopyWith$Variables$Mutation$DeclineEvents(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeclineEvents ||
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

abstract class CopyWith$Variables$Mutation$DeclineEvents<TRes> {
  factory CopyWith$Variables$Mutation$DeclineEvents(
    Variables$Mutation$DeclineEvents instance,
    TRes Function(Variables$Mutation$DeclineEvents) then,
  ) = _CopyWithImpl$Variables$Mutation$DeclineEvents;

  factory CopyWith$Variables$Mutation$DeclineEvents.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeclineEvents;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeclineEvents<TRes>
    implements CopyWith$Variables$Mutation$DeclineEvents<TRes> {
  _CopyWithImpl$Variables$Mutation$DeclineEvents(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeclineEvents _instance;

  final TRes Function(Variables$Mutation$DeclineEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$DeclineEvents._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeclineEvents<TRes>
    implements CopyWith$Variables$Mutation$DeclineEvents<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeclineEvents(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeclineEvents {
  Mutation$DeclineEvents({
    required this.declineParticipateEvents,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$DeclineEvents.fromJson(Map<String, dynamic> json) {
    final l$declineParticipateEvents = json['declineParticipateEvents'];
    final l$$__typename = json['__typename'];
    return Mutation$DeclineEvents(
      declineParticipateEvents:
          Mutation$DeclineEvents$declineParticipateEvents.fromJson(
              (l$declineParticipateEvents as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeclineEvents$declineParticipateEvents
      declineParticipateEvents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$declineParticipateEvents = declineParticipateEvents;
    _resultData['declineParticipateEvents'] =
        l$declineParticipateEvents.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$declineParticipateEvents = declineParticipateEvents;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$declineParticipateEvents,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeclineEvents || runtimeType != other.runtimeType) {
      return false;
    }
    final l$declineParticipateEvents = declineParticipateEvents;
    final lOther$declineParticipateEvents = other.declineParticipateEvents;
    if (l$declineParticipateEvents != lOther$declineParticipateEvents) {
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

extension UtilityExtension$Mutation$DeclineEvents on Mutation$DeclineEvents {
  CopyWith$Mutation$DeclineEvents<Mutation$DeclineEvents> get copyWith =>
      CopyWith$Mutation$DeclineEvents(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeclineEvents<TRes> {
  factory CopyWith$Mutation$DeclineEvents(
    Mutation$DeclineEvents instance,
    TRes Function(Mutation$DeclineEvents) then,
  ) = _CopyWithImpl$Mutation$DeclineEvents;

  factory CopyWith$Mutation$DeclineEvents.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeclineEvents;

  TRes call({
    Mutation$DeclineEvents$declineParticipateEvents? declineParticipateEvents,
    String? $__typename,
  });
  CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes>
      get declineParticipateEvents;
}

class _CopyWithImpl$Mutation$DeclineEvents<TRes>
    implements CopyWith$Mutation$DeclineEvents<TRes> {
  _CopyWithImpl$Mutation$DeclineEvents(
    this._instance,
    this._then,
  );

  final Mutation$DeclineEvents _instance;

  final TRes Function(Mutation$DeclineEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? declineParticipateEvents = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeclineEvents(
        declineParticipateEvents: declineParticipateEvents == _undefined ||
                declineParticipateEvents == null
            ? _instance.declineParticipateEvents
            : (declineParticipateEvents
                as Mutation$DeclineEvents$declineParticipateEvents),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes>
      get declineParticipateEvents {
    final local$declineParticipateEvents = _instance.declineParticipateEvents;
    return CopyWith$Mutation$DeclineEvents$declineParticipateEvents(
        local$declineParticipateEvents,
        (e) => call(declineParticipateEvents: e));
  }
}

class _CopyWithStubImpl$Mutation$DeclineEvents<TRes>
    implements CopyWith$Mutation$DeclineEvents<TRes> {
  _CopyWithStubImpl$Mutation$DeclineEvents(this._res);

  TRes _res;

  call({
    Mutation$DeclineEvents$declineParticipateEvents? declineParticipateEvents,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes>
      get declineParticipateEvents =>
          CopyWith$Mutation$DeclineEvents$declineParticipateEvents.stub(_res);
}

const documentNodeMutationDeclineEvents = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeclineEvents'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'declineParticipateEvents'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'participant'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
Mutation$DeclineEvents _parserFn$Mutation$DeclineEvents(
        Map<String, dynamic> data) =>
    Mutation$DeclineEvents.fromJson(data);
typedef OnMutationCompleted$Mutation$DeclineEvents = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeclineEvents?,
);

class Options$Mutation$DeclineEvents
    extends graphql.MutationOptions<Mutation$DeclineEvents> {
  Options$Mutation$DeclineEvents({
    String? operationName,
    required Variables$Mutation$DeclineEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeclineEvents? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeclineEvents? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeclineEvents>? update,
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
                        : _parserFn$Mutation$DeclineEvents(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeclineEvents,
          parserFn: _parserFn$Mutation$DeclineEvents,
        );

  final OnMutationCompleted$Mutation$DeclineEvents? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeclineEvents
    extends graphql.WatchQueryOptions<Mutation$DeclineEvents> {
  WatchOptions$Mutation$DeclineEvents({
    String? operationName,
    required Variables$Mutation$DeclineEvents variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeclineEvents? typedOptimisticResult,
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
          document: documentNodeMutationDeclineEvents,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeclineEvents,
        );
}

extension ClientExtension$Mutation$DeclineEvents on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeclineEvents>> mutate$DeclineEvents(
          Options$Mutation$DeclineEvents options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeclineEvents> watchMutation$DeclineEvents(
          WatchOptions$Mutation$DeclineEvents options) =>
      this.watchMutation(options);
}

class Mutation$DeclineEvents$declineParticipateEvents {
  Mutation$DeclineEvents$declineParticipateEvents({
    required this.id,
    this.$__typename = 'DenyParcipateEvent',
  });

  factory Mutation$DeclineEvents$declineParticipateEvents.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeclineEvents$declineParticipateEvents(
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
    if (other is! Mutation$DeclineEvents$declineParticipateEvents ||
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

extension UtilityExtension$Mutation$DeclineEvents$declineParticipateEvents
    on Mutation$DeclineEvents$declineParticipateEvents {
  CopyWith$Mutation$DeclineEvents$declineParticipateEvents<
          Mutation$DeclineEvents$declineParticipateEvents>
      get copyWith => CopyWith$Mutation$DeclineEvents$declineParticipateEvents(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes> {
  factory CopyWith$Mutation$DeclineEvents$declineParticipateEvents(
    Mutation$DeclineEvents$declineParticipateEvents instance,
    TRes Function(Mutation$DeclineEvents$declineParticipateEvents) then,
  ) = _CopyWithImpl$Mutation$DeclineEvents$declineParticipateEvents;

  factory CopyWith$Mutation$DeclineEvents$declineParticipateEvents.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeclineEvents$declineParticipateEvents;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeclineEvents$declineParticipateEvents<TRes>
    implements CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes> {
  _CopyWithImpl$Mutation$DeclineEvents$declineParticipateEvents(
    this._instance,
    this._then,
  );

  final Mutation$DeclineEvents$declineParticipateEvents _instance;

  final TRes Function(Mutation$DeclineEvents$declineParticipateEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeclineEvents$declineParticipateEvents(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeclineEvents$declineParticipateEvents<TRes>
    implements CopyWith$Mutation$DeclineEvents$declineParticipateEvents<TRes> {
  _CopyWithStubImpl$Mutation$DeclineEvents$declineParticipateEvents(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AcceptEvent {
  factory Variables$Mutation$AcceptEvent({required String id}) =>
      Variables$Mutation$AcceptEvent._({
        r'id': id,
      });

  Variables$Mutation$AcceptEvent._(this._$data);

  factory Variables$Mutation$AcceptEvent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$AcceptEvent._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$AcceptEvent<Variables$Mutation$AcceptEvent>
      get copyWith => CopyWith$Variables$Mutation$AcceptEvent(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AcceptEvent ||
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

abstract class CopyWith$Variables$Mutation$AcceptEvent<TRes> {
  factory CopyWith$Variables$Mutation$AcceptEvent(
    Variables$Mutation$AcceptEvent instance,
    TRes Function(Variables$Mutation$AcceptEvent) then,
  ) = _CopyWithImpl$Variables$Mutation$AcceptEvent;

  factory CopyWith$Variables$Mutation$AcceptEvent.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AcceptEvent;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$AcceptEvent<TRes>
    implements CopyWith$Variables$Mutation$AcceptEvent<TRes> {
  _CopyWithImpl$Variables$Mutation$AcceptEvent(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AcceptEvent _instance;

  final TRes Function(Variables$Mutation$AcceptEvent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$AcceptEvent._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AcceptEvent<TRes>
    implements CopyWith$Variables$Mutation$AcceptEvent<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AcceptEvent(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$AcceptEvent {
  Mutation$AcceptEvent({
    required this.acceptParticipateEvents,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$AcceptEvent.fromJson(Map<String, dynamic> json) {
    final l$acceptParticipateEvents = json['acceptParticipateEvents'];
    final l$$__typename = json['__typename'];
    return Mutation$AcceptEvent(
      acceptParticipateEvents:
          Mutation$AcceptEvent$acceptParticipateEvents.fromJson(
              (l$acceptParticipateEvents as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AcceptEvent$acceptParticipateEvents acceptParticipateEvents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$acceptParticipateEvents = acceptParticipateEvents;
    _resultData['acceptParticipateEvents'] = l$acceptParticipateEvents.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$acceptParticipateEvents = acceptParticipateEvents;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$acceptParticipateEvents,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AcceptEvent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$acceptParticipateEvents = acceptParticipateEvents;
    final lOther$acceptParticipateEvents = other.acceptParticipateEvents;
    if (l$acceptParticipateEvents != lOther$acceptParticipateEvents) {
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

extension UtilityExtension$Mutation$AcceptEvent on Mutation$AcceptEvent {
  CopyWith$Mutation$AcceptEvent<Mutation$AcceptEvent> get copyWith =>
      CopyWith$Mutation$AcceptEvent(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AcceptEvent<TRes> {
  factory CopyWith$Mutation$AcceptEvent(
    Mutation$AcceptEvent instance,
    TRes Function(Mutation$AcceptEvent) then,
  ) = _CopyWithImpl$Mutation$AcceptEvent;

  factory CopyWith$Mutation$AcceptEvent.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AcceptEvent;

  TRes call({
    Mutation$AcceptEvent$acceptParticipateEvents? acceptParticipateEvents,
    String? $__typename,
  });
  CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes>
      get acceptParticipateEvents;
}

class _CopyWithImpl$Mutation$AcceptEvent<TRes>
    implements CopyWith$Mutation$AcceptEvent<TRes> {
  _CopyWithImpl$Mutation$AcceptEvent(
    this._instance,
    this._then,
  );

  final Mutation$AcceptEvent _instance;

  final TRes Function(Mutation$AcceptEvent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? acceptParticipateEvents = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AcceptEvent(
        acceptParticipateEvents: acceptParticipateEvents == _undefined ||
                acceptParticipateEvents == null
            ? _instance.acceptParticipateEvents
            : (acceptParticipateEvents
                as Mutation$AcceptEvent$acceptParticipateEvents),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes>
      get acceptParticipateEvents {
    final local$acceptParticipateEvents = _instance.acceptParticipateEvents;
    return CopyWith$Mutation$AcceptEvent$acceptParticipateEvents(
        local$acceptParticipateEvents, (e) => call(acceptParticipateEvents: e));
  }
}

class _CopyWithStubImpl$Mutation$AcceptEvent<TRes>
    implements CopyWith$Mutation$AcceptEvent<TRes> {
  _CopyWithStubImpl$Mutation$AcceptEvent(this._res);

  TRes _res;

  call({
    Mutation$AcceptEvent$acceptParticipateEvents? acceptParticipateEvents,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes>
      get acceptParticipateEvents =>
          CopyWith$Mutation$AcceptEvent$acceptParticipateEvents.stub(_res);
}

const documentNodeMutationAcceptEvent = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AcceptEvent'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'acceptParticipateEvents'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'participant'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
Mutation$AcceptEvent _parserFn$Mutation$AcceptEvent(
        Map<String, dynamic> data) =>
    Mutation$AcceptEvent.fromJson(data);
typedef OnMutationCompleted$Mutation$AcceptEvent = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AcceptEvent?,
);

class Options$Mutation$AcceptEvent
    extends graphql.MutationOptions<Mutation$AcceptEvent> {
  Options$Mutation$AcceptEvent({
    String? operationName,
    required Variables$Mutation$AcceptEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptEvent? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AcceptEvent? onCompleted,
    graphql.OnMutationUpdate<Mutation$AcceptEvent>? update,
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
                    data == null ? null : _parserFn$Mutation$AcceptEvent(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAcceptEvent,
          parserFn: _parserFn$Mutation$AcceptEvent,
        );

  final OnMutationCompleted$Mutation$AcceptEvent? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AcceptEvent
    extends graphql.WatchQueryOptions<Mutation$AcceptEvent> {
  WatchOptions$Mutation$AcceptEvent({
    String? operationName,
    required Variables$Mutation$AcceptEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AcceptEvent? typedOptimisticResult,
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
          document: documentNodeMutationAcceptEvent,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AcceptEvent,
        );
}

extension ClientExtension$Mutation$AcceptEvent on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AcceptEvent>> mutate$AcceptEvent(
          Options$Mutation$AcceptEvent options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AcceptEvent> watchMutation$AcceptEvent(
          WatchOptions$Mutation$AcceptEvent options) =>
      this.watchMutation(options);
}

class Mutation$AcceptEvent$acceptParticipateEvents {
  Mutation$AcceptEvent$acceptParticipateEvents({
    required this.id,
    this.$__typename = 'AcceptParcipateEvent',
  });

  factory Mutation$AcceptEvent$acceptParticipateEvents.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$AcceptEvent$acceptParticipateEvents(
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
    if (other is! Mutation$AcceptEvent$acceptParticipateEvents ||
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

extension UtilityExtension$Mutation$AcceptEvent$acceptParticipateEvents
    on Mutation$AcceptEvent$acceptParticipateEvents {
  CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<
          Mutation$AcceptEvent$acceptParticipateEvents>
      get copyWith => CopyWith$Mutation$AcceptEvent$acceptParticipateEvents(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes> {
  factory CopyWith$Mutation$AcceptEvent$acceptParticipateEvents(
    Mutation$AcceptEvent$acceptParticipateEvents instance,
    TRes Function(Mutation$AcceptEvent$acceptParticipateEvents) then,
  ) = _CopyWithImpl$Mutation$AcceptEvent$acceptParticipateEvents;

  factory CopyWith$Mutation$AcceptEvent$acceptParticipateEvents.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AcceptEvent$acceptParticipateEvents;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AcceptEvent$acceptParticipateEvents<TRes>
    implements CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes> {
  _CopyWithImpl$Mutation$AcceptEvent$acceptParticipateEvents(
    this._instance,
    this._then,
  );

  final Mutation$AcceptEvent$acceptParticipateEvents _instance;

  final TRes Function(Mutation$AcceptEvent$acceptParticipateEvents) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AcceptEvent$acceptParticipateEvents(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AcceptEvent$acceptParticipateEvents<TRes>
    implements CopyWith$Mutation$AcceptEvent$acceptParticipateEvents<TRes> {
  _CopyWithStubImpl$Mutation$AcceptEvent$acceptParticipateEvents(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
