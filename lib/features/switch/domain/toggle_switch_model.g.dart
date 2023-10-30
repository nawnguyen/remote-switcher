// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_switch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToggleSwitchModelImpl _$$ToggleSwitchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ToggleSwitchModelImpl(
      switchId: json['switchId'] as int,
      state: json['state'] as bool,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$$ToggleSwitchModelImplToJson(
        _$ToggleSwitchModelImpl instance) =>
    <String, dynamic>{
      'switchId': instance.switchId,
      'state': instance.state,
      'deviceId': instance.deviceId,
    };
