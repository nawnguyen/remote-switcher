// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwitchEntityImpl _$$SwitchEntityImplFromJson(Map<String, dynamic> json) =>
    _$SwitchEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      deviceId: json['deviceId'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$$SwitchEntityImplToJson(_$SwitchEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'deviceId': instance.deviceId,
      'state': instance.state,
    };
