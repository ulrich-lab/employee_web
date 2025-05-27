import '../schema.graphqls.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetAllContactsList {
  factory Variables$Query$GetAllContactsList({String? company_id}) =>
      Variables$Query$GetAllContactsList._({
        if (company_id != null) r'company_id': company_id,
      });

  Variables$Query$GetAllContactsList._(this._$data);

  factory Variables$Query$GetAllContactsList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('company_id')) {
      final l$company_id = data['company_id'];
      result$data['company_id'] = (l$company_id as String?);
    }
    return Variables$Query$GetAllContactsList._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get company_id => (_$data['company_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('company_id')) {
      final l$company_id = company_id;
      result$data['company_id'] = l$company_id;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetAllContactsList<
          Variables$Query$GetAllContactsList>
      get copyWith => CopyWith$Variables$Query$GetAllContactsList(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetAllContactsList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$company_id = company_id;
    final lOther$company_id = other.company_id;
    if (_$data.containsKey('company_id') !=
        other._$data.containsKey('company_id')) {
      return false;
    }
    if (l$company_id != lOther$company_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$company_id = company_id;
    return Object.hashAll(
        [_$data.containsKey('company_id') ? l$company_id : const {}]);
  }
}

abstract class CopyWith$Variables$Query$GetAllContactsList<TRes> {
  factory CopyWith$Variables$Query$GetAllContactsList(
    Variables$Query$GetAllContactsList instance,
    TRes Function(Variables$Query$GetAllContactsList) then,
  ) = _CopyWithImpl$Variables$Query$GetAllContactsList;

  factory CopyWith$Variables$Query$GetAllContactsList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetAllContactsList;

  TRes call({String? company_id});
}

class _CopyWithImpl$Variables$Query$GetAllContactsList<TRes>
    implements CopyWith$Variables$Query$GetAllContactsList<TRes> {
  _CopyWithImpl$Variables$Query$GetAllContactsList(
    this._instance,
    this._then,
  );

  final Variables$Query$GetAllContactsList _instance;

  final TRes Function(Variables$Query$GetAllContactsList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? company_id = _undefined}) =>
      _then(Variables$Query$GetAllContactsList._({
        ..._instance._$data,
        if (company_id != _undefined) 'company_id': (company_id as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetAllContactsList<TRes>
    implements CopyWith$Variables$Query$GetAllContactsList<TRes> {
  _CopyWithStubImpl$Variables$Query$GetAllContactsList(this._res);

  TRes _res;

  call({String? company_id}) => _res;
}

class Query$GetAllContactsList {
  Query$GetAllContactsList({
    required this.employees,
    this.$__typename = 'query_root',
  });

  factory Query$GetAllContactsList.fromJson(Map<String, dynamic> json) {
    final l$employees = json['employees'];
    final l$$__typename = json['__typename'];
    return Query$GetAllContactsList(
      employees: (l$employees as List<dynamic>)
          .map((e) => Query$GetAllContactsList$employees.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetAllContactsList$employees> employees;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$employees = employees;
    _resultData['employees'] = l$employees.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$employees = employees;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$employees.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllContactsList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employees = employees;
    final lOther$employees = other.employees;
    if (l$employees.length != lOther$employees.length) {
      return false;
    }
    for (int i = 0; i < l$employees.length; i++) {
      final l$employees$entry = l$employees[i];
      final lOther$employees$entry = lOther$employees[i];
      if (l$employees$entry != lOther$employees$entry) {
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

extension UtilityExtension$Query$GetAllContactsList
    on Query$GetAllContactsList {
  CopyWith$Query$GetAllContactsList<Query$GetAllContactsList> get copyWith =>
      CopyWith$Query$GetAllContactsList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetAllContactsList<TRes> {
  factory CopyWith$Query$GetAllContactsList(
    Query$GetAllContactsList instance,
    TRes Function(Query$GetAllContactsList) then,
  ) = _CopyWithImpl$Query$GetAllContactsList;

  factory CopyWith$Query$GetAllContactsList.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllContactsList;

  TRes call({
    List<Query$GetAllContactsList$employees>? employees,
    String? $__typename,
  });
  TRes employees(
      Iterable<Query$GetAllContactsList$employees> Function(
              Iterable<
                  CopyWith$Query$GetAllContactsList$employees<
                      Query$GetAllContactsList$employees>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllContactsList<TRes>
    implements CopyWith$Query$GetAllContactsList<TRes> {
  _CopyWithImpl$Query$GetAllContactsList(
    this._instance,
    this._then,
  );

  final Query$GetAllContactsList _instance;

  final TRes Function(Query$GetAllContactsList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? employees = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllContactsList(
        employees: employees == _undefined || employees == null
            ? _instance.employees
            : (employees as List<Query$GetAllContactsList$employees>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes employees(
          Iterable<Query$GetAllContactsList$employees> Function(
                  Iterable<
                      CopyWith$Query$GetAllContactsList$employees<
                          Query$GetAllContactsList$employees>>)
              _fn) =>
      call(
          employees: _fn(_instance.employees
              .map((e) => CopyWith$Query$GetAllContactsList$employees(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetAllContactsList<TRes>
    implements CopyWith$Query$GetAllContactsList<TRes> {
  _CopyWithStubImpl$Query$GetAllContactsList(this._res);

  TRes _res;

  call({
    List<Query$GetAllContactsList$employees>? employees,
    String? $__typename,
  }) =>
      _res;

  employees(_fn) => _res;
}

const documentNodeQueryGetAllContactsList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllContactsList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'company_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'employees'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'company_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'company_id')),
                  )
                ]),
              )
            ]),
          )
        ],
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
            name: NameNode(value: 'id'),
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
            name: NameNode(value: 'file'),
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
                name: NameNode(value: 'file_name'),
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
Query$GetAllContactsList _parserFn$Query$GetAllContactsList(
        Map<String, dynamic> data) =>
    Query$GetAllContactsList.fromJson(data);
typedef OnQueryComplete$Query$GetAllContactsList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetAllContactsList?,
);

class Options$Query$GetAllContactsList
    extends graphql.QueryOptions<Query$GetAllContactsList> {
  Options$Query$GetAllContactsList({
    String? operationName,
    Variables$Query$GetAllContactsList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllContactsList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetAllContactsList? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Query$GetAllContactsList(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetAllContactsList,
          parserFn: _parserFn$Query$GetAllContactsList,
        );

  final OnQueryComplete$Query$GetAllContactsList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetAllContactsList
    extends graphql.WatchQueryOptions<Query$GetAllContactsList> {
  WatchOptions$Query$GetAllContactsList({
    String? operationName,
    Variables$Query$GetAllContactsList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllContactsList? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetAllContactsList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetAllContactsList,
        );
}

class FetchMoreOptions$Query$GetAllContactsList
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllContactsList({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetAllContactsList? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetAllContactsList,
        );
}

extension ClientExtension$Query$GetAllContactsList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllContactsList>>
      query$GetAllContactsList(
              [Options$Query$GetAllContactsList? options]) async =>
          await this.query(options ?? Options$Query$GetAllContactsList());
  graphql.ObservableQuery<Query$GetAllContactsList>
      watchQuery$GetAllContactsList(
              [WatchOptions$Query$GetAllContactsList? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetAllContactsList());
  void writeQuery$GetAllContactsList({
    required Query$GetAllContactsList data,
    Variables$Query$GetAllContactsList? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetAllContactsList),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetAllContactsList? readQuery$GetAllContactsList({
    Variables$Query$GetAllContactsList? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetAllContactsList),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetAllContactsList.fromJson(result);
  }
}

class Query$GetAllContactsList$employees {
  Query$GetAllContactsList$employees({
    required this.firstname,
    required this.lastname,
    required this.id,
    this.phone_number,
    this.file,
    this.$__typename = 'employees',
  });

  factory Query$GetAllContactsList$employees.fromJson(
      Map<String, dynamic> json) {
    final l$firstname = json['firstname'];
    final l$lastname = json['lastname'];
    final l$id = json['id'];
    final l$phone_number = json['phone_number'];
    final l$file = json['file'];
    final l$$__typename = json['__typename'];
    return Query$GetAllContactsList$employees(
      firstname: (l$firstname as String),
      lastname: (l$lastname as String),
      id: (l$id as String),
      phone_number: (l$phone_number as String?),
      file: l$file == null
          ? null
          : Query$GetAllContactsList$employees$file.fromJson(
              (l$file as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String firstname;

  final String lastname;

  final String id;

  final String? phone_number;

  final Query$GetAllContactsList$employees$file? file;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$firstname = firstname;
    _resultData['firstname'] = l$firstname;
    final l$lastname = lastname;
    _resultData['lastname'] = l$lastname;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$file = file;
    _resultData['file'] = l$file?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$firstname = firstname;
    final l$lastname = lastname;
    final l$id = id;
    final l$phone_number = phone_number;
    final l$file = file;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$firstname,
      l$lastname,
      l$id,
      l$phone_number,
      l$file,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllContactsList$employees ||
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
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
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

extension UtilityExtension$Query$GetAllContactsList$employees
    on Query$GetAllContactsList$employees {
  CopyWith$Query$GetAllContactsList$employees<
          Query$GetAllContactsList$employees>
      get copyWith => CopyWith$Query$GetAllContactsList$employees(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllContactsList$employees<TRes> {
  factory CopyWith$Query$GetAllContactsList$employees(
    Query$GetAllContactsList$employees instance,
    TRes Function(Query$GetAllContactsList$employees) then,
  ) = _CopyWithImpl$Query$GetAllContactsList$employees;

  factory CopyWith$Query$GetAllContactsList$employees.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllContactsList$employees;

  TRes call({
    String? firstname,
    String? lastname,
    String? id,
    String? phone_number,
    Query$GetAllContactsList$employees$file? file,
    String? $__typename,
  });
  CopyWith$Query$GetAllContactsList$employees$file<TRes> get file;
}

class _CopyWithImpl$Query$GetAllContactsList$employees<TRes>
    implements CopyWith$Query$GetAllContactsList$employees<TRes> {
  _CopyWithImpl$Query$GetAllContactsList$employees(
    this._instance,
    this._then,
  );

  final Query$GetAllContactsList$employees _instance;

  final TRes Function(Query$GetAllContactsList$employees) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstname = _undefined,
    Object? lastname = _undefined,
    Object? id = _undefined,
    Object? phone_number = _undefined,
    Object? file = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllContactsList$employees(
        firstname: firstname == _undefined || firstname == null
            ? _instance.firstname
            : (firstname as String),
        lastname: lastname == _undefined || lastname == null
            ? _instance.lastname
            : (lastname as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        phone_number: phone_number == _undefined
            ? _instance.phone_number
            : (phone_number as String?),
        file: file == _undefined
            ? _instance.file
            : (file as Query$GetAllContactsList$employees$file?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetAllContactsList$employees$file<TRes> get file {
    final local$file = _instance.file;
    return local$file == null
        ? CopyWith$Query$GetAllContactsList$employees$file.stub(
            _then(_instance))
        : CopyWith$Query$GetAllContactsList$employees$file(
            local$file, (e) => call(file: e));
  }
}

class _CopyWithStubImpl$Query$GetAllContactsList$employees<TRes>
    implements CopyWith$Query$GetAllContactsList$employees<TRes> {
  _CopyWithStubImpl$Query$GetAllContactsList$employees(this._res);

  TRes _res;

  call({
    String? firstname,
    String? lastname,
    String? id,
    String? phone_number,
    Query$GetAllContactsList$employees$file? file,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetAllContactsList$employees$file<TRes> get file =>
      CopyWith$Query$GetAllContactsList$employees$file.stub(_res);
}

class Query$GetAllContactsList$employees$file {
  Query$GetAllContactsList$employees$file({
    this.file_url,
    this.file_name,
    this.$__typename = 'files',
  });

  factory Query$GetAllContactsList$employees$file.fromJson(
      Map<String, dynamic> json) {
    final l$file_url = json['file_url'];
    final l$file_name = json['file_name'];
    final l$$__typename = json['__typename'];
    return Query$GetAllContactsList$employees$file(
      file_url: (l$file_url as String?),
      file_name: (l$file_name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? file_url;

  final String? file_name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$file_url = file_url;
    _resultData['file_url'] = l$file_url;
    final l$file_name = file_name;
    _resultData['file_name'] = l$file_name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$file_url = file_url;
    final l$file_name = file_name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$file_url,
      l$file_name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllContactsList$employees$file ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_url = file_url;
    final lOther$file_url = other.file_url;
    if (l$file_url != lOther$file_url) {
      return false;
    }
    final l$file_name = file_name;
    final lOther$file_name = other.file_name;
    if (l$file_name != lOther$file_name) {
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

extension UtilityExtension$Query$GetAllContactsList$employees$file
    on Query$GetAllContactsList$employees$file {
  CopyWith$Query$GetAllContactsList$employees$file<
          Query$GetAllContactsList$employees$file>
      get copyWith => CopyWith$Query$GetAllContactsList$employees$file(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllContactsList$employees$file<TRes> {
  factory CopyWith$Query$GetAllContactsList$employees$file(
    Query$GetAllContactsList$employees$file instance,
    TRes Function(Query$GetAllContactsList$employees$file) then,
  ) = _CopyWithImpl$Query$GetAllContactsList$employees$file;

  factory CopyWith$Query$GetAllContactsList$employees$file.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllContactsList$employees$file;

  TRes call({
    String? file_url,
    String? file_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllContactsList$employees$file<TRes>
    implements CopyWith$Query$GetAllContactsList$employees$file<TRes> {
  _CopyWithImpl$Query$GetAllContactsList$employees$file(
    this._instance,
    this._then,
  );

  final Query$GetAllContactsList$employees$file _instance;

  final TRes Function(Query$GetAllContactsList$employees$file) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_url = _undefined,
    Object? file_name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllContactsList$employees$file(
        file_url:
            file_url == _undefined ? _instance.file_url : (file_url as String?),
        file_name: file_name == _undefined
            ? _instance.file_name
            : (file_name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllContactsList$employees$file<TRes>
    implements CopyWith$Query$GetAllContactsList$employees$file<TRes> {
  _CopyWithStubImpl$Query$GetAllContactsList$employees$file(this._res);

  TRes _res;

  call({
    String? file_url,
    String? file_name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateConversation {
  factory Variables$Mutation$CreateConversation({
    required String firstParticipant,
    required String secondParticipants,
  }) =>
      Variables$Mutation$CreateConversation._({
        r'firstParticipant': firstParticipant,
        r'secondParticipants': secondParticipants,
      });

  Variables$Mutation$CreateConversation._(this._$data);

  factory Variables$Mutation$CreateConversation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$firstParticipant = data['firstParticipant'];
    result$data['firstParticipant'] = (l$firstParticipant as String);
    final l$secondParticipants = data['secondParticipants'];
    result$data['secondParticipants'] = (l$secondParticipants as String);
    return Variables$Mutation$CreateConversation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get firstParticipant => (_$data['firstParticipant'] as String);

  String get secondParticipants => (_$data['secondParticipants'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$firstParticipant = firstParticipant;
    result$data['firstParticipant'] = l$firstParticipant;
    final l$secondParticipants = secondParticipants;
    result$data['secondParticipants'] = l$secondParticipants;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateConversation<
          Variables$Mutation$CreateConversation>
      get copyWith => CopyWith$Variables$Mutation$CreateConversation(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateConversation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstParticipant = firstParticipant;
    final lOther$firstParticipant = other.firstParticipant;
    if (l$firstParticipant != lOther$firstParticipant) {
      return false;
    }
    final l$secondParticipants = secondParticipants;
    final lOther$secondParticipants = other.secondParticipants;
    if (l$secondParticipants != lOther$secondParticipants) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firstParticipant = firstParticipant;
    final l$secondParticipants = secondParticipants;
    return Object.hashAll([
      l$firstParticipant,
      l$secondParticipants,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateConversation<TRes> {
  factory CopyWith$Variables$Mutation$CreateConversation(
    Variables$Mutation$CreateConversation instance,
    TRes Function(Variables$Mutation$CreateConversation) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateConversation;

  factory CopyWith$Variables$Mutation$CreateConversation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateConversation;

  TRes call({
    String? firstParticipant,
    String? secondParticipants,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateConversation<TRes>
    implements CopyWith$Variables$Mutation$CreateConversation<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateConversation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateConversation _instance;

  final TRes Function(Variables$Mutation$CreateConversation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstParticipant = _undefined,
    Object? secondParticipants = _undefined,
  }) =>
      _then(Variables$Mutation$CreateConversation._({
        ..._instance._$data,
        if (firstParticipant != _undefined && firstParticipant != null)
          'firstParticipant': (firstParticipant as String),
        if (secondParticipants != _undefined && secondParticipants != null)
          'secondParticipants': (secondParticipants as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateConversation<TRes>
    implements CopyWith$Variables$Mutation$CreateConversation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateConversation(this._res);

  TRes _res;

  call({
    String? firstParticipant,
    String? secondParticipants,
  }) =>
      _res;
}

class Mutation$CreateConversation {
  Mutation$CreateConversation({
    required this.createConversation,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$CreateConversation.fromJson(Map<String, dynamic> json) {
    final l$createConversation = json['createConversation'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateConversation(
      createConversation:
          Mutation$CreateConversation$createConversation.fromJson(
              (l$createConversation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateConversation$createConversation createConversation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createConversation = createConversation;
    _resultData['createConversation'] = l$createConversation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createConversation = createConversation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createConversation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateConversation ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createConversation = createConversation;
    final lOther$createConversation = other.createConversation;
    if (l$createConversation != lOther$createConversation) {
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

extension UtilityExtension$Mutation$CreateConversation
    on Mutation$CreateConversation {
  CopyWith$Mutation$CreateConversation<Mutation$CreateConversation>
      get copyWith => CopyWith$Mutation$CreateConversation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateConversation<TRes> {
  factory CopyWith$Mutation$CreateConversation(
    Mutation$CreateConversation instance,
    TRes Function(Mutation$CreateConversation) then,
  ) = _CopyWithImpl$Mutation$CreateConversation;

  factory CopyWith$Mutation$CreateConversation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateConversation;

  TRes call({
    Mutation$CreateConversation$createConversation? createConversation,
    String? $__typename,
  });
  CopyWith$Mutation$CreateConversation$createConversation<TRes>
      get createConversation;
}

class _CopyWithImpl$Mutation$CreateConversation<TRes>
    implements CopyWith$Mutation$CreateConversation<TRes> {
  _CopyWithImpl$Mutation$CreateConversation(
    this._instance,
    this._then,
  );

  final Mutation$CreateConversation _instance;

  final TRes Function(Mutation$CreateConversation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createConversation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateConversation(
        createConversation:
            createConversation == _undefined || createConversation == null
                ? _instance.createConversation
                : (createConversation
                    as Mutation$CreateConversation$createConversation),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateConversation$createConversation<TRes>
      get createConversation {
    final local$createConversation = _instance.createConversation;
    return CopyWith$Mutation$CreateConversation$createConversation(
        local$createConversation, (e) => call(createConversation: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateConversation<TRes>
    implements CopyWith$Mutation$CreateConversation<TRes> {
  _CopyWithStubImpl$Mutation$CreateConversation(this._res);

  TRes _res;

  call({
    Mutation$CreateConversation$createConversation? createConversation,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateConversation$createConversation<TRes>
      get createConversation =>
          CopyWith$Mutation$CreateConversation$createConversation.stub(_res);
}

const documentNodeMutationCreateConversation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateConversation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firstParticipant')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'secondParticipants')),
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
        name: NameNode(value: 'createConversation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'conversation'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'isGroup'),
                value: BooleanValueNode(value: false),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'firstParticipant'),
                value: VariableNode(name: NameNode(value: 'firstParticipant')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'secondParticipants'),
                value:
                    VariableNode(name: NameNode(value: 'secondParticipants')),
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
Mutation$CreateConversation _parserFn$Mutation$CreateConversation(
        Map<String, dynamic> data) =>
    Mutation$CreateConversation.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateConversation = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateConversation?,
);

class Options$Mutation$CreateConversation
    extends graphql.MutationOptions<Mutation$CreateConversation> {
  Options$Mutation$CreateConversation({
    String? operationName,
    required Variables$Mutation$CreateConversation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateConversation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateConversation? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateConversation>? update,
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
                        : _parserFn$Mutation$CreateConversation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateConversation,
          parserFn: _parserFn$Mutation$CreateConversation,
        );

  final OnMutationCompleted$Mutation$CreateConversation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateConversation
    extends graphql.WatchQueryOptions<Mutation$CreateConversation> {
  WatchOptions$Mutation$CreateConversation({
    String? operationName,
    required Variables$Mutation$CreateConversation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateConversation? typedOptimisticResult,
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
          document: documentNodeMutationCreateConversation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateConversation,
        );
}

extension ClientExtension$Mutation$CreateConversation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateConversation>>
      mutate$CreateConversation(
              Options$Mutation$CreateConversation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateConversation>
      watchMutation$CreateConversation(
              WatchOptions$Mutation$CreateConversation options) =>
          this.watchMutation(options);
}

class Mutation$CreateConversation$createConversation {
  Mutation$CreateConversation$createConversation({
    required this.id,
    this.$__typename = 'CreateConvOutput',
  });

  factory Mutation$CreateConversation$createConversation.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateConversation$createConversation(
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
    if (other is! Mutation$CreateConversation$createConversation ||
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

extension UtilityExtension$Mutation$CreateConversation$createConversation
    on Mutation$CreateConversation$createConversation {
  CopyWith$Mutation$CreateConversation$createConversation<
          Mutation$CreateConversation$createConversation>
      get copyWith => CopyWith$Mutation$CreateConversation$createConversation(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateConversation$createConversation<TRes> {
  factory CopyWith$Mutation$CreateConversation$createConversation(
    Mutation$CreateConversation$createConversation instance,
    TRes Function(Mutation$CreateConversation$createConversation) then,
  ) = _CopyWithImpl$Mutation$CreateConversation$createConversation;

  factory CopyWith$Mutation$CreateConversation$createConversation.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateConversation$createConversation;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateConversation$createConversation<TRes>
    implements CopyWith$Mutation$CreateConversation$createConversation<TRes> {
  _CopyWithImpl$Mutation$CreateConversation$createConversation(
    this._instance,
    this._then,
  );

  final Mutation$CreateConversation$createConversation _instance;

  final TRes Function(Mutation$CreateConversation$createConversation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateConversation$createConversation(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateConversation$createConversation<TRes>
    implements CopyWith$Mutation$CreateConversation$createConversation<TRes> {
  _CopyWithStubImpl$Mutation$CreateConversation$createConversation(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$InserMessageWithAttachment {
  factory Variables$Mutation$InserMessageWithAttachment({
    required String sender_id,
    required String conversation_id,
    String? content,
    String? file_path,
    String? file_type,
    String? mime_type,
    String? file_size,
    String? $extension,
    String? width,
    String? length,
    String? height,
    String? filename,
    String? message_mobile_id,
    String? samples,
  }) =>
      Variables$Mutation$InserMessageWithAttachment._({
        r'sender_id': sender_id,
        r'conversation_id': conversation_id,
        if (content != null) r'content': content,
        if (file_path != null) r'file_path': file_path,
        if (file_type != null) r'file_type': file_type,
        if (mime_type != null) r'mime_type': mime_type,
        if (file_size != null) r'file_size': file_size,
        if ($extension != null) r'extension': $extension,
        if (width != null) r'width': width,
        if (length != null) r'length': length,
        if (height != null) r'height': height,
        if (filename != null) r'filename': filename,
        if (message_mobile_id != null) r'message_mobile_id': message_mobile_id,
        if (samples != null) r'samples': samples,
      });

  Variables$Mutation$InserMessageWithAttachment._(this._$data);

  factory Variables$Mutation$InserMessageWithAttachment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sender_id = data['sender_id'];
    result$data['sender_id'] = (l$sender_id as String);
    final l$conversation_id = data['conversation_id'];
    result$data['conversation_id'] = (l$conversation_id as String);
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    if (data.containsKey('file_path')) {
      final l$file_path = data['file_path'];
      result$data['file_path'] = (l$file_path as String?);
    }
    if (data.containsKey('file_type')) {
      final l$file_type = data['file_type'];
      result$data['file_type'] = (l$file_type as String?);
    }
    if (data.containsKey('mime_type')) {
      final l$mime_type = data['mime_type'];
      result$data['mime_type'] = (l$mime_type as String?);
    }
    if (data.containsKey('file_size')) {
      final l$file_size = data['file_size'];
      result$data['file_size'] = (l$file_size as String?);
    }
    if (data.containsKey('extension')) {
      final l$$extension = data['extension'];
      result$data['extension'] = (l$$extension as String?);
    }
    if (data.containsKey('width')) {
      final l$width = data['width'];
      result$data['width'] = (l$width as String?);
    }
    if (data.containsKey('length')) {
      final l$length = data['length'];
      result$data['length'] = (l$length as String?);
    }
    if (data.containsKey('height')) {
      final l$height = data['height'];
      result$data['height'] = (l$height as String?);
    }
    if (data.containsKey('filename')) {
      final l$filename = data['filename'];
      result$data['filename'] = (l$filename as String?);
    }
    if (data.containsKey('message_mobile_id')) {
      final l$message_mobile_id = data['message_mobile_id'];
      result$data['message_mobile_id'] = (l$message_mobile_id as String?);
    }
    if (data.containsKey('samples')) {
      final l$samples = data['samples'];
      result$data['samples'] = (l$samples as String?);
    }
    return Variables$Mutation$InserMessageWithAttachment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get sender_id => (_$data['sender_id'] as String);

  String get conversation_id => (_$data['conversation_id'] as String);

  String? get content => (_$data['content'] as String?);

  String? get file_path => (_$data['file_path'] as String?);

  String? get file_type => (_$data['file_type'] as String?);

  String? get mime_type => (_$data['mime_type'] as String?);

  String? get file_size => (_$data['file_size'] as String?);

  String? get $extension => (_$data['extension'] as String?);

  String? get width => (_$data['width'] as String?);

  String? get length => (_$data['length'] as String?);

  String? get height => (_$data['height'] as String?);

  String? get filename => (_$data['filename'] as String?);

  String? get message_mobile_id => (_$data['message_mobile_id'] as String?);

  String? get samples => (_$data['samples'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sender_id = sender_id;
    result$data['sender_id'] = l$sender_id;
    final l$conversation_id = conversation_id;
    result$data['conversation_id'] = l$conversation_id;
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    if (_$data.containsKey('file_path')) {
      final l$file_path = file_path;
      result$data['file_path'] = l$file_path;
    }
    if (_$data.containsKey('file_type')) {
      final l$file_type = file_type;
      result$data['file_type'] = l$file_type;
    }
    if (_$data.containsKey('mime_type')) {
      final l$mime_type = mime_type;
      result$data['mime_type'] = l$mime_type;
    }
    if (_$data.containsKey('file_size')) {
      final l$file_size = file_size;
      result$data['file_size'] = l$file_size;
    }
    if (_$data.containsKey('extension')) {
      final l$$extension = $extension;
      result$data['extension'] = l$$extension;
    }
    if (_$data.containsKey('width')) {
      final l$width = width;
      result$data['width'] = l$width;
    }
    if (_$data.containsKey('length')) {
      final l$length = length;
      result$data['length'] = l$length;
    }
    if (_$data.containsKey('height')) {
      final l$height = height;
      result$data['height'] = l$height;
    }
    if (_$data.containsKey('filename')) {
      final l$filename = filename;
      result$data['filename'] = l$filename;
    }
    if (_$data.containsKey('message_mobile_id')) {
      final l$message_mobile_id = message_mobile_id;
      result$data['message_mobile_id'] = l$message_mobile_id;
    }
    if (_$data.containsKey('samples')) {
      final l$samples = samples;
      result$data['samples'] = l$samples;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$InserMessageWithAttachment<
          Variables$Mutation$InserMessageWithAttachment>
      get copyWith => CopyWith$Variables$Mutation$InserMessageWithAttachment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InserMessageWithAttachment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sender_id = sender_id;
    final lOther$sender_id = other.sender_id;
    if (l$sender_id != lOther$sender_id) {
      return false;
    }
    final l$conversation_id = conversation_id;
    final lOther$conversation_id = other.conversation_id;
    if (l$conversation_id != lOther$conversation_id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$file_path = file_path;
    final lOther$file_path = other.file_path;
    if (_$data.containsKey('file_path') !=
        other._$data.containsKey('file_path')) {
      return false;
    }
    if (l$file_path != lOther$file_path) {
      return false;
    }
    final l$file_type = file_type;
    final lOther$file_type = other.file_type;
    if (_$data.containsKey('file_type') !=
        other._$data.containsKey('file_type')) {
      return false;
    }
    if (l$file_type != lOther$file_type) {
      return false;
    }
    final l$mime_type = mime_type;
    final lOther$mime_type = other.mime_type;
    if (_$data.containsKey('mime_type') !=
        other._$data.containsKey('mime_type')) {
      return false;
    }
    if (l$mime_type != lOther$mime_type) {
      return false;
    }
    final l$file_size = file_size;
    final lOther$file_size = other.file_size;
    if (_$data.containsKey('file_size') !=
        other._$data.containsKey('file_size')) {
      return false;
    }
    if (l$file_size != lOther$file_size) {
      return false;
    }
    final l$$extension = $extension;
    final lOther$$extension = other.$extension;
    if (_$data.containsKey('extension') !=
        other._$data.containsKey('extension')) {
      return false;
    }
    if (l$$extension != lOther$$extension) {
      return false;
    }
    final l$width = width;
    final lOther$width = other.width;
    if (_$data.containsKey('width') != other._$data.containsKey('width')) {
      return false;
    }
    if (l$width != lOther$width) {
      return false;
    }
    final l$length = length;
    final lOther$length = other.length;
    if (_$data.containsKey('length') != other._$data.containsKey('length')) {
      return false;
    }
    if (l$length != lOther$length) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (_$data.containsKey('height') != other._$data.containsKey('height')) {
      return false;
    }
    if (l$height != lOther$height) {
      return false;
    }
    final l$filename = filename;
    final lOther$filename = other.filename;
    if (_$data.containsKey('filename') !=
        other._$data.containsKey('filename')) {
      return false;
    }
    if (l$filename != lOther$filename) {
      return false;
    }
    final l$message_mobile_id = message_mobile_id;
    final lOther$message_mobile_id = other.message_mobile_id;
    if (_$data.containsKey('message_mobile_id') !=
        other._$data.containsKey('message_mobile_id')) {
      return false;
    }
    if (l$message_mobile_id != lOther$message_mobile_id) {
      return false;
    }
    final l$samples = samples;
    final lOther$samples = other.samples;
    if (_$data.containsKey('samples') != other._$data.containsKey('samples')) {
      return false;
    }
    if (l$samples != lOther$samples) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sender_id = sender_id;
    final l$conversation_id = conversation_id;
    final l$content = content;
    final l$file_path = file_path;
    final l$file_type = file_type;
    final l$mime_type = mime_type;
    final l$file_size = file_size;
    final l$$extension = $extension;
    final l$width = width;
    final l$length = length;
    final l$height = height;
    final l$filename = filename;
    final l$message_mobile_id = message_mobile_id;
    final l$samples = samples;
    return Object.hashAll([
      l$sender_id,
      l$conversation_id,
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('file_path') ? l$file_path : const {},
      _$data.containsKey('file_type') ? l$file_type : const {},
      _$data.containsKey('mime_type') ? l$mime_type : const {},
      _$data.containsKey('file_size') ? l$file_size : const {},
      _$data.containsKey('extension') ? l$$extension : const {},
      _$data.containsKey('width') ? l$width : const {},
      _$data.containsKey('length') ? l$length : const {},
      _$data.containsKey('height') ? l$height : const {},
      _$data.containsKey('filename') ? l$filename : const {},
      _$data.containsKey('message_mobile_id') ? l$message_mobile_id : const {},
      _$data.containsKey('samples') ? l$samples : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InserMessageWithAttachment<TRes> {
  factory CopyWith$Variables$Mutation$InserMessageWithAttachment(
    Variables$Mutation$InserMessageWithAttachment instance,
    TRes Function(Variables$Mutation$InserMessageWithAttachment) then,
  ) = _CopyWithImpl$Variables$Mutation$InserMessageWithAttachment;

  factory CopyWith$Variables$Mutation$InserMessageWithAttachment.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InserMessageWithAttachment;

  TRes call({
    String? sender_id,
    String? conversation_id,
    String? content,
    String? file_path,
    String? file_type,
    String? mime_type,
    String? file_size,
    String? $extension,
    String? width,
    String? length,
    String? height,
    String? filename,
    String? message_mobile_id,
    String? samples,
  });
}

class _CopyWithImpl$Variables$Mutation$InserMessageWithAttachment<TRes>
    implements CopyWith$Variables$Mutation$InserMessageWithAttachment<TRes> {
  _CopyWithImpl$Variables$Mutation$InserMessageWithAttachment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InserMessageWithAttachment _instance;

  final TRes Function(Variables$Mutation$InserMessageWithAttachment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sender_id = _undefined,
    Object? conversation_id = _undefined,
    Object? content = _undefined,
    Object? file_path = _undefined,
    Object? file_type = _undefined,
    Object? mime_type = _undefined,
    Object? file_size = _undefined,
    Object? $extension = _undefined,
    Object? width = _undefined,
    Object? length = _undefined,
    Object? height = _undefined,
    Object? filename = _undefined,
    Object? message_mobile_id = _undefined,
    Object? samples = _undefined,
  }) =>
      _then(Variables$Mutation$InserMessageWithAttachment._({
        ..._instance._$data,
        if (sender_id != _undefined && sender_id != null)
          'sender_id': (sender_id as String),
        if (conversation_id != _undefined && conversation_id != null)
          'conversation_id': (conversation_id as String),
        if (content != _undefined) 'content': (content as String?),
        if (file_path != _undefined) 'file_path': (file_path as String?),
        if (file_type != _undefined) 'file_type': (file_type as String?),
        if (mime_type != _undefined) 'mime_type': (mime_type as String?),
        if (file_size != _undefined) 'file_size': (file_size as String?),
        if ($extension != _undefined) 'extension': ($extension as String?),
        if (width != _undefined) 'width': (width as String?),
        if (length != _undefined) 'length': (length as String?),
        if (height != _undefined) 'height': (height as String?),
        if (filename != _undefined) 'filename': (filename as String?),
        if (message_mobile_id != _undefined)
          'message_mobile_id': (message_mobile_id as String?),
        if (samples != _undefined) 'samples': (samples as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$InserMessageWithAttachment<TRes>
    implements CopyWith$Variables$Mutation$InserMessageWithAttachment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InserMessageWithAttachment(this._res);

  TRes _res;

  call({
    String? sender_id,
    String? conversation_id,
    String? content,
    String? file_path,
    String? file_type,
    String? mime_type,
    String? file_size,
    String? $extension,
    String? width,
    String? length,
    String? height,
    String? filename,
    String? message_mobile_id,
    String? samples,
  }) =>
      _res;
}

class Mutation$InserMessageWithAttachment {
  Mutation$InserMessageWithAttachment({
    this.insert_messages_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$InserMessageWithAttachment.fromJson(
      Map<String, dynamic> json) {
    final l$insert_messages_one = json['insert_messages_one'];
    final l$$__typename = json['__typename'];
    return Mutation$InserMessageWithAttachment(
      insert_messages_one: l$insert_messages_one == null
          ? null
          : Mutation$InserMessageWithAttachment$insert_messages_one.fromJson(
              (l$insert_messages_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InserMessageWithAttachment$insert_messages_one?
      insert_messages_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_messages_one = insert_messages_one;
    _resultData['insert_messages_one'] = l$insert_messages_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_messages_one = insert_messages_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_messages_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InserMessageWithAttachment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_messages_one = insert_messages_one;
    final lOther$insert_messages_one = other.insert_messages_one;
    if (l$insert_messages_one != lOther$insert_messages_one) {
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

extension UtilityExtension$Mutation$InserMessageWithAttachment
    on Mutation$InserMessageWithAttachment {
  CopyWith$Mutation$InserMessageWithAttachment<
          Mutation$InserMessageWithAttachment>
      get copyWith => CopyWith$Mutation$InserMessageWithAttachment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InserMessageWithAttachment<TRes> {
  factory CopyWith$Mutation$InserMessageWithAttachment(
    Mutation$InserMessageWithAttachment instance,
    TRes Function(Mutation$InserMessageWithAttachment) then,
  ) = _CopyWithImpl$Mutation$InserMessageWithAttachment;

  factory CopyWith$Mutation$InserMessageWithAttachment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InserMessageWithAttachment;

  TRes call({
    Mutation$InserMessageWithAttachment$insert_messages_one?
        insert_messages_one,
    String? $__typename,
  });
  CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<TRes>
      get insert_messages_one;
}

class _CopyWithImpl$Mutation$InserMessageWithAttachment<TRes>
    implements CopyWith$Mutation$InserMessageWithAttachment<TRes> {
  _CopyWithImpl$Mutation$InserMessageWithAttachment(
    this._instance,
    this._then,
  );

  final Mutation$InserMessageWithAttachment _instance;

  final TRes Function(Mutation$InserMessageWithAttachment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_messages_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InserMessageWithAttachment(
        insert_messages_one: insert_messages_one == _undefined
            ? _instance.insert_messages_one
            : (insert_messages_one
                as Mutation$InserMessageWithAttachment$insert_messages_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<TRes>
      get insert_messages_one {
    final local$insert_messages_one = _instance.insert_messages_one;
    return local$insert_messages_one == null
        ? CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one.stub(
            _then(_instance))
        : CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one(
            local$insert_messages_one, (e) => call(insert_messages_one: e));
  }
}

class _CopyWithStubImpl$Mutation$InserMessageWithAttachment<TRes>
    implements CopyWith$Mutation$InserMessageWithAttachment<TRes> {
  _CopyWithStubImpl$Mutation$InserMessageWithAttachment(this._res);

  TRes _res;

  call({
    Mutation$InserMessageWithAttachment$insert_messages_one?
        insert_messages_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<TRes>
      get insert_messages_one =>
          CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one.stub(
              _res);
}

const documentNodeMutationInserMessageWithAttachment =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InserMessageWithAttachment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sender_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'conversation_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'file_path')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'file_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mime_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'file_size')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'extension')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'width')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'length')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'height')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filename')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message_mobile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'samples')),
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
        name: NameNode(value: 'insert_messages_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'is_read'),
                value: BooleanValueNode(value: false),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sender_id'),
                value: VariableNode(name: NameNode(value: 'sender_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'conversation_id'),
                value: VariableNode(name: NameNode(value: 'conversation_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'attachments'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'data'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'file_path'),
                        value: VariableNode(name: NameNode(value: 'file_path')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'file_type'),
                        value: VariableNode(name: NameNode(value: 'file_type')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'mime_type'),
                        value: VariableNode(name: NameNode(value: 'mime_type')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'file_size'),
                        value: VariableNode(name: NameNode(value: 'file_size')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'extension'),
                        value: VariableNode(name: NameNode(value: 'extension')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'width'),
                        value: VariableNode(name: NameNode(value: 'width')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'length'),
                        value: VariableNode(name: NameNode(value: 'length')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'height'),
                        value: VariableNode(name: NameNode(value: 'height')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'filename'),
                        value: VariableNode(name: NameNode(value: 'filename')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'samples'),
                        value: VariableNode(name: NameNode(value: 'samples')),
                      ),
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message_mobile_id'),
                value: VariableNode(name: NameNode(value: 'message_mobile_id')),
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
Mutation$InserMessageWithAttachment
    _parserFn$Mutation$InserMessageWithAttachment(Map<String, dynamic> data) =>
        Mutation$InserMessageWithAttachment.fromJson(data);
typedef OnMutationCompleted$Mutation$InserMessageWithAttachment = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$InserMessageWithAttachment?,
);

class Options$Mutation$InserMessageWithAttachment
    extends graphql.MutationOptions<Mutation$InserMessageWithAttachment> {
  Options$Mutation$InserMessageWithAttachment({
    String? operationName,
    required Variables$Mutation$InserMessageWithAttachment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InserMessageWithAttachment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InserMessageWithAttachment? onCompleted,
    graphql.OnMutationUpdate<Mutation$InserMessageWithAttachment>? update,
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
                        : _parserFn$Mutation$InserMessageWithAttachment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInserMessageWithAttachment,
          parserFn: _parserFn$Mutation$InserMessageWithAttachment,
        );

  final OnMutationCompleted$Mutation$InserMessageWithAttachment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InserMessageWithAttachment
    extends graphql.WatchQueryOptions<Mutation$InserMessageWithAttachment> {
  WatchOptions$Mutation$InserMessageWithAttachment({
    String? operationName,
    required Variables$Mutation$InserMessageWithAttachment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InserMessageWithAttachment? typedOptimisticResult,
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
          document: documentNodeMutationInserMessageWithAttachment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InserMessageWithAttachment,
        );
}

extension ClientExtension$Mutation$InserMessageWithAttachment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InserMessageWithAttachment>>
      mutate$InserMessageWithAttachment(
              Options$Mutation$InserMessageWithAttachment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$InserMessageWithAttachment>
      watchMutation$InserMessageWithAttachment(
              WatchOptions$Mutation$InserMessageWithAttachment options) =>
          this.watchMutation(options);
}

class Mutation$InserMessageWithAttachment$insert_messages_one {
  Mutation$InserMessageWithAttachment$insert_messages_one({
    required this.id,
    this.$__typename = 'messages',
  });

  factory Mutation$InserMessageWithAttachment$insert_messages_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$InserMessageWithAttachment$insert_messages_one(
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
    if (other is! Mutation$InserMessageWithAttachment$insert_messages_one ||
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

extension UtilityExtension$Mutation$InserMessageWithAttachment$insert_messages_one
    on Mutation$InserMessageWithAttachment$insert_messages_one {
  CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<
          Mutation$InserMessageWithAttachment$insert_messages_one>
      get copyWith =>
          CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<
    TRes> {
  factory CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one(
    Mutation$InserMessageWithAttachment$insert_messages_one instance,
    TRes Function(Mutation$InserMessageWithAttachment$insert_messages_one) then,
  ) = _CopyWithImpl$Mutation$InserMessageWithAttachment$insert_messages_one;

  factory CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$InserMessageWithAttachment$insert_messages_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InserMessageWithAttachment$insert_messages_one<
        TRes>
    implements
        CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<TRes> {
  _CopyWithImpl$Mutation$InserMessageWithAttachment$insert_messages_one(
    this._instance,
    this._then,
  );

  final Mutation$InserMessageWithAttachment$insert_messages_one _instance;

  final TRes Function(Mutation$InserMessageWithAttachment$insert_messages_one)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InserMessageWithAttachment$insert_messages_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$InserMessageWithAttachment$insert_messages_one<
        TRes>
    implements
        CopyWith$Mutation$InserMessageWithAttachment$insert_messages_one<TRes> {
  _CopyWithStubImpl$Mutation$InserMessageWithAttachment$insert_messages_one(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$InserMessageWithoutAttachment {
  factory Variables$Mutation$InserMessageWithoutAttachment({
    required String conversation_id,
    String? content,
    required String sender_id,
    String? message_mobile_id,
  }) =>
      Variables$Mutation$InserMessageWithoutAttachment._({
        r'conversation_id': conversation_id,
        if (content != null) r'content': content,
        r'sender_id': sender_id,
        if (message_mobile_id != null) r'message_mobile_id': message_mobile_id,
      });

  Variables$Mutation$InserMessageWithoutAttachment._(this._$data);

  factory Variables$Mutation$InserMessageWithoutAttachment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$conversation_id = data['conversation_id'];
    result$data['conversation_id'] = (l$conversation_id as String);
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    final l$sender_id = data['sender_id'];
    result$data['sender_id'] = (l$sender_id as String);
    if (data.containsKey('message_mobile_id')) {
      final l$message_mobile_id = data['message_mobile_id'];
      result$data['message_mobile_id'] = (l$message_mobile_id as String?);
    }
    return Variables$Mutation$InserMessageWithoutAttachment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get conversation_id => (_$data['conversation_id'] as String);

  String? get content => (_$data['content'] as String?);

  String get sender_id => (_$data['sender_id'] as String);

  String? get message_mobile_id => (_$data['message_mobile_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$conversation_id = conversation_id;
    result$data['conversation_id'] = l$conversation_id;
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    final l$sender_id = sender_id;
    result$data['sender_id'] = l$sender_id;
    if (_$data.containsKey('message_mobile_id')) {
      final l$message_mobile_id = message_mobile_id;
      result$data['message_mobile_id'] = l$message_mobile_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$InserMessageWithoutAttachment<
          Variables$Mutation$InserMessageWithoutAttachment>
      get copyWith => CopyWith$Variables$Mutation$InserMessageWithoutAttachment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$InserMessageWithoutAttachment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$conversation_id = conversation_id;
    final lOther$conversation_id = other.conversation_id;
    if (l$conversation_id != lOther$conversation_id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$sender_id = sender_id;
    final lOther$sender_id = other.sender_id;
    if (l$sender_id != lOther$sender_id) {
      return false;
    }
    final l$message_mobile_id = message_mobile_id;
    final lOther$message_mobile_id = other.message_mobile_id;
    if (_$data.containsKey('message_mobile_id') !=
        other._$data.containsKey('message_mobile_id')) {
      return false;
    }
    if (l$message_mobile_id != lOther$message_mobile_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$conversation_id = conversation_id;
    final l$content = content;
    final l$sender_id = sender_id;
    final l$message_mobile_id = message_mobile_id;
    return Object.hashAll([
      l$conversation_id,
      _$data.containsKey('content') ? l$content : const {},
      l$sender_id,
      _$data.containsKey('message_mobile_id') ? l$message_mobile_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$InserMessageWithoutAttachment<TRes> {
  factory CopyWith$Variables$Mutation$InserMessageWithoutAttachment(
    Variables$Mutation$InserMessageWithoutAttachment instance,
    TRes Function(Variables$Mutation$InserMessageWithoutAttachment) then,
  ) = _CopyWithImpl$Variables$Mutation$InserMessageWithoutAttachment;

  factory CopyWith$Variables$Mutation$InserMessageWithoutAttachment.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$InserMessageWithoutAttachment;

  TRes call({
    String? conversation_id,
    String? content,
    String? sender_id,
    String? message_mobile_id,
  });
}

class _CopyWithImpl$Variables$Mutation$InserMessageWithoutAttachment<TRes>
    implements CopyWith$Variables$Mutation$InserMessageWithoutAttachment<TRes> {
  _CopyWithImpl$Variables$Mutation$InserMessageWithoutAttachment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$InserMessageWithoutAttachment _instance;

  final TRes Function(Variables$Mutation$InserMessageWithoutAttachment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? conversation_id = _undefined,
    Object? content = _undefined,
    Object? sender_id = _undefined,
    Object? message_mobile_id = _undefined,
  }) =>
      _then(Variables$Mutation$InserMessageWithoutAttachment._({
        ..._instance._$data,
        if (conversation_id != _undefined && conversation_id != null)
          'conversation_id': (conversation_id as String),
        if (content != _undefined) 'content': (content as String?),
        if (sender_id != _undefined && sender_id != null)
          'sender_id': (sender_id as String),
        if (message_mobile_id != _undefined)
          'message_mobile_id': (message_mobile_id as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$InserMessageWithoutAttachment<TRes>
    implements CopyWith$Variables$Mutation$InserMessageWithoutAttachment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$InserMessageWithoutAttachment(this._res);

  TRes _res;

  call({
    String? conversation_id,
    String? content,
    String? sender_id,
    String? message_mobile_id,
  }) =>
      _res;
}

class Mutation$InserMessageWithoutAttachment {
  Mutation$InserMessageWithoutAttachment({
    this.insert_messages_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$InserMessageWithoutAttachment.fromJson(
      Map<String, dynamic> json) {
    final l$insert_messages_one = json['insert_messages_one'];
    final l$$__typename = json['__typename'];
    return Mutation$InserMessageWithoutAttachment(
      insert_messages_one: l$insert_messages_one == null
          ? null
          : Mutation$InserMessageWithoutAttachment$insert_messages_one.fromJson(
              (l$insert_messages_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$InserMessageWithoutAttachment$insert_messages_one?
      insert_messages_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_messages_one = insert_messages_one;
    _resultData['insert_messages_one'] = l$insert_messages_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_messages_one = insert_messages_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_messages_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$InserMessageWithoutAttachment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_messages_one = insert_messages_one;
    final lOther$insert_messages_one = other.insert_messages_one;
    if (l$insert_messages_one != lOther$insert_messages_one) {
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

extension UtilityExtension$Mutation$InserMessageWithoutAttachment
    on Mutation$InserMessageWithoutAttachment {
  CopyWith$Mutation$InserMessageWithoutAttachment<
          Mutation$InserMessageWithoutAttachment>
      get copyWith => CopyWith$Mutation$InserMessageWithoutAttachment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InserMessageWithoutAttachment<TRes> {
  factory CopyWith$Mutation$InserMessageWithoutAttachment(
    Mutation$InserMessageWithoutAttachment instance,
    TRes Function(Mutation$InserMessageWithoutAttachment) then,
  ) = _CopyWithImpl$Mutation$InserMessageWithoutAttachment;

  factory CopyWith$Mutation$InserMessageWithoutAttachment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment;

  TRes call({
    Mutation$InserMessageWithoutAttachment$insert_messages_one?
        insert_messages_one,
    String? $__typename,
  });
  CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<TRes>
      get insert_messages_one;
}

class _CopyWithImpl$Mutation$InserMessageWithoutAttachment<TRes>
    implements CopyWith$Mutation$InserMessageWithoutAttachment<TRes> {
  _CopyWithImpl$Mutation$InserMessageWithoutAttachment(
    this._instance,
    this._then,
  );

  final Mutation$InserMessageWithoutAttachment _instance;

  final TRes Function(Mutation$InserMessageWithoutAttachment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_messages_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InserMessageWithoutAttachment(
        insert_messages_one: insert_messages_one == _undefined
            ? _instance.insert_messages_one
            : (insert_messages_one
                as Mutation$InserMessageWithoutAttachment$insert_messages_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<TRes>
      get insert_messages_one {
    final local$insert_messages_one = _instance.insert_messages_one;
    return local$insert_messages_one == null
        ? CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one
            .stub(_then(_instance))
        : CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one(
            local$insert_messages_one, (e) => call(insert_messages_one: e));
  }
}

class _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment<TRes>
    implements CopyWith$Mutation$InserMessageWithoutAttachment<TRes> {
  _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment(this._res);

  TRes _res;

  call({
    Mutation$InserMessageWithoutAttachment$insert_messages_one?
        insert_messages_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<TRes>
      get insert_messages_one =>
          CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one
              .stub(_res);
}

const documentNodeMutationInserMessageWithoutAttachment =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'InserMessageWithoutAttachment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'conversation_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: NullValueNode()),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sender_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'uuid'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message_mobile_id')),
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
        name: NameNode(value: 'insert_messages_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'conversation_id'),
                value: VariableNode(name: NameNode(value: 'conversation_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_read'),
                value: BooleanValueNode(value: false),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sender_id'),
                value: VariableNode(name: NameNode(value: 'sender_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message_mobile_id'),
                value: VariableNode(name: NameNode(value: 'message_mobile_id')),
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
Mutation$InserMessageWithoutAttachment
    _parserFn$Mutation$InserMessageWithoutAttachment(
            Map<String, dynamic> data) =>
        Mutation$InserMessageWithoutAttachment.fromJson(data);
typedef OnMutationCompleted$Mutation$InserMessageWithoutAttachment
    = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$InserMessageWithoutAttachment?,
);

class Options$Mutation$InserMessageWithoutAttachment
    extends graphql.MutationOptions<Mutation$InserMessageWithoutAttachment> {
  Options$Mutation$InserMessageWithoutAttachment({
    String? operationName,
    required Variables$Mutation$InserMessageWithoutAttachment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InserMessageWithoutAttachment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$InserMessageWithoutAttachment? onCompleted,
    graphql.OnMutationUpdate<Mutation$InserMessageWithoutAttachment>? update,
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
                        : _parserFn$Mutation$InserMessageWithoutAttachment(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationInserMessageWithoutAttachment,
          parserFn: _parserFn$Mutation$InserMessageWithoutAttachment,
        );

  final OnMutationCompleted$Mutation$InserMessageWithoutAttachment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$InserMessageWithoutAttachment
    extends graphql.WatchQueryOptions<Mutation$InserMessageWithoutAttachment> {
  WatchOptions$Mutation$InserMessageWithoutAttachment({
    String? operationName,
    required Variables$Mutation$InserMessageWithoutAttachment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$InserMessageWithoutAttachment? typedOptimisticResult,
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
          document: documentNodeMutationInserMessageWithoutAttachment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$InserMessageWithoutAttachment,
        );
}

extension ClientExtension$Mutation$InserMessageWithoutAttachment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$InserMessageWithoutAttachment>>
      mutate$InserMessageWithoutAttachment(
              Options$Mutation$InserMessageWithoutAttachment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$InserMessageWithoutAttachment>
      watchMutation$InserMessageWithoutAttachment(
              WatchOptions$Mutation$InserMessageWithoutAttachment options) =>
          this.watchMutation(options);
}

class Mutation$InserMessageWithoutAttachment$insert_messages_one {
  Mutation$InserMessageWithoutAttachment$insert_messages_one({
    required this.id,
    this.$__typename = 'messages',
  });

  factory Mutation$InserMessageWithoutAttachment$insert_messages_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$InserMessageWithoutAttachment$insert_messages_one(
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
    if (other is! Mutation$InserMessageWithoutAttachment$insert_messages_one ||
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

extension UtilityExtension$Mutation$InserMessageWithoutAttachment$insert_messages_one
    on Mutation$InserMessageWithoutAttachment$insert_messages_one {
  CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<
          Mutation$InserMessageWithoutAttachment$insert_messages_one>
      get copyWith =>
          CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<
    TRes> {
  factory CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one(
    Mutation$InserMessageWithoutAttachment$insert_messages_one instance,
    TRes Function(Mutation$InserMessageWithoutAttachment$insert_messages_one)
        then,
  ) = _CopyWithImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one;

  factory CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one<
        TRes>
    implements
        CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<
            TRes> {
  _CopyWithImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one(
    this._instance,
    this._then,
  );

  final Mutation$InserMessageWithoutAttachment$insert_messages_one _instance;

  final TRes Function(
      Mutation$InserMessageWithoutAttachment$insert_messages_one) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$InserMessageWithoutAttachment$insert_messages_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one<
        TRes>
    implements
        CopyWith$Mutation$InserMessageWithoutAttachment$insert_messages_one<
            TRes> {
  _CopyWithStubImpl$Mutation$InserMessageWithoutAttachment$insert_messages_one(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$GetConversationStreamWithMessage {
  factory Variables$Subscription$GetConversationStreamWithMessage(
          {required String employee_id}) =>
      Variables$Subscription$GetConversationStreamWithMessage._({
        r'employee_id': employee_id,
      });

  Variables$Subscription$GetConversationStreamWithMessage._(this._$data);

  factory Variables$Subscription$GetConversationStreamWithMessage.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$employee_id = data['employee_id'];
    result$data['employee_id'] = (l$employee_id as String);
    return Variables$Subscription$GetConversationStreamWithMessage._(
        result$data);
  }

  Map<String, dynamic> _$data;

  String get employee_id => (_$data['employee_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$employee_id = employee_id;
    result$data['employee_id'] = l$employee_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$GetConversationStreamWithMessage<
          Variables$Subscription$GetConversationStreamWithMessage>
      get copyWith =>
          CopyWith$Variables$Subscription$GetConversationStreamWithMessage(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$GetConversationStreamWithMessage ||
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

abstract class CopyWith$Variables$Subscription$GetConversationStreamWithMessage<
    TRes> {
  factory CopyWith$Variables$Subscription$GetConversationStreamWithMessage(
    Variables$Subscription$GetConversationStreamWithMessage instance,
    TRes Function(Variables$Subscription$GetConversationStreamWithMessage) then,
  ) = _CopyWithImpl$Variables$Subscription$GetConversationStreamWithMessage;

  factory CopyWith$Variables$Subscription$GetConversationStreamWithMessage.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$GetConversationStreamWithMessage;

  TRes call({String? employee_id});
}

class _CopyWithImpl$Variables$Subscription$GetConversationStreamWithMessage<
        TRes>
    implements
        CopyWith$Variables$Subscription$GetConversationStreamWithMessage<TRes> {
  _CopyWithImpl$Variables$Subscription$GetConversationStreamWithMessage(
    this._instance,
    this._then,
  );

  final Variables$Subscription$GetConversationStreamWithMessage _instance;

  final TRes Function(Variables$Subscription$GetConversationStreamWithMessage)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? employee_id = _undefined}) =>
      _then(Variables$Subscription$GetConversationStreamWithMessage._({
        ..._instance._$data,
        if (employee_id != _undefined && employee_id != null)
          'employee_id': (employee_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$GetConversationStreamWithMessage<
        TRes>
    implements
        CopyWith$Variables$Subscription$GetConversationStreamWithMessage<TRes> {
  _CopyWithStubImpl$Variables$Subscription$GetConversationStreamWithMessage(
      this._res);

  TRes _res;

  call({String? employee_id}) => _res;
}

class Subscription$GetConversationStreamWithMessage {
  Subscription$GetConversationStreamWithMessage({required this.conversations});

  factory Subscription$GetConversationStreamWithMessage.fromJson(
      Map<String, dynamic> json) {
    final l$conversations = json['conversations'];
    return Subscription$GetConversationStreamWithMessage(
        conversations: (l$conversations as List<dynamic>)
            .map((e) =>
                Subscription$GetConversationStreamWithMessage$conversations
                    .fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  final List<Subscription$GetConversationStreamWithMessage$conversations>
      conversations;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$conversations = conversations;
    _resultData['conversations'] =
        l$conversations.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$conversations = conversations;
    return Object.hashAll([Object.hashAll(l$conversations.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetConversationStreamWithMessage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$conversations = conversations;
    final lOther$conversations = other.conversations;
    if (l$conversations.length != lOther$conversations.length) {
      return false;
    }
    for (int i = 0; i < l$conversations.length; i++) {
      final l$conversations$entry = l$conversations[i];
      final lOther$conversations$entry = lOther$conversations[i];
      if (l$conversations$entry != lOther$conversations$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GetConversationStreamWithMessage
    on Subscription$GetConversationStreamWithMessage {
  CopyWith$Subscription$GetConversationStreamWithMessage<
          Subscription$GetConversationStreamWithMessage>
      get copyWith => CopyWith$Subscription$GetConversationStreamWithMessage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage<TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage(
    Subscription$GetConversationStreamWithMessage instance,
    TRes Function(Subscription$GetConversationStreamWithMessage) then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage;

  factory CopyWith$Subscription$GetConversationStreamWithMessage.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage;

  TRes call(
      {List<Subscription$GetConversationStreamWithMessage$conversations>?
          conversations});
  TRes conversations(
      Iterable<Subscription$GetConversationStreamWithMessage$conversations> Function(
              Iterable<
                  CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
                      Subscription$GetConversationStreamWithMessage$conversations>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage<TRes>
    implements CopyWith$Subscription$GetConversationStreamWithMessage<TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage _instance;

  final TRes Function(Subscription$GetConversationStreamWithMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? conversations = _undefined}) =>
      _then(Subscription$GetConversationStreamWithMessage(
          conversations: conversations == _undefined || conversations == null
              ? _instance.conversations
              : (conversations as List<
                  Subscription$GetConversationStreamWithMessage$conversations>)));

  TRes conversations(
          Iterable<Subscription$GetConversationStreamWithMessage$conversations> Function(
                  Iterable<
                      CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
                          Subscription$GetConversationStreamWithMessage$conversations>>)
              _fn) =>
      call(
          conversations: _fn(_instance.conversations.map((e) =>
              CopyWith$Subscription$GetConversationStreamWithMessage$conversations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage<TRes>
    implements CopyWith$Subscription$GetConversationStreamWithMessage<TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage(this._res);

  TRes _res;

  call(
          {List<Subscription$GetConversationStreamWithMessage$conversations>?
              conversations}) =>
      _res;

  conversations(_fn) => _res;
}

const documentNodeSubscriptionGetConversationStreamWithMessage =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetConversationStreamWithMessage'),
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
        name: NameNode(value: 'conversations'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'employee_conversations'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'employee_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'employee_id')),
                      )
                    ]),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: EnumValueNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_group'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'messages'),
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
                name: NameNode(value: 'conversation_id'),
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
                name: NameNode(value: 'is_read'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'message_mobile_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'sender_id'),
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
                name: NameNode(value: 'attachments'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'filename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'file_type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'file_size'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'file_path'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'extension'),
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
                    name: NameNode(value: 'height'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'length'),
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
                    name: NameNode(value: 'mime_type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'updated_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'width'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'samples'),
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
                name: NameNode(value: 'message_statuses'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'status'),
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
            name: NameNode(value: 'employee_conversations'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'employee_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_neq'),
                        value:
                            VariableNode(name: NameNode(value: 'employee_id')),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'employee_id'),
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
Subscription$GetConversationStreamWithMessage
    _parserFn$Subscription$GetConversationStreamWithMessage(
            Map<String, dynamic> data) =>
        Subscription$GetConversationStreamWithMessage.fromJson(data);

class Options$Subscription$GetConversationStreamWithMessage extends graphql
    .SubscriptionOptions<Subscription$GetConversationStreamWithMessage> {
  Options$Subscription$GetConversationStreamWithMessage({
    String? operationName,
    required Variables$Subscription$GetConversationStreamWithMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetConversationStreamWithMessage? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionGetConversationStreamWithMessage,
          parserFn: _parserFn$Subscription$GetConversationStreamWithMessage,
        );
}

class WatchOptions$Subscription$GetConversationStreamWithMessage extends graphql
    .WatchQueryOptions<Subscription$GetConversationStreamWithMessage> {
  WatchOptions$Subscription$GetConversationStreamWithMessage({
    String? operationName,
    required Variables$Subscription$GetConversationStreamWithMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GetConversationStreamWithMessage? typedOptimisticResult,
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
          document: documentNodeSubscriptionGetConversationStreamWithMessage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetConversationStreamWithMessage,
        );
}

class FetchMoreOptions$Subscription$GetConversationStreamWithMessage
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetConversationStreamWithMessage({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$GetConversationStreamWithMessage variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionGetConversationStreamWithMessage,
        );
}

extension ClientExtension$Subscription$GetConversationStreamWithMessage
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetConversationStreamWithMessage>>
      subscribe$GetConversationStreamWithMessage(
              Options$Subscription$GetConversationStreamWithMessage options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$GetConversationStreamWithMessage>
      watchSubscription$GetConversationStreamWithMessage(
              WatchOptions$Subscription$GetConversationStreamWithMessage
                  options) =>
          this.watchQuery(options);
}

class Subscription$GetConversationStreamWithMessage$conversations {
  Subscription$GetConversationStreamWithMessage$conversations({
    required this.id,
    this.name,
    this.is_group,
    required this.messages,
    required this.employee_conversations,
    this.$__typename = 'conversations',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$is_group = json['is_group'];
    final l$messages = json['messages'];
    final l$employee_conversations = json['employee_conversations'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations(
      id: (l$id as String),
      name: (l$name as String?),
      is_group: (l$is_group as bool?),
      messages: (l$messages as List<dynamic>)
          .map((e) =>
              Subscription$GetConversationStreamWithMessage$conversations$messages
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      employee_conversations: (l$employee_conversations as List<dynamic>)
          .map((e) =>
              Subscription$GetConversationStreamWithMessage$conversations$employee_conversations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final bool? is_group;

  final List<
          Subscription$GetConversationStreamWithMessage$conversations$messages>
      messages;

  final List<
          Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>
      employee_conversations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$is_group = is_group;
    _resultData['is_group'] = l$is_group;
    final l$messages = messages;
    _resultData['messages'] = l$messages.map((e) => e.toJson()).toList();
    final l$employee_conversations = employee_conversations;
    _resultData['employee_conversations'] =
        l$employee_conversations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$is_group = is_group;
    final l$messages = messages;
    final l$employee_conversations = employee_conversations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$is_group,
      Object.hashAll(l$messages.map((v) => v)),
      Object.hashAll(l$employee_conversations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GetConversationStreamWithMessage$conversations ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$is_group = is_group;
    final lOther$is_group = other.is_group;
    if (l$is_group != lOther$is_group) {
      return false;
    }
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages.length != lOther$messages.length) {
      return false;
    }
    for (int i = 0; i < l$messages.length; i++) {
      final l$messages$entry = l$messages[i];
      final lOther$messages$entry = lOther$messages[i];
      if (l$messages$entry != lOther$messages$entry) {
        return false;
      }
    }
    final l$employee_conversations = employee_conversations;
    final lOther$employee_conversations = other.employee_conversations;
    if (l$employee_conversations.length !=
        lOther$employee_conversations.length) {
      return false;
    }
    for (int i = 0; i < l$employee_conversations.length; i++) {
      final l$employee_conversations$entry = l$employee_conversations[i];
      final lOther$employee_conversations$entry =
          lOther$employee_conversations[i];
      if (l$employee_conversations$entry !=
          lOther$employee_conversations$entry) {
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations
    on Subscription$GetConversationStreamWithMessage$conversations {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
          Subscription$GetConversationStreamWithMessage$conversations>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations(
    Subscription$GetConversationStreamWithMessage$conversations instance,
    TRes Function(Subscription$GetConversationStreamWithMessage$conversations)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations;

  TRes call({
    String? id,
    String? name,
    bool? is_group,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages>?
        messages,
    List<Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>?
        employee_conversations,
    String? $__typename,
  });
  TRes messages(
      Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages> Function(
              Iterable<
                  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
                      Subscription$GetConversationStreamWithMessage$conversations$messages>>)
          _fn);
  TRes employee_conversations(
      Iterable<Subscription$GetConversationStreamWithMessage$conversations$employee_conversations> Function(
              Iterable<
                  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
                      Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations _instance;

  final TRes Function(
      Subscription$GetConversationStreamWithMessage$conversations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? is_group = _undefined,
    Object? messages = _undefined,
    Object? employee_conversations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetConversationStreamWithMessage$conversations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        is_group:
            is_group == _undefined ? _instance.is_group : (is_group as bool?),
        messages: messages == _undefined || messages == null
            ? _instance.messages
            : (messages as List<
                Subscription$GetConversationStreamWithMessage$conversations$messages>),
        employee_conversations: employee_conversations == _undefined ||
                employee_conversations == null
            ? _instance.employee_conversations
            : (employee_conversations as List<
                Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes messages(
          Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages> Function(
                  Iterable<
                      CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
                          Subscription$GetConversationStreamWithMessage$conversations$messages>>)
              _fn) =>
      call(
          messages: _fn(_instance.messages.map((e) =>
              CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages(
                e,
                (i) => i,
              ))).toList());

  TRes employee_conversations(
          Iterable<Subscription$GetConversationStreamWithMessage$conversations$employee_conversations> Function(
                  Iterable<
                      CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
                          Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>>)
              _fn) =>
      call(
          employee_conversations: _fn(_instance.employee_conversations.map((e) =>
              CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    bool? is_group,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages>?
        messages,
    List<Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>?
        employee_conversations,
    String? $__typename,
  }) =>
      _res;

  messages(_fn) => _res;

  employee_conversations(_fn) => _res;
}

class Subscription$GetConversationStreamWithMessage$conversations$messages {
  Subscription$GetConversationStreamWithMessage$conversations$messages({
    this.content,
    required this.employee,
    required this.conversation_id,
    required this.id,
    this.is_read,
    this.message_mobile_id,
    required this.sender_id,
    this.created_at,
    required this.attachments,
    required this.message_statuses,
    this.$__typename = 'messages',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations$messages.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$employee = json['employee'];
    final l$conversation_id = json['conversation_id'];
    final l$id = json['id'];
    final l$is_read = json['is_read'];
    final l$message_mobile_id = json['message_mobile_id'];
    final l$sender_id = json['sender_id'];
    final l$created_at = json['created_at'];
    final l$attachments = json['attachments'];
    final l$message_statuses = json['message_statuses'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations$messages(
      content: (l$content as String?),
      employee:
          Subscription$GetConversationStreamWithMessage$conversations$messages$employee
              .fromJson((l$employee as Map<String, dynamic>)),
      conversation_id: (l$conversation_id as String),
      id: (l$id as String),
      is_read: (l$is_read as bool?),
      message_mobile_id: (l$message_mobile_id as String?),
      sender_id: (l$sender_id as String),
      created_at: (l$created_at as String?),
      attachments: (l$attachments as List<dynamic>)
          .map((e) =>
              Subscription$GetConversationStreamWithMessage$conversations$messages$attachments
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      message_statuses: (l$message_statuses as List<dynamic>)
          .map((e) =>
              Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String? content;

  final Subscription$GetConversationStreamWithMessage$conversations$messages$employee
      employee;

  final String conversation_id;

  final String id;

  final bool? is_read;

  final String? message_mobile_id;

  final String sender_id;

  final String? created_at;

  final List<
          Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>
      attachments;

  final List<
          Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>
      message_statuses;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$content = content;
    _resultData['content'] = l$content;
    final l$employee = employee;
    _resultData['employee'] = l$employee.toJson();
    final l$conversation_id = conversation_id;
    _resultData['conversation_id'] = l$conversation_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$is_read = is_read;
    _resultData['is_read'] = l$is_read;
    final l$message_mobile_id = message_mobile_id;
    _resultData['message_mobile_id'] = l$message_mobile_id;
    final l$sender_id = sender_id;
    _resultData['sender_id'] = l$sender_id;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$attachments = attachments;
    _resultData['attachments'] = l$attachments.map((e) => e.toJson()).toList();
    final l$message_statuses = message_statuses;
    _resultData['message_statuses'] =
        l$message_statuses.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$employee = employee;
    final l$conversation_id = conversation_id;
    final l$id = id;
    final l$is_read = is_read;
    final l$message_mobile_id = message_mobile_id;
    final l$sender_id = sender_id;
    final l$created_at = created_at;
    final l$attachments = attachments;
    final l$message_statuses = message_statuses;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$content,
      l$employee,
      l$conversation_id,
      l$id,
      l$is_read,
      l$message_mobile_id,
      l$sender_id,
      l$created_at,
      Object.hashAll(l$attachments.map((v) => v)),
      Object.hashAll(l$message_statuses.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$GetConversationStreamWithMessage$conversations$messages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$employee = employee;
    final lOther$employee = other.employee;
    if (l$employee != lOther$employee) {
      return false;
    }
    final l$conversation_id = conversation_id;
    final lOther$conversation_id = other.conversation_id;
    if (l$conversation_id != lOther$conversation_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$is_read = is_read;
    final lOther$is_read = other.is_read;
    if (l$is_read != lOther$is_read) {
      return false;
    }
    final l$message_mobile_id = message_mobile_id;
    final lOther$message_mobile_id = other.message_mobile_id;
    if (l$message_mobile_id != lOther$message_mobile_id) {
      return false;
    }
    final l$sender_id = sender_id;
    final lOther$sender_id = other.sender_id;
    if (l$sender_id != lOther$sender_id) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$attachments = attachments;
    final lOther$attachments = other.attachments;
    if (l$attachments.length != lOther$attachments.length) {
      return false;
    }
    for (int i = 0; i < l$attachments.length; i++) {
      final l$attachments$entry = l$attachments[i];
      final lOther$attachments$entry = lOther$attachments[i];
      if (l$attachments$entry != lOther$attachments$entry) {
        return false;
      }
    }
    final l$message_statuses = message_statuses;
    final lOther$message_statuses = other.message_statuses;
    if (l$message_statuses.length != lOther$message_statuses.length) {
      return false;
    }
    for (int i = 0; i < l$message_statuses.length; i++) {
      final l$message_statuses$entry = l$message_statuses[i];
      final lOther$message_statuses$entry = lOther$message_statuses[i];
      if (l$message_statuses$entry != lOther$message_statuses$entry) {
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations$messages
    on Subscription$GetConversationStreamWithMessage$conversations$messages {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
          Subscription$GetConversationStreamWithMessage$conversations$messages>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages(
    Subscription$GetConversationStreamWithMessage$conversations$messages
        instance,
    TRes Function(
            Subscription$GetConversationStreamWithMessage$conversations$messages)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages;

  TRes call({
    String? content,
    Subscription$GetConversationStreamWithMessage$conversations$messages$employee?
        employee,
    String? conversation_id,
    String? id,
    bool? is_read,
    String? message_mobile_id,
    String? sender_id,
    String? created_at,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>?
        attachments,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>?
        message_statuses,
    String? $__typename,
  });
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
      TRes> get employee;
  TRes attachments(
      Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages$attachments> Function(
              Iterable<
                  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
                      Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>>)
          _fn);
  TRes message_statuses(
      Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses> Function(
              Iterable<
                  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
                      Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations$messages
      _instance;

  final TRes Function(
          Subscription$GetConversationStreamWithMessage$conversations$messages)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? content = _undefined,
    Object? employee = _undefined,
    Object? conversation_id = _undefined,
    Object? id = _undefined,
    Object? is_read = _undefined,
    Object? message_mobile_id = _undefined,
    Object? sender_id = _undefined,
    Object? created_at = _undefined,
    Object? attachments = _undefined,
    Object? message_statuses = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$GetConversationStreamWithMessage$conversations$messages(
        content:
            content == _undefined ? _instance.content : (content as String?),
        employee: employee == _undefined || employee == null
            ? _instance.employee
            : (employee
                as Subscription$GetConversationStreamWithMessage$conversations$messages$employee),
        conversation_id:
            conversation_id == _undefined || conversation_id == null
                ? _instance.conversation_id
                : (conversation_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        is_read: is_read == _undefined ? _instance.is_read : (is_read as bool?),
        message_mobile_id: message_mobile_id == _undefined
            ? _instance.message_mobile_id
            : (message_mobile_id as String?),
        sender_id: sender_id == _undefined || sender_id == null
            ? _instance.sender_id
            : (sender_id as String),
        created_at: created_at == _undefined
            ? _instance.created_at
            : (created_at as String?),
        attachments: attachments == _undefined || attachments == null
            ? _instance.attachments
            : (attachments as List<
                Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>),
        message_statuses: message_statuses == _undefined ||
                message_statuses == null
            ? _instance.message_statuses
            : (message_statuses as List<
                Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
      TRes> get employee {
    final local$employee = _instance.employee;
    return CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
        local$employee, (e) => call(employee: e));
  }

  TRes attachments(
          Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages$attachments> Function(
                  Iterable<
                      CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
                          Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>>)
              _fn) =>
      call(
          attachments: _fn(_instance.attachments.map((e) =>
              CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
                e,
                (i) => i,
              ))).toList());

  TRes message_statuses(
          Iterable<Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses> Function(
                  Iterable<
                      CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
                          Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>>)
              _fn) =>
      call(
          message_statuses: _fn(_instance.message_statuses.map((e) =>
              CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages(
      this._res);

  TRes _res;

  call({
    String? content,
    Subscription$GetConversationStreamWithMessage$conversations$messages$employee?
        employee,
    String? conversation_id,
    String? id,
    bool? is_read,
    String? message_mobile_id,
    String? sender_id,
    String? created_at,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>?
        attachments,
    List<Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>?
        message_statuses,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
          TRes>
      get employee =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee
              .stub(_res);

  attachments(_fn) => _res;

  message_statuses(_fn) => _res;
}

class Subscription$GetConversationStreamWithMessage$conversations$messages$employee {
  Subscription$GetConversationStreamWithMessage$conversations$messages$employee({
    required this.firstname,
    required this.id,
    required this.lastname,
    this.$__typename = 'employees',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations$messages$employee.fromJson(
      Map<String, dynamic> json) {
    final l$firstname = json['firstname'];
    final l$id = json['id'];
    final l$lastname = json['lastname'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
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
    if (other
            is! Subscription$GetConversationStreamWithMessage$conversations$messages$employee ||
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations$messages$employee
    on Subscription$GetConversationStreamWithMessage$conversations$messages$employee {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
          Subscription$GetConversationStreamWithMessage$conversations$messages$employee>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
    Subscription$GetConversationStreamWithMessage$conversations$messages$employee
        instance,
    TRes Function(
            Subscription$GetConversationStreamWithMessage$conversations$messages$employee)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee;

  TRes call({
    String? firstname,
    String? id,
    String? lastname,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations$messages$employee
      _instance;

  final TRes Function(
          Subscription$GetConversationStreamWithMessage$conversations$messages$employee)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstname = _undefined,
    Object? id = _undefined,
    Object? lastname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
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

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$employee<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$employee(
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

class Subscription$GetConversationStreamWithMessage$conversations$messages$attachments {
  Subscription$GetConversationStreamWithMessage$conversations$messages$attachments({
    required this.filename,
    this.file_type,
    this.file_size,
    required this.file_path,
    this.$extension,
    required this.id,
    this.height,
    this.length,
    required this.message_id,
    this.mime_type,
    this.updated_at,
    this.width,
    this.samples,
    this.$__typename = 'attachments',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations$messages$attachments.fromJson(
      Map<String, dynamic> json) {
    final l$filename = json['filename'];
    final l$file_type = json['file_type'];
    final l$file_size = json['file_size'];
    final l$file_path = json['file_path'];
    final l$$extension = json['extension'];
    final l$id = json['id'];
    final l$height = json['height'];
    final l$length = json['length'];
    final l$message_id = json['message_id'];
    final l$mime_type = json['mime_type'];
    final l$updated_at = json['updated_at'];
    final l$width = json['width'];
    final l$samples = json['samples'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
      filename: (l$filename as String),
      file_type: (l$file_type as String?),
      file_size: (l$file_size as String?),
      file_path: (l$file_path as String),
      $extension: (l$$extension as String?),
      id: (l$id as String),
      height: (l$height as String?),
      length: (l$length as String?),
      message_id: (l$message_id as String),
      mime_type: (l$mime_type as String?),
      updated_at: (l$updated_at as String?),
      width: (l$width as String?),
      samples: (l$samples as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String filename;

  final String? file_type;

  final String? file_size;

  final String file_path;

  final String? $extension;

  final String id;

  final String? height;

  final String? length;

  final String message_id;

  final String? mime_type;

  final String? updated_at;

  final String? width;

  final String? samples;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$filename = filename;
    _resultData['filename'] = l$filename;
    final l$file_type = file_type;
    _resultData['file_type'] = l$file_type;
    final l$file_size = file_size;
    _resultData['file_size'] = l$file_size;
    final l$file_path = file_path;
    _resultData['file_path'] = l$file_path;
    final l$$extension = $extension;
    _resultData['extension'] = l$$extension;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$length = length;
    _resultData['length'] = l$length;
    final l$message_id = message_id;
    _resultData['message_id'] = l$message_id;
    final l$mime_type = mime_type;
    _resultData['mime_type'] = l$mime_type;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$width = width;
    _resultData['width'] = l$width;
    final l$samples = samples;
    _resultData['samples'] = l$samples;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$filename = filename;
    final l$file_type = file_type;
    final l$file_size = file_size;
    final l$file_path = file_path;
    final l$$extension = $extension;
    final l$id = id;
    final l$height = height;
    final l$length = length;
    final l$message_id = message_id;
    final l$mime_type = mime_type;
    final l$updated_at = updated_at;
    final l$width = width;
    final l$samples = samples;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$filename,
      l$file_type,
      l$file_size,
      l$file_path,
      l$$extension,
      l$id,
      l$height,
      l$length,
      l$message_id,
      l$mime_type,
      l$updated_at,
      l$width,
      l$samples,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$GetConversationStreamWithMessage$conversations$messages$attachments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$filename = filename;
    final lOther$filename = other.filename;
    if (l$filename != lOther$filename) {
      return false;
    }
    final l$file_type = file_type;
    final lOther$file_type = other.file_type;
    if (l$file_type != lOther$file_type) {
      return false;
    }
    final l$file_size = file_size;
    final lOther$file_size = other.file_size;
    if (l$file_size != lOther$file_size) {
      return false;
    }
    final l$file_path = file_path;
    final lOther$file_path = other.file_path;
    if (l$file_path != lOther$file_path) {
      return false;
    }
    final l$$extension = $extension;
    final lOther$$extension = other.$extension;
    if (l$$extension != lOther$$extension) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
      return false;
    }
    final l$length = length;
    final lOther$length = other.length;
    if (l$length != lOther$length) {
      return false;
    }
    final l$message_id = message_id;
    final lOther$message_id = other.message_id;
    if (l$message_id != lOther$message_id) {
      return false;
    }
    final l$mime_type = mime_type;
    final lOther$mime_type = other.mime_type;
    if (l$mime_type != lOther$mime_type) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$width = width;
    final lOther$width = other.width;
    if (l$width != lOther$width) {
      return false;
    }
    final l$samples = samples;
    final lOther$samples = other.samples;
    if (l$samples != lOther$samples) {
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments
    on Subscription$GetConversationStreamWithMessage$conversations$messages$attachments {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
          Subscription$GetConversationStreamWithMessage$conversations$messages$attachments>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
    Subscription$GetConversationStreamWithMessage$conversations$messages$attachments
        instance,
    TRes Function(
            Subscription$GetConversationStreamWithMessage$conversations$messages$attachments)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments;

  TRes call({
    String? filename,
    String? file_type,
    String? file_size,
    String? file_path,
    String? $extension,
    String? id,
    String? height,
    String? length,
    String? message_id,
    String? mime_type,
    String? updated_at,
    String? width,
    String? samples,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations$messages$attachments
      _instance;

  final TRes Function(
          Subscription$GetConversationStreamWithMessage$conversations$messages$attachments)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? filename = _undefined,
    Object? file_type = _undefined,
    Object? file_size = _undefined,
    Object? file_path = _undefined,
    Object? $extension = _undefined,
    Object? id = _undefined,
    Object? height = _undefined,
    Object? length = _undefined,
    Object? message_id = _undefined,
    Object? mime_type = _undefined,
    Object? updated_at = _undefined,
    Object? width = _undefined,
    Object? samples = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
        filename: filename == _undefined || filename == null
            ? _instance.filename
            : (filename as String),
        file_type: file_type == _undefined
            ? _instance.file_type
            : (file_type as String?),
        file_size: file_size == _undefined
            ? _instance.file_size
            : (file_size as String?),
        file_path: file_path == _undefined || file_path == null
            ? _instance.file_path
            : (file_path as String),
        $extension: $extension == _undefined
            ? _instance.$extension
            : ($extension as String?),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        height: height == _undefined ? _instance.height : (height as String?),
        length: length == _undefined ? _instance.length : (length as String?),
        message_id: message_id == _undefined || message_id == null
            ? _instance.message_id
            : (message_id as String),
        mime_type: mime_type == _undefined
            ? _instance.mime_type
            : (mime_type as String?),
        updated_at: updated_at == _undefined
            ? _instance.updated_at
            : (updated_at as String?),
        width: width == _undefined ? _instance.width : (width as String?),
        samples:
            samples == _undefined ? _instance.samples : (samples as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$attachments(
      this._res);

  TRes _res;

  call({
    String? filename,
    String? file_type,
    String? file_size,
    String? file_path,
    String? $extension,
    String? id,
    String? height,
    String? length,
    String? message_id,
    String? mime_type,
    String? updated_at,
    String? width,
    String? samples,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses {
  Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses({
    this.status,
    required this.employee_id,
    this.$__typename = 'message_statuses',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses.fromJson(
      Map<String, dynamic> json) {
    final l$status = json['status'];
    final l$employee_id = json['employee_id'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
      status: (l$status as String?),
      employee_id: (l$employee_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String? status;

  final String employee_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = l$status;
    final l$employee_id = employee_id;
    _resultData['employee_id'] = l$employee_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$employee_id = employee_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$status,
      l$employee_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses
    on Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
          Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
    Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses
        instance,
    TRes Function(
            Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses;

  TRes call({
    String? status,
    String? employee_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses
      _instance;

  final TRes Function(
          Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? employee_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
        status: status == _undefined ? _instance.status : (status as String?),
        employee_id: employee_id == _undefined || employee_id == null
            ? _instance.employee_id
            : (employee_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$messages$message_statuses(
      this._res);

  TRes _res;

  call({
    String? status,
    String? employee_id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetConversationStreamWithMessage$conversations$employee_conversations {
  Subscription$GetConversationStreamWithMessage$conversations$employee_conversations({
    required this.employee_id,
    this.$__typename = 'employee_conversation',
  });

  factory Subscription$GetConversationStreamWithMessage$conversations$employee_conversations.fromJson(
      Map<String, dynamic> json) {
    final l$employee_id = json['employee_id'];
    final l$$__typename = json['__typename'];
    return Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
      employee_id: (l$employee_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String employee_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$employee_id = employee_id;
    _resultData['employee_id'] = l$employee_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$employee_id = employee_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$employee_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Subscription$GetConversationStreamWithMessage$conversations$employee_conversations ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$employee_id = employee_id;
    final lOther$employee_id = other.employee_id;
    if (l$employee_id != lOther$employee_id) {
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

extension UtilityExtension$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations
    on Subscription$GetConversationStreamWithMessage$conversations$employee_conversations {
  CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
          Subscription$GetConversationStreamWithMessage$conversations$employee_conversations>
      get copyWith =>
          CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
    TRes> {
  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
    Subscription$GetConversationStreamWithMessage$conversations$employee_conversations
        instance,
    TRes Function(
            Subscription$GetConversationStreamWithMessage$conversations$employee_conversations)
        then,
  ) = _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations;

  factory CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations;

  TRes call({
    String? employee_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
            TRes> {
  _CopyWithImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
    this._instance,
    this._then,
  );

  final Subscription$GetConversationStreamWithMessage$conversations$employee_conversations
      _instance;

  final TRes Function(
          Subscription$GetConversationStreamWithMessage$conversations$employee_conversations)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? employee_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
        employee_id: employee_id == _undefined || employee_id == null
            ? _instance.employee_id
            : (employee_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
        TRes>
    implements
        CopyWith$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations<
            TRes> {
  _CopyWithStubImpl$Subscription$GetConversationStreamWithMessage$conversations$employee_conversations(
      this._res);

  TRes _res;

  call({
    String? employee_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateMessageStatus {
  factory Variables$Mutation$UpdateMessageStatus({
    required List<String> id,
    required String status,
  }) =>
      Variables$Mutation$UpdateMessageStatus._({
        r'id': id,
        r'status': status,
      });

  Variables$Mutation$UpdateMessageStatus._(this._$data);

  factory Variables$Mutation$UpdateMessageStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] =
        (l$id as List<dynamic>).map((e) => (e as String)).toList();
    final l$status = data['status'];
    result$data['status'] = (l$status as String);
    return Variables$Mutation$UpdateMessageStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get id => (_$data['id'] as List<String>);

  String get status => (_$data['status'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id.map((e) => e).toList();
    final l$status = status;
    result$data['status'] = l$status;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMessageStatus<
          Variables$Mutation$UpdateMessageStatus>
      get copyWith => CopyWith$Variables$Mutation$UpdateMessageStatus(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateMessageStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id.length != lOther$id.length) {
      return false;
    }
    for (int i = 0; i < l$id.length; i++) {
      final l$id$entry = l$id[i];
      final lOther$id$entry = lOther$id[i];
      if (l$id$entry != lOther$id$entry) {
        return false;
      }
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    return Object.hashAll([
      Object.hashAll(l$id.map((v) => v)),
      l$status,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateMessageStatus<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMessageStatus(
    Variables$Mutation$UpdateMessageStatus instance,
    TRes Function(Variables$Mutation$UpdateMessageStatus) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMessageStatus;

  factory CopyWith$Variables$Mutation$UpdateMessageStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMessageStatus;

  TRes call({
    List<String>? id,
    String? status,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateMessageStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateMessageStatus<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMessageStatus(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateMessageStatus _instance;

  final TRes Function(Variables$Mutation$UpdateMessageStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateMessageStatus._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as List<String>),
        if (status != _undefined && status != null)
          'status': (status as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMessageStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateMessageStatus<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMessageStatus(this._res);

  TRes _res;

  call({
    List<String>? id,
    String? status,
  }) =>
      _res;
}

class Mutation$UpdateMessageStatus {
  Mutation$UpdateMessageStatus({
    required this.updateMessageStatus,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$UpdateMessageStatus.fromJson(Map<String, dynamic> json) {
    final l$updateMessageStatus = json['updateMessageStatus'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMessageStatus(
      updateMessageStatus:
          Mutation$UpdateMessageStatus$updateMessageStatus.fromJson(
              (l$updateMessageStatus as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMessageStatus$updateMessageStatus updateMessageStatus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMessageStatus = updateMessageStatus;
    _resultData['updateMessageStatus'] = l$updateMessageStatus.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMessageStatus = updateMessageStatus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateMessageStatus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMessageStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMessageStatus = updateMessageStatus;
    final lOther$updateMessageStatus = other.updateMessageStatus;
    if (l$updateMessageStatus != lOther$updateMessageStatus) {
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

extension UtilityExtension$Mutation$UpdateMessageStatus
    on Mutation$UpdateMessageStatus {
  CopyWith$Mutation$UpdateMessageStatus<Mutation$UpdateMessageStatus>
      get copyWith => CopyWith$Mutation$UpdateMessageStatus(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMessageStatus<TRes> {
  factory CopyWith$Mutation$UpdateMessageStatus(
    Mutation$UpdateMessageStatus instance,
    TRes Function(Mutation$UpdateMessageStatus) then,
  ) = _CopyWithImpl$Mutation$UpdateMessageStatus;

  factory CopyWith$Mutation$UpdateMessageStatus.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMessageStatus;

  TRes call({
    Mutation$UpdateMessageStatus$updateMessageStatus? updateMessageStatus,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes>
      get updateMessageStatus;
}

class _CopyWithImpl$Mutation$UpdateMessageStatus<TRes>
    implements CopyWith$Mutation$UpdateMessageStatus<TRes> {
  _CopyWithImpl$Mutation$UpdateMessageStatus(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMessageStatus _instance;

  final TRes Function(Mutation$UpdateMessageStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMessageStatus = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMessageStatus(
        updateMessageStatus:
            updateMessageStatus == _undefined || updateMessageStatus == null
                ? _instance.updateMessageStatus
                : (updateMessageStatus
                    as Mutation$UpdateMessageStatus$updateMessageStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes>
      get updateMessageStatus {
    final local$updateMessageStatus = _instance.updateMessageStatus;
    return CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus(
        local$updateMessageStatus, (e) => call(updateMessageStatus: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateMessageStatus<TRes>
    implements CopyWith$Mutation$UpdateMessageStatus<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMessageStatus(this._res);

  TRes _res;

  call({
    Mutation$UpdateMessageStatus$updateMessageStatus? updateMessageStatus,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes>
      get updateMessageStatus =>
          CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus.stub(_res);
}

const documentNodeMutationUpdateMessageStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateMessageStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'UUID'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
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
        name: NameNode(value: 'updateMessageStatus'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'messageIds'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'state'),
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
Mutation$UpdateMessageStatus _parserFn$Mutation$UpdateMessageStatus(
        Map<String, dynamic> data) =>
    Mutation$UpdateMessageStatus.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMessageStatus = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateMessageStatus?,
);

class Options$Mutation$UpdateMessageStatus
    extends graphql.MutationOptions<Mutation$UpdateMessageStatus> {
  Options$Mutation$UpdateMessageStatus({
    String? operationName,
    required Variables$Mutation$UpdateMessageStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMessageStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMessageStatus? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMessageStatus>? update,
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
                        : _parserFn$Mutation$UpdateMessageStatus(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMessageStatus,
          parserFn: _parserFn$Mutation$UpdateMessageStatus,
        );

  final OnMutationCompleted$Mutation$UpdateMessageStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateMessageStatus
    extends graphql.WatchQueryOptions<Mutation$UpdateMessageStatus> {
  WatchOptions$Mutation$UpdateMessageStatus({
    String? operationName,
    required Variables$Mutation$UpdateMessageStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMessageStatus? typedOptimisticResult,
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
          document: documentNodeMutationUpdateMessageStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateMessageStatus,
        );
}

extension ClientExtension$Mutation$UpdateMessageStatus
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMessageStatus>>
      mutate$UpdateMessageStatus(
              Options$Mutation$UpdateMessageStatus options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateMessageStatus>
      watchMutation$UpdateMessageStatus(
              WatchOptions$Mutation$UpdateMessageStatus options) =>
          this.watchMutation(options);
}

class Mutation$UpdateMessageStatus$updateMessageStatus {
  Mutation$UpdateMessageStatus$updateMessageStatus({
    required this.state,
    this.$__typename = 'MessageStatusOutput',
  });

  factory Mutation$UpdateMessageStatus$updateMessageStatus.fromJson(
      Map<String, dynamic> json) {
    final l$state = json['state'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMessageStatus$updateMessageStatus(
      state: (l$state as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String state;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$state = state;
    _resultData['state'] = l$state;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$state = state;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$state,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMessageStatus$updateMessageStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
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

extension UtilityExtension$Mutation$UpdateMessageStatus$updateMessageStatus
    on Mutation$UpdateMessageStatus$updateMessageStatus {
  CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<
          Mutation$UpdateMessageStatus$updateMessageStatus>
      get copyWith => CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes> {
  factory CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus(
    Mutation$UpdateMessageStatus$updateMessageStatus instance,
    TRes Function(Mutation$UpdateMessageStatus$updateMessageStatus) then,
  ) = _CopyWithImpl$Mutation$UpdateMessageStatus$updateMessageStatus;

  factory CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMessageStatus$updateMessageStatus;

  TRes call({
    String? state,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateMessageStatus$updateMessageStatus<TRes>
    implements CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes> {
  _CopyWithImpl$Mutation$UpdateMessageStatus$updateMessageStatus(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMessageStatus$updateMessageStatus _instance;

  final TRes Function(Mutation$UpdateMessageStatus$updateMessageStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? state = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMessageStatus$updateMessageStatus(
        state: state == _undefined || state == null
            ? _instance.state
            : (state as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateMessageStatus$updateMessageStatus<TRes>
    implements CopyWith$Mutation$UpdateMessageStatus$updateMessageStatus<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMessageStatus$updateMessageStatus(this._res);

  TRes _res;

  call({
    String? state,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateGroup {
  factory Variables$Mutation$CreateGroup({
    String? name,
    required List<Input$employee_conversation_insert_input> members,
  }) =>
      Variables$Mutation$CreateGroup._({
        if (name != null) r'name': name,
        r'members': members,
      });

  Variables$Mutation$CreateGroup._(this._$data);

  factory Variables$Mutation$CreateGroup.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    final l$members = data['members'];
    result$data['members'] = (l$members as List<dynamic>)
        .map((e) => Input$employee_conversation_insert_input.fromJson(
            (e as Map<String, dynamic>)))
        .toList();
    return Variables$Mutation$CreateGroup._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  List<Input$employee_conversation_insert_input> get members =>
      (_$data['members'] as List<Input$employee_conversation_insert_input>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    final l$members = members;
    result$data['members'] = l$members.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateGroup<Variables$Mutation$CreateGroup>
      get copyWith => CopyWith$Variables$Mutation$CreateGroup(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateGroup ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$members = members;
    final lOther$members = other.members;
    if (l$members.length != lOther$members.length) {
      return false;
    }
    for (int i = 0; i < l$members.length; i++) {
      final l$members$entry = l$members[i];
      final lOther$members$entry = lOther$members[i];
      if (l$members$entry != lOther$members$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$members = members;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      Object.hashAll(l$members.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateGroup<TRes> {
  factory CopyWith$Variables$Mutation$CreateGroup(
    Variables$Mutation$CreateGroup instance,
    TRes Function(Variables$Mutation$CreateGroup) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateGroup;

  factory CopyWith$Variables$Mutation$CreateGroup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateGroup;

  TRes call({
    String? name,
    List<Input$employee_conversation_insert_input>? members,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateGroup<TRes>
    implements CopyWith$Variables$Mutation$CreateGroup<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateGroup(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateGroup _instance;

  final TRes Function(Variables$Mutation$CreateGroup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? members = _undefined,
  }) =>
      _then(Variables$Mutation$CreateGroup._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (members != _undefined && members != null)
          'members':
              (members as List<Input$employee_conversation_insert_input>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateGroup<TRes>
    implements CopyWith$Variables$Mutation$CreateGroup<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateGroup(this._res);

  TRes _res;

  call({
    String? name,
    List<Input$employee_conversation_insert_input>? members,
  }) =>
      _res;
}

class Mutation$CreateGroup {
  Mutation$CreateGroup({
    this.insert_conversations_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$CreateGroup.fromJson(Map<String, dynamic> json) {
    final l$insert_conversations_one = json['insert_conversations_one'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGroup(
      insert_conversations_one: l$insert_conversations_one == null
          ? null
          : Mutation$CreateGroup$insert_conversations_one.fromJson(
              (l$insert_conversations_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateGroup$insert_conversations_one? insert_conversations_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_conversations_one = insert_conversations_one;
    _resultData['insert_conversations_one'] =
        l$insert_conversations_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_conversations_one = insert_conversations_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_conversations_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateGroup || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_conversations_one = insert_conversations_one;
    final lOther$insert_conversations_one = other.insert_conversations_one;
    if (l$insert_conversations_one != lOther$insert_conversations_one) {
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

extension UtilityExtension$Mutation$CreateGroup on Mutation$CreateGroup {
  CopyWith$Mutation$CreateGroup<Mutation$CreateGroup> get copyWith =>
      CopyWith$Mutation$CreateGroup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateGroup<TRes> {
  factory CopyWith$Mutation$CreateGroup(
    Mutation$CreateGroup instance,
    TRes Function(Mutation$CreateGroup) then,
  ) = _CopyWithImpl$Mutation$CreateGroup;

  factory CopyWith$Mutation$CreateGroup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateGroup;

  TRes call({
    Mutation$CreateGroup$insert_conversations_one? insert_conversations_one,
    String? $__typename,
  });
  CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes>
      get insert_conversations_one;
}

class _CopyWithImpl$Mutation$CreateGroup<TRes>
    implements CopyWith$Mutation$CreateGroup<TRes> {
  _CopyWithImpl$Mutation$CreateGroup(
    this._instance,
    this._then,
  );

  final Mutation$CreateGroup _instance;

  final TRes Function(Mutation$CreateGroup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_conversations_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGroup(
        insert_conversations_one: insert_conversations_one == _undefined
            ? _instance.insert_conversations_one
            : (insert_conversations_one
                as Mutation$CreateGroup$insert_conversations_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes>
      get insert_conversations_one {
    final local$insert_conversations_one = _instance.insert_conversations_one;
    return local$insert_conversations_one == null
        ? CopyWith$Mutation$CreateGroup$insert_conversations_one.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateGroup$insert_conversations_one(
            local$insert_conversations_one,
            (e) => call(insert_conversations_one: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateGroup<TRes>
    implements CopyWith$Mutation$CreateGroup<TRes> {
  _CopyWithStubImpl$Mutation$CreateGroup(this._res);

  TRes _res;

  call({
    Mutation$CreateGroup$insert_conversations_one? insert_conversations_one,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes>
      get insert_conversations_one =>
          CopyWith$Mutation$CreateGroup$insert_conversations_one.stub(_res);
}

const documentNodeMutationCreateGroup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateGroup'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(
            value: StringValueNode(
          value: '',
          isBlock: false,
        )),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'members')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'employee_conversation_insert_input'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_conversations_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'is_group'),
                value: BooleanValueNode(value: true),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'employee_conversations'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'data'),
                    value: VariableNode(name: NameNode(value: 'members')),
                  )
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
Mutation$CreateGroup _parserFn$Mutation$CreateGroup(
        Map<String, dynamic> data) =>
    Mutation$CreateGroup.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateGroup = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateGroup?,
);

class Options$Mutation$CreateGroup
    extends graphql.MutationOptions<Mutation$CreateGroup> {
  Options$Mutation$CreateGroup({
    String? operationName,
    required Variables$Mutation$CreateGroup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGroup? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateGroup? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateGroup>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateGroup(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateGroup,
          parserFn: _parserFn$Mutation$CreateGroup,
        );

  final OnMutationCompleted$Mutation$CreateGroup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateGroup
    extends graphql.WatchQueryOptions<Mutation$CreateGroup> {
  WatchOptions$Mutation$CreateGroup({
    String? operationName,
    required Variables$Mutation$CreateGroup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateGroup? typedOptimisticResult,
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
          document: documentNodeMutationCreateGroup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateGroup,
        );
}

extension ClientExtension$Mutation$CreateGroup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateGroup>> mutate$CreateGroup(
          Options$Mutation$CreateGroup options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateGroup> watchMutation$CreateGroup(
          WatchOptions$Mutation$CreateGroup options) =>
      this.watchMutation(options);
}

class Mutation$CreateGroup$insert_conversations_one {
  Mutation$CreateGroup$insert_conversations_one({
    required this.id,
    this.$__typename = 'conversations',
  });

  factory Mutation$CreateGroup$insert_conversations_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateGroup$insert_conversations_one(
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
    if (other is! Mutation$CreateGroup$insert_conversations_one ||
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

extension UtilityExtension$Mutation$CreateGroup$insert_conversations_one
    on Mutation$CreateGroup$insert_conversations_one {
  CopyWith$Mutation$CreateGroup$insert_conversations_one<
          Mutation$CreateGroup$insert_conversations_one>
      get copyWith => CopyWith$Mutation$CreateGroup$insert_conversations_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes> {
  factory CopyWith$Mutation$CreateGroup$insert_conversations_one(
    Mutation$CreateGroup$insert_conversations_one instance,
    TRes Function(Mutation$CreateGroup$insert_conversations_one) then,
  ) = _CopyWithImpl$Mutation$CreateGroup$insert_conversations_one;

  factory CopyWith$Mutation$CreateGroup$insert_conversations_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateGroup$insert_conversations_one;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateGroup$insert_conversations_one<TRes>
    implements CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes> {
  _CopyWithImpl$Mutation$CreateGroup$insert_conversations_one(
    this._instance,
    this._then,
  );

  final Mutation$CreateGroup$insert_conversations_one _instance;

  final TRes Function(Mutation$CreateGroup$insert_conversations_one) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateGroup$insert_conversations_one(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateGroup$insert_conversations_one<TRes>
    implements CopyWith$Mutation$CreateGroup$insert_conversations_one<TRes> {
  _CopyWithStubImpl$Mutation$CreateGroup$insert_conversations_one(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetAllEmployee {
  Query$GetAllEmployee({
    required this.departments,
    this.$__typename = 'query_root',
  });

  factory Query$GetAllEmployee.fromJson(Map<String, dynamic> json) {
    final l$departments = json['departments'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee(
      departments: (l$departments as List<dynamic>)
          .map((e) => Query$GetAllEmployee$departments.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetAllEmployee$departments> departments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$departments = departments;
    _resultData['departments'] = l$departments.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$departments = departments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$departments.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllEmployee || runtimeType != other.runtimeType) {
      return false;
    }
    final l$departments = departments;
    final lOther$departments = other.departments;
    if (l$departments.length != lOther$departments.length) {
      return false;
    }
    for (int i = 0; i < l$departments.length; i++) {
      final l$departments$entry = l$departments[i];
      final lOther$departments$entry = lOther$departments[i];
      if (l$departments$entry != lOther$departments$entry) {
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

extension UtilityExtension$Query$GetAllEmployee on Query$GetAllEmployee {
  CopyWith$Query$GetAllEmployee<Query$GetAllEmployee> get copyWith =>
      CopyWith$Query$GetAllEmployee(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetAllEmployee<TRes> {
  factory CopyWith$Query$GetAllEmployee(
    Query$GetAllEmployee instance,
    TRes Function(Query$GetAllEmployee) then,
  ) = _CopyWithImpl$Query$GetAllEmployee;

  factory CopyWith$Query$GetAllEmployee.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee;

  TRes call({
    List<Query$GetAllEmployee$departments>? departments,
    String? $__typename,
  });
  TRes departments(
      Iterable<Query$GetAllEmployee$departments> Function(
              Iterable<
                  CopyWith$Query$GetAllEmployee$departments<
                      Query$GetAllEmployee$departments>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllEmployee<TRes>
    implements CopyWith$Query$GetAllEmployee<TRes> {
  _CopyWithImpl$Query$GetAllEmployee(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee _instance;

  final TRes Function(Query$GetAllEmployee) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? departments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee(
        departments: departments == _undefined || departments == null
            ? _instance.departments
            : (departments as List<Query$GetAllEmployee$departments>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes departments(
          Iterable<Query$GetAllEmployee$departments> Function(
                  Iterable<
                      CopyWith$Query$GetAllEmployee$departments<
                          Query$GetAllEmployee$departments>>)
              _fn) =>
      call(
          departments: _fn(_instance.departments
              .map((e) => CopyWith$Query$GetAllEmployee$departments(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetAllEmployee<TRes>
    implements CopyWith$Query$GetAllEmployee<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee(this._res);

  TRes _res;

  call({
    List<Query$GetAllEmployee$departments>? departments,
    String? $__typename,
  }) =>
      _res;

  departments(_fn) => _res;
}

const documentNodeQueryGetAllEmployee = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllEmployee'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'departments'),
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
            name: NameNode(value: 'abrev_code'),
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
            name: NameNode(value: 'services'),
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
                name: NameNode(value: 'employees'),
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
Query$GetAllEmployee _parserFn$Query$GetAllEmployee(
        Map<String, dynamic> data) =>
    Query$GetAllEmployee.fromJson(data);
typedef OnQueryComplete$Query$GetAllEmployee = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetAllEmployee?,
);

class Options$Query$GetAllEmployee
    extends graphql.QueryOptions<Query$GetAllEmployee> {
  Options$Query$GetAllEmployee({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllEmployee? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetAllEmployee? onComplete,
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
                    data == null ? null : _parserFn$Query$GetAllEmployee(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetAllEmployee,
          parserFn: _parserFn$Query$GetAllEmployee,
        );

  final OnQueryComplete$Query$GetAllEmployee? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetAllEmployee
    extends graphql.WatchQueryOptions<Query$GetAllEmployee> {
  WatchOptions$Query$GetAllEmployee({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllEmployee? typedOptimisticResult,
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
          document: documentNodeQueryGetAllEmployee,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetAllEmployee,
        );
}

class FetchMoreOptions$Query$GetAllEmployee extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllEmployee(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetAllEmployee,
        );
}

extension ClientExtension$Query$GetAllEmployee on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllEmployee>> query$GetAllEmployee(
          [Options$Query$GetAllEmployee? options]) async =>
      await this.query(options ?? Options$Query$GetAllEmployee());
  graphql.ObservableQuery<Query$GetAllEmployee> watchQuery$GetAllEmployee(
          [WatchOptions$Query$GetAllEmployee? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetAllEmployee());
  void writeQuery$GetAllEmployee({
    required Query$GetAllEmployee data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetAllEmployee)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetAllEmployee? readQuery$GetAllEmployee({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetAllEmployee)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetAllEmployee.fromJson(result);
  }
}

class Query$GetAllEmployee$departments {
  Query$GetAllEmployee$departments({
    required this.id,
    this.abrev_code,
    this.text_content,
    required this.services,
    this.$__typename = 'departments',
  });

  factory Query$GetAllEmployee$departments.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$abrev_code = json['abrev_code'];
    final l$text_content = json['text_content'];
    final l$services = json['services'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee$departments(
      id: (l$id as String),
      abrev_code: (l$abrev_code as String?),
      text_content: l$text_content == null
          ? null
          : Query$GetAllEmployee$departments$text_content.fromJson(
              (l$text_content as Map<String, dynamic>)),
      services: (l$services as List<dynamic>)
          .map((e) => Query$GetAllEmployee$departments$services.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? abrev_code;

  final Query$GetAllEmployee$departments$text_content? text_content;

  final List<Query$GetAllEmployee$departments$services> services;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$abrev_code = abrev_code;
    _resultData['abrev_code'] = l$abrev_code;
    final l$text_content = text_content;
    _resultData['text_content'] = l$text_content?.toJson();
    final l$services = services;
    _resultData['services'] = l$services.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$abrev_code = abrev_code;
    final l$text_content = text_content;
    final l$services = services;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$abrev_code,
      l$text_content,
      Object.hashAll(l$services.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllEmployee$departments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$abrev_code = abrev_code;
    final lOther$abrev_code = other.abrev_code;
    if (l$abrev_code != lOther$abrev_code) {
      return false;
    }
    final l$text_content = text_content;
    final lOther$text_content = other.text_content;
    if (l$text_content != lOther$text_content) {
      return false;
    }
    final l$services = services;
    final lOther$services = other.services;
    if (l$services.length != lOther$services.length) {
      return false;
    }
    for (int i = 0; i < l$services.length; i++) {
      final l$services$entry = l$services[i];
      final lOther$services$entry = lOther$services[i];
      if (l$services$entry != lOther$services$entry) {
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

extension UtilityExtension$Query$GetAllEmployee$departments
    on Query$GetAllEmployee$departments {
  CopyWith$Query$GetAllEmployee$departments<Query$GetAllEmployee$departments>
      get copyWith => CopyWith$Query$GetAllEmployee$departments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllEmployee$departments<TRes> {
  factory CopyWith$Query$GetAllEmployee$departments(
    Query$GetAllEmployee$departments instance,
    TRes Function(Query$GetAllEmployee$departments) then,
  ) = _CopyWithImpl$Query$GetAllEmployee$departments;

  factory CopyWith$Query$GetAllEmployee$departments.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee$departments;

  TRes call({
    String? id,
    String? abrev_code,
    Query$GetAllEmployee$departments$text_content? text_content,
    List<Query$GetAllEmployee$departments$services>? services,
    String? $__typename,
  });
  CopyWith$Query$GetAllEmployee$departments$text_content<TRes> get text_content;
  TRes services(
      Iterable<Query$GetAllEmployee$departments$services> Function(
              Iterable<
                  CopyWith$Query$GetAllEmployee$departments$services<
                      Query$GetAllEmployee$departments$services>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllEmployee$departments<TRes>
    implements CopyWith$Query$GetAllEmployee$departments<TRes> {
  _CopyWithImpl$Query$GetAllEmployee$departments(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee$departments _instance;

  final TRes Function(Query$GetAllEmployee$departments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? abrev_code = _undefined,
    Object? text_content = _undefined,
    Object? services = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee$departments(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        abrev_code: abrev_code == _undefined
            ? _instance.abrev_code
            : (abrev_code as String?),
        text_content: text_content == _undefined
            ? _instance.text_content
            : (text_content as Query$GetAllEmployee$departments$text_content?),
        services: services == _undefined || services == null
            ? _instance.services
            : (services as List<Query$GetAllEmployee$departments$services>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetAllEmployee$departments$text_content<TRes>
      get text_content {
    final local$text_content = _instance.text_content;
    return local$text_content == null
        ? CopyWith$Query$GetAllEmployee$departments$text_content.stub(
            _then(_instance))
        : CopyWith$Query$GetAllEmployee$departments$text_content(
            local$text_content, (e) => call(text_content: e));
  }

  TRes services(
          Iterable<Query$GetAllEmployee$departments$services> Function(
                  Iterable<
                      CopyWith$Query$GetAllEmployee$departments$services<
                          Query$GetAllEmployee$departments$services>>)
              _fn) =>
      call(
          services: _fn(_instance.services
              .map((e) => CopyWith$Query$GetAllEmployee$departments$services(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetAllEmployee$departments<TRes>
    implements CopyWith$Query$GetAllEmployee$departments<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee$departments(this._res);

  TRes _res;

  call({
    String? id,
    String? abrev_code,
    Query$GetAllEmployee$departments$text_content? text_content,
    List<Query$GetAllEmployee$departments$services>? services,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetAllEmployee$departments$text_content<TRes>
      get text_content =>
          CopyWith$Query$GetAllEmployee$departments$text_content.stub(_res);

  services(_fn) => _res;
}

class Query$GetAllEmployee$departments$text_content {
  Query$GetAllEmployee$departments$text_content({
    required this.content,
    this.$__typename = 'text_content',
  });

  factory Query$GetAllEmployee$departments$text_content.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee$departments$text_content(
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
    if (other is! Query$GetAllEmployee$departments$text_content ||
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

extension UtilityExtension$Query$GetAllEmployee$departments$text_content
    on Query$GetAllEmployee$departments$text_content {
  CopyWith$Query$GetAllEmployee$departments$text_content<
          Query$GetAllEmployee$departments$text_content>
      get copyWith => CopyWith$Query$GetAllEmployee$departments$text_content(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllEmployee$departments$text_content<TRes> {
  factory CopyWith$Query$GetAllEmployee$departments$text_content(
    Query$GetAllEmployee$departments$text_content instance,
    TRes Function(Query$GetAllEmployee$departments$text_content) then,
  ) = _CopyWithImpl$Query$GetAllEmployee$departments$text_content;

  factory CopyWith$Query$GetAllEmployee$departments$text_content.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee$departments$text_content;

  TRes call({
    String? content,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllEmployee$departments$text_content<TRes>
    implements CopyWith$Query$GetAllEmployee$departments$text_content<TRes> {
  _CopyWithImpl$Query$GetAllEmployee$departments$text_content(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee$departments$text_content _instance;

  final TRes Function(Query$GetAllEmployee$departments$text_content) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee$departments$text_content(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllEmployee$departments$text_content<TRes>
    implements CopyWith$Query$GetAllEmployee$departments$text_content<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee$departments$text_content(this._res);

  TRes _res;

  call({
    String? content,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetAllEmployee$departments$services {
  Query$GetAllEmployee$departments$services({
    required this.id,
    this.text_content,
    required this.employees,
    this.$__typename = 'services',
  });

  factory Query$GetAllEmployee$departments$services.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$text_content = json['text_content'];
    final l$employees = json['employees'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee$departments$services(
      id: (l$id as String),
      text_content: l$text_content == null
          ? null
          : Query$GetAllEmployee$departments$services$text_content.fromJson(
              (l$text_content as Map<String, dynamic>)),
      employees: (l$employees as List<dynamic>)
          .map((e) =>
              Query$GetAllEmployee$departments$services$employees.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetAllEmployee$departments$services$text_content? text_content;

  final List<Query$GetAllEmployee$departments$services$employees> employees;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text_content = text_content;
    _resultData['text_content'] = l$text_content?.toJson();
    final l$employees = employees;
    _resultData['employees'] = l$employees.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text_content = text_content;
    final l$employees = employees;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$text_content,
      Object.hashAll(l$employees.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetAllEmployee$departments$services ||
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
    final l$employees = employees;
    final lOther$employees = other.employees;
    if (l$employees.length != lOther$employees.length) {
      return false;
    }
    for (int i = 0; i < l$employees.length; i++) {
      final l$employees$entry = l$employees[i];
      final lOther$employees$entry = lOther$employees[i];
      if (l$employees$entry != lOther$employees$entry) {
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

extension UtilityExtension$Query$GetAllEmployee$departments$services
    on Query$GetAllEmployee$departments$services {
  CopyWith$Query$GetAllEmployee$departments$services<
          Query$GetAllEmployee$departments$services>
      get copyWith => CopyWith$Query$GetAllEmployee$departments$services(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllEmployee$departments$services<TRes> {
  factory CopyWith$Query$GetAllEmployee$departments$services(
    Query$GetAllEmployee$departments$services instance,
    TRes Function(Query$GetAllEmployee$departments$services) then,
  ) = _CopyWithImpl$Query$GetAllEmployee$departments$services;

  factory CopyWith$Query$GetAllEmployee$departments$services.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee$departments$services;

  TRes call({
    String? id,
    Query$GetAllEmployee$departments$services$text_content? text_content,
    List<Query$GetAllEmployee$departments$services$employees>? employees,
    String? $__typename,
  });
  CopyWith$Query$GetAllEmployee$departments$services$text_content<TRes>
      get text_content;
  TRes employees(
      Iterable<Query$GetAllEmployee$departments$services$employees> Function(
              Iterable<
                  CopyWith$Query$GetAllEmployee$departments$services$employees<
                      Query$GetAllEmployee$departments$services$employees>>)
          _fn);
}

class _CopyWithImpl$Query$GetAllEmployee$departments$services<TRes>
    implements CopyWith$Query$GetAllEmployee$departments$services<TRes> {
  _CopyWithImpl$Query$GetAllEmployee$departments$services(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee$departments$services _instance;

  final TRes Function(Query$GetAllEmployee$departments$services) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text_content = _undefined,
    Object? employees = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee$departments$services(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        text_content: text_content == _undefined
            ? _instance.text_content
            : (text_content
                as Query$GetAllEmployee$departments$services$text_content?),
        employees: employees == _undefined || employees == null
            ? _instance.employees
            : (employees
                as List<Query$GetAllEmployee$departments$services$employees>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetAllEmployee$departments$services$text_content<TRes>
      get text_content {
    final local$text_content = _instance.text_content;
    return local$text_content == null
        ? CopyWith$Query$GetAllEmployee$departments$services$text_content.stub(
            _then(_instance))
        : CopyWith$Query$GetAllEmployee$departments$services$text_content(
            local$text_content, (e) => call(text_content: e));
  }

  TRes employees(
          Iterable<Query$GetAllEmployee$departments$services$employees> Function(
                  Iterable<
                      CopyWith$Query$GetAllEmployee$departments$services$employees<
                          Query$GetAllEmployee$departments$services$employees>>)
              _fn) =>
      call(
          employees: _fn(_instance.employees.map((e) =>
              CopyWith$Query$GetAllEmployee$departments$services$employees(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetAllEmployee$departments$services<TRes>
    implements CopyWith$Query$GetAllEmployee$departments$services<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee$departments$services(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetAllEmployee$departments$services$text_content? text_content,
    List<Query$GetAllEmployee$departments$services$employees>? employees,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetAllEmployee$departments$services$text_content<TRes>
      get text_content =>
          CopyWith$Query$GetAllEmployee$departments$services$text_content.stub(
              _res);

  employees(_fn) => _res;
}

class Query$GetAllEmployee$departments$services$text_content {
  Query$GetAllEmployee$departments$services$text_content({
    required this.content,
    this.$__typename = 'text_content',
  });

  factory Query$GetAllEmployee$departments$services$text_content.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee$departments$services$text_content(
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
    if (other is! Query$GetAllEmployee$departments$services$text_content ||
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

extension UtilityExtension$Query$GetAllEmployee$departments$services$text_content
    on Query$GetAllEmployee$departments$services$text_content {
  CopyWith$Query$GetAllEmployee$departments$services$text_content<
          Query$GetAllEmployee$departments$services$text_content>
      get copyWith =>
          CopyWith$Query$GetAllEmployee$departments$services$text_content(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllEmployee$departments$services$text_content<
    TRes> {
  factory CopyWith$Query$GetAllEmployee$departments$services$text_content(
    Query$GetAllEmployee$departments$services$text_content instance,
    TRes Function(Query$GetAllEmployee$departments$services$text_content) then,
  ) = _CopyWithImpl$Query$GetAllEmployee$departments$services$text_content;

  factory CopyWith$Query$GetAllEmployee$departments$services$text_content.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee$departments$services$text_content;

  TRes call({
    String? content,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllEmployee$departments$services$text_content<TRes>
    implements
        CopyWith$Query$GetAllEmployee$departments$services$text_content<TRes> {
  _CopyWithImpl$Query$GetAllEmployee$departments$services$text_content(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee$departments$services$text_content _instance;

  final TRes Function(Query$GetAllEmployee$departments$services$text_content)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? content = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee$departments$services$text_content(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllEmployee$departments$services$text_content<
        TRes>
    implements
        CopyWith$Query$GetAllEmployee$departments$services$text_content<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee$departments$services$text_content(
      this._res);

  TRes _res;

  call({
    String? content,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetAllEmployee$departments$services$employees {
  Query$GetAllEmployee$departments$services$employees({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.$__typename = 'employees',
  });

  factory Query$GetAllEmployee$departments$services$employees.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstname = json['firstname'];
    final l$lastname = json['lastname'];
    final l$$__typename = json['__typename'];
    return Query$GetAllEmployee$departments$services$employees(
      id: (l$id as String),
      firstname: (l$firstname as String),
      lastname: (l$lastname as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstname;

  final String lastname;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$firstname = firstname;
    final l$lastname = lastname;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (other is! Query$GetAllEmployee$departments$services$employees ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetAllEmployee$departments$services$employees
    on Query$GetAllEmployee$departments$services$employees {
  CopyWith$Query$GetAllEmployee$departments$services$employees<
          Query$GetAllEmployee$departments$services$employees>
      get copyWith =>
          CopyWith$Query$GetAllEmployee$departments$services$employees(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllEmployee$departments$services$employees<
    TRes> {
  factory CopyWith$Query$GetAllEmployee$departments$services$employees(
    Query$GetAllEmployee$departments$services$employees instance,
    TRes Function(Query$GetAllEmployee$departments$services$employees) then,
  ) = _CopyWithImpl$Query$GetAllEmployee$departments$services$employees;

  factory CopyWith$Query$GetAllEmployee$departments$services$employees.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetAllEmployee$departments$services$employees;

  TRes call({
    String? id,
    String? firstname,
    String? lastname,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllEmployee$departments$services$employees<TRes>
    implements
        CopyWith$Query$GetAllEmployee$departments$services$employees<TRes> {
  _CopyWithImpl$Query$GetAllEmployee$departments$services$employees(
    this._instance,
    this._then,
  );

  final Query$GetAllEmployee$departments$services$employees _instance;

  final TRes Function(Query$GetAllEmployee$departments$services$employees)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstname = _undefined,
    Object? lastname = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllEmployee$departments$services$employees(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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

class _CopyWithStubImpl$Query$GetAllEmployee$departments$services$employees<
        TRes>
    implements
        CopyWith$Query$GetAllEmployee$departments$services$employees<TRes> {
  _CopyWithStubImpl$Query$GetAllEmployee$departments$services$employees(
      this._res);

  TRes _res;

  call({
    String? id,
    String? firstname,
    String? lastname,
    String? $__typename,
  }) =>
      _res;
}
