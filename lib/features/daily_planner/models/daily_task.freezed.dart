// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyTask _$DailyTaskFromJson(Map<String, dynamic> json) {
  return _DailyTask.fromJson(json);
}

/// @nodoc
mixin _$DailyTask {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this DailyTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTaskCopyWith<DailyTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTaskCopyWith<$Res> {
  factory $DailyTaskCopyWith(DailyTask value, $Res Function(DailyTask) then) =
      _$DailyTaskCopyWithImpl<$Res, DailyTask>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DateTime createdAt,
      bool isDone,
      String title});
}

/// @nodoc
class _$DailyTaskCopyWithImpl<$Res, $Val extends DailyTask>
    implements $DailyTaskCopyWith<$Res> {
  _$DailyTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? isDone = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTaskImplCopyWith<$Res>
    implements $DailyTaskCopyWith<$Res> {
  factory _$$DailyTaskImplCopyWith(
          _$DailyTaskImpl value, $Res Function(_$DailyTaskImpl) then) =
      __$$DailyTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      DateTime createdAt,
      bool isDone,
      String title});
}

/// @nodoc
class __$$DailyTaskImplCopyWithImpl<$Res>
    extends _$DailyTaskCopyWithImpl<$Res, _$DailyTaskImpl>
    implements _$$DailyTaskImplCopyWith<$Res> {
  __$$DailyTaskImplCopyWithImpl(
      _$DailyTaskImpl _value, $Res Function(_$DailyTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? isDone = null,
    Object? title = null,
  }) {
    return _then(_$DailyTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTaskImpl implements _DailyTask {
  _$DailyTaskImpl(
      {required this.id,
      required this.date,
      required this.createdAt,
      this.isDone = false,
      this.title = ''});

  factory _$DailyTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTaskImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isDone;
  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'DailyTask(id: $id, date: $date, createdAt: $createdAt, isDone: $isDone, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, createdAt, isDone, title);

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      __$$DailyTaskImplCopyWithImpl<_$DailyTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTaskImplToJson(
      this,
    );
  }
}

abstract class _DailyTask implements DailyTask {
  factory _DailyTask(
      {required final String id,
      required final DateTime date,
      required final DateTime createdAt,
      final bool isDone,
      final String title}) = _$DailyTaskImpl;

  factory _DailyTask.fromJson(Map<String, dynamic> json) =
      _$DailyTaskImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  DateTime get createdAt;
  @override
  bool get isDone;
  @override
  String get title;

  /// Create a copy of DailyTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTaskImplCopyWith<_$DailyTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
