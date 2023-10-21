import '../../domain/toggle_switch_model.dart';

abstract class RemoteServiceProvider {
  Future<void> toggle(ToggleSwitchModel model);
}