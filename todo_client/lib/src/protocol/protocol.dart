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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'greetings/greeting.dart' as _i2;
import 'settings/config.dart' as _i3;
import 'settings/config_theme_mode.dart' as _i4;
import 'todos/priority.dart' as _i5;
import 'todos/todo.dart' as _i6;
import 'package:todo_client/src/protocol/settings/config.dart' as _i7;
import 'package:todo_client/src/protocol/todos/todo.dart' as _i8;
import 'package:todo_client/src/protocol/todos/priority.dart' as _i9;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i10;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i11;
export 'greetings/greeting.dart';
export 'settings/config.dart';
export 'settings/config_theme_mode.dart';
export 'todos/priority.dart';
export 'todos/todo.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Config) {
      return _i3.Config.fromJson(data) as T;
    }
    if (t == _i4.ConfigThemeMode) {
      return _i4.ConfigThemeMode.fromJson(data) as T;
    }
    if (t == _i5.Priority) {
      return _i5.Priority.fromJson(data) as T;
    }
    if (t == _i6.Todo) {
      return _i6.Todo.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Config?>()) {
      return (data != null ? _i3.Config.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ConfigThemeMode?>()) {
      return (data != null ? _i4.ConfigThemeMode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Priority?>()) {
      return (data != null ? _i5.Priority.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Todo?>()) {
      return (data != null ? _i6.Todo.fromJson(data) : null) as T;
    }
    if (t == List<_i7.Config>) {
      return (data as List).map((e) => deserialize<_i7.Config>(e)).toList()
          as T;
    }
    if (t == List<_i8.Todo>) {
      return (data as List).map((e) => deserialize<_i8.Todo>(e)).toList() as T;
    }
    if (t == List<_i9.Priority>) {
      return (data as List).map((e) => deserialize<_i9.Priority>(e)).toList()
          as T;
    }
    try {
      return _i10.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Greeting => 'Greeting',
      _i3.Config => 'Config',
      _i4.ConfigThemeMode => 'ConfigThemeMode',
      _i5.Priority => 'Priority',
      _i6.Todo => 'Todo',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('todo.', '');
    }

    switch (data) {
      case _i2.Greeting():
        return 'Greeting';
      case _i3.Config():
        return 'Config';
      case _i4.ConfigThemeMode():
        return 'ConfigThemeMode';
      case _i5.Priority():
        return 'Priority';
      case _i6.Todo():
        return 'Todo';
    }
    className = _i10.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Config') {
      return deserialize<_i3.Config>(data['data']);
    }
    if (dataClassName == 'ConfigThemeMode') {
      return deserialize<_i4.ConfigThemeMode>(data['data']);
    }
    if (dataClassName == 'Priority') {
      return deserialize<_i5.Priority>(data['data']);
    }
    if (dataClassName == 'Todo') {
      return deserialize<_i6.Todo>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i10.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i11.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i10.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i11.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
