import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/toggle_switch_model.dart';
import '../infrastructure/repositories/switch_repository.dart';

class ToggleNotifier extends StateNotifier<ToggleSwitchModel> {
  final SwitchRepository _switchRepository;

  ToggleNotifier(this._switchRepository)
      : super(const ToggleSwitchModel(state: false, deviceId: 'non-id'));

  Future<void> toggle(ToggleSwitchModel model) async {
    final response = await _switchRepository.toggle(model);
    state = response.fold(
      (l) => model.copyWith(state: !model.state),
      (r) => model,
    );
  }
}
