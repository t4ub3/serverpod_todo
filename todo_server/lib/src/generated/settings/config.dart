/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../settings/config_theme_mode.dart' as _i2;

abstract class Config implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Config._({
    this.id,
    required this.themeMode,
    required this.hideCompleted,
  });

  factory Config({
    int? id,
    required _i2.ConfigThemeMode themeMode,
    required bool hideCompleted,
  }) = _ConfigImpl;

  factory Config.fromJson(Map<String, dynamic> jsonSerialization) {
    return Config(
      id: jsonSerialization['id'] as int?,
      themeMode: _i2.ConfigThemeMode.fromJson(
        (jsonSerialization['themeMode'] as String),
      ),
      hideCompleted: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['hideCompleted'],
      ),
    );
  }

  static final t = ConfigTable();

  static const db = ConfigRepository._();

  @override
  int? id;

  _i2.ConfigThemeMode themeMode;

  bool hideCompleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Config]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Config copyWith({
    int? id,
    _i2.ConfigThemeMode? themeMode,
    bool? hideCompleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Config',
      if (id != null) 'id': id,
      'themeMode': themeMode.toJson(),
      'hideCompleted': hideCompleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Config',
      if (id != null) 'id': id,
      'themeMode': themeMode.toJson(),
      'hideCompleted': hideCompleted,
    };
  }

  static ConfigInclude include() {
    return ConfigInclude._();
  }

  static ConfigIncludeList includeList({
    _i1.WhereExpressionBuilder<ConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigTable>? orderByList,
    ConfigInclude? include,
  }) {
    return ConfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Config.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Config.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConfigImpl extends Config {
  _ConfigImpl({
    int? id,
    required _i2.ConfigThemeMode themeMode,
    required bool hideCompleted,
  }) : super._(
         id: id,
         themeMode: themeMode,
         hideCompleted: hideCompleted,
       );

  /// Returns a shallow copy of this [Config]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Config copyWith({
    Object? id = _Undefined,
    _i2.ConfigThemeMode? themeMode,
    bool? hideCompleted,
  }) {
    return Config(
      id: id is int? ? id : this.id,
      themeMode: themeMode ?? this.themeMode,
      hideCompleted: hideCompleted ?? this.hideCompleted,
    );
  }
}

class ConfigUpdateTable extends _i1.UpdateTable<ConfigTable> {
  ConfigUpdateTable(super.table);

  _i1.ColumnValue<_i2.ConfigThemeMode, _i2.ConfigThemeMode> themeMode(
    _i2.ConfigThemeMode value,
  ) => _i1.ColumnValue(
    table.themeMode,
    value,
  );

  _i1.ColumnValue<bool, bool> hideCompleted(bool value) => _i1.ColumnValue(
    table.hideCompleted,
    value,
  );
}

class ConfigTable extends _i1.Table<int?> {
  ConfigTable({super.tableRelation}) : super(tableName: 'config') {
    updateTable = ConfigUpdateTable(this);
    themeMode = _i1.ColumnEnum(
      'themeMode',
      this,
      _i1.EnumSerialization.byName,
    );
    hideCompleted = _i1.ColumnBool(
      'hideCompleted',
      this,
    );
  }

  late final ConfigUpdateTable updateTable;

  late final _i1.ColumnEnum<_i2.ConfigThemeMode> themeMode;

  late final _i1.ColumnBool hideCompleted;

  @override
  List<_i1.Column> get columns => [
    id,
    themeMode,
    hideCompleted,
  ];
}

class ConfigInclude extends _i1.IncludeObject {
  ConfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Config.t;
}

class ConfigIncludeList extends _i1.IncludeList {
  ConfigIncludeList._({
    _i1.WhereExpressionBuilder<ConfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Config.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Config.t;
}

class ConfigRepository {
  const ConfigRepository._();

  /// Returns a list of [Config]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Config>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Config>(
      where: where?.call(Config.t),
      orderBy: orderBy?.call(Config.t),
      orderByList: orderByList?.call(Config.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Config] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Config?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<ConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Config>(
      where: where?.call(Config.t),
      orderBy: orderBy?.call(Config.t),
      orderByList: orderByList?.call(Config.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Config] by its [id] or null if no such row exists.
  Future<Config?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Config>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Config]s in the list and returns the inserted rows.
  ///
  /// The returned [Config]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Config>> insert(
    _i1.DatabaseSession session,
    List<Config> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Config>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Config] and returns the inserted row.
  ///
  /// The returned [Config] will have its `id` field set.
  Future<Config> insertRow(
    _i1.DatabaseSession session,
    Config row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Config>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Config]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Config>> update(
    _i1.DatabaseSession session,
    List<Config> rows, {
    _i1.ColumnSelections<ConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Config>(
      rows,
      columns: columns?.call(Config.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Config]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Config> updateRow(
    _i1.DatabaseSession session,
    Config row, {
    _i1.ColumnSelections<ConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Config>(
      row,
      columns: columns?.call(Config.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Config] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Config?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ConfigUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Config>(
      id,
      columnValues: columnValues(Config.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Config]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Config>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ConfigUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ConfigTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigTable>? orderBy,
    _i1.OrderByListBuilder<ConfigTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Config>(
      columnValues: columnValues(Config.t.updateTable),
      where: where(Config.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Config.t),
      orderByList: orderByList?.call(Config.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Config]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Config>> delete(
    _i1.DatabaseSession session,
    List<Config> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Config>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Config].
  Future<Config> deleteRow(
    _i1.DatabaseSession session,
    Config row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Config>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Config>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ConfigTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Config>(
      where: where(Config.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ConfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Config>(
      where: where?.call(Config.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Config] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ConfigTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Config>(
      where: where(Config.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
