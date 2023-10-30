import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_entity.freezed.dart';
part 'switch_entity.g.dart';

@freezed
class SwitchEntity with _$SwitchEntity {
  const factory SwitchEntity({
    required int id,
    required String name,
    required String deviceId,
    required bool state,
}) = _SwitchEntity;

  factory SwitchEntity.fromJson(Map<String, Object?> json) => _$SwitchEntityFromJson(json);
}
