// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SwitchEntity _$SwitchEntityFromJson(Map<String, dynamic> json) {
  return _SwitchEntity.fromJson(json);
}

/// @nodoc
mixin _$SwitchEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  bool get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SwitchEntityCopyWith<SwitchEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchEntityCopyWith<$Res> {
  factory $SwitchEntityCopyWith(
          SwitchEntity value, $Res Function(SwitchEntity) then) =
      _$SwitchEntityCopyWithImpl<$Res, SwitchEntity>;
  @useResult
  $Res call({int id, String name, String deviceId, bool state});
}

/// @nodoc
class _$SwitchEntityCopyWithImpl<$Res, $Val extends SwitchEntity>
    implements $SwitchEntityCopyWith<$Res> {
  _$SwitchEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? deviceId = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchEntityImplCopyWith<$Res>
    implements $SwitchEntityCopyWith<$Res> {
  factory _$$SwitchEntityImplCopyWith(
          _$SwitchEntityImpl value, $Res Function(_$SwitchEntityImpl) then) =
      __$$SwitchEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String deviceId, bool state});
}

/// @nodoc
class __$$SwitchEntityImplCopyWithImpl<$Res>
    extends _$SwitchEntityCopyWithImpl<$Res, _$SwitchEntityImpl>
    implements _$$SwitchEntityImplCopyWith<$Res> {
  __$$SwitchEntityImplCopyWithImpl(
      _$SwitchEntityImpl _value, $Res Function(_$SwitchEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? deviceId = null,
    Object? state = null,
  }) {
    return _then(_$SwitchEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwitchEntityImpl implements _SwitchEntity {
  const _$SwitchEntityImpl(
      {required this.id,
      required this.name,
      required this.deviceId,
      required this.state});

  factory _$SwitchEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwitchEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String deviceId;
  @override
  final bool state;

  @override
  String toString() {
    return 'SwitchEntity(id: $id, name: $name, deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, deviceId, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchEntityImplCopyWith<_$SwitchEntityImpl> get copyWith =>
      __$$SwitchEntityImplCopyWithImpl<_$SwitchEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwitchEntityImplToJson(
      this,
    );
  }
}

abstract class _SwitchEntity implements SwitchEntity {
  const factory _SwitchEntity(
      {required final int id,
      required final String name,
      required final String deviceId,
      required final bool state}) = _$SwitchEntityImpl;

  factory _SwitchEntity.fromJson(Map<String, dynamic> json) =
      _$SwitchEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get deviceId;
  @override
  bool get state;
  @override
  @JsonKey(ignore: true)
  _$$SwitchEntityImplCopyWith<_$SwitchEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
