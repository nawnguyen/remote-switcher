// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_switch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToggleSwitchModel _$ToggleSwitchModelFromJson(Map<String, dynamic> json) {
  return _ToggleSwitchModel.fromJson(json);
}

/// @nodoc
mixin _$ToggleSwitchModel {
  int get switchId => throw _privateConstructorUsedError;
  bool get state => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleSwitchModelCopyWith<ToggleSwitchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleSwitchModelCopyWith<$Res> {
  factory $ToggleSwitchModelCopyWith(
          ToggleSwitchModel value, $Res Function(ToggleSwitchModel) then) =
      _$ToggleSwitchModelCopyWithImpl<$Res, ToggleSwitchModel>;
  @useResult
  $Res call({int switchId, bool state, String deviceId});
}

/// @nodoc
class _$ToggleSwitchModelCopyWithImpl<$Res, $Val extends ToggleSwitchModel>
    implements $ToggleSwitchModelCopyWith<$Res> {
  _$ToggleSwitchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switchId = null,
    Object? state = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      switchId: null == switchId
          ? _value.switchId
          : switchId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToggleSwitchModelImplCopyWith<$Res>
    implements $ToggleSwitchModelCopyWith<$Res> {
  factory _$$ToggleSwitchModelImplCopyWith(_$ToggleSwitchModelImpl value,
          $Res Function(_$ToggleSwitchModelImpl) then) =
      __$$ToggleSwitchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int switchId, bool state, String deviceId});
}

/// @nodoc
class __$$ToggleSwitchModelImplCopyWithImpl<$Res>
    extends _$ToggleSwitchModelCopyWithImpl<$Res, _$ToggleSwitchModelImpl>
    implements _$$ToggleSwitchModelImplCopyWith<$Res> {
  __$$ToggleSwitchModelImplCopyWithImpl(_$ToggleSwitchModelImpl _value,
      $Res Function(_$ToggleSwitchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switchId = null,
    Object? state = null,
    Object? deviceId = null,
  }) {
    return _then(_$ToggleSwitchModelImpl(
      switchId: null == switchId
          ? _value.switchId
          : switchId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToggleSwitchModelImpl
    with DiagnosticableTreeMixin
    implements _ToggleSwitchModel {
  const _$ToggleSwitchModelImpl(
      {required this.switchId, required this.state, required this.deviceId});

  factory _$ToggleSwitchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToggleSwitchModelImplFromJson(json);

  @override
  final int switchId;
  @override
  final bool state;
  @override
  final String deviceId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToggleSwitchModel(switchId: $switchId, state: $state, deviceId: $deviceId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToggleSwitchModel'))
      ..add(DiagnosticsProperty('switchId', switchId))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('deviceId', deviceId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSwitchModelImpl &&
            (identical(other.switchId, switchId) ||
                other.switchId == switchId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, switchId, state, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSwitchModelImplCopyWith<_$ToggleSwitchModelImpl> get copyWith =>
      __$$ToggleSwitchModelImplCopyWithImpl<_$ToggleSwitchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToggleSwitchModelImplToJson(
      this,
    );
  }
}

abstract class _ToggleSwitchModel implements ToggleSwitchModel {
  const factory _ToggleSwitchModel(
      {required final int switchId,
      required final bool state,
      required final String deviceId}) = _$ToggleSwitchModelImpl;

  factory _ToggleSwitchModel.fromJson(Map<String, dynamic> json) =
      _$ToggleSwitchModelImpl.fromJson;

  @override
  int get switchId;
  @override
  bool get state;
  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$ToggleSwitchModelImplCopyWith<_$ToggleSwitchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
