import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/entities/switch_entity.dart';
import '../domain/models/add_switch_request.dart';
import '../domain/toggle_switch_model.dart';
import '../infrastructure/repositories/switch_repository.dart';

class SwitchesNotifier extends StateNotifier<List<SwitchEntity>> {
  final SwitchRepository _switchRepository;

  SwitchesNotifier(this._switchRepository) : super(<SwitchEntity>[]) {
    fetchSwitches();
  }

  Future<void> fetchSwitches() async {
    final response = await _switchRepository.list();
    state = response.fold((l) => <SwitchEntity>[], (r) => r);
  }

  Future<void> add(AddSwitchRequestModel model) async {
    final response = await _switchRepository.add(model);

    // state = response.fold((l) => , (r) => r);
  }

  Future<void> toggle(ToggleSwitchModel model) async {
    final response = await _switchRepository.toggle(model);
    state = response.fold(
      (l) => state,
      (r) => state.map((e) =>
          e.id == model.switchId && e.deviceId == model.deviceId ? e.copyWith(state: !e.state) : e).toList(),
    );
  }
}
