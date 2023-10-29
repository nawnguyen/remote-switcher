import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'toggle_switch_model.freezed.dart';
part 'toggle_switch_model.g.dart';

@freezed
class ToggleSwitchModel with _$ToggleSwitchModel {
  const factory ToggleSwitchModel({
    required bool state,
    required String deviceId,
  }) = _ToggleSwitchModel;

  factory ToggleSwitchModel.fromJson(Map<String, Object?> json) =>
      _$ToggleSwitchModelFromJson(json);
}
