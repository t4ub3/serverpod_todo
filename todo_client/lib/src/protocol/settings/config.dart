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
import '../settings/config_theme_mode.dart' as _i2;

abstract class Config implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.ConfigThemeMode themeMode;

  bool hideCompleted;

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
