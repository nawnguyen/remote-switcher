import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/core/shared/provider.dart';
import 'package:light_switch_app/features/switch/domain/toggle_switch_model.dart';
import 'package:light_switch_app/features/switch/infrastructure/providers/remote_service_provider_impl.dart';

import '../application/toggle_notifier.dart';
import '../infrastructure/providers/remote_service_provider.dart';
import '../infrastructure/repositories/switch_repository.dart';

final remoteProvider = Provider<RemoteServiceProvider>(
  (ref) => RemoteServiceProviderImpl(ref.watch(dioProvider)),
);
final switchRepository = Provider(
  (ref) => SwitchRepository(ref.watch(remoteProvider)),
);
final toggleNotifierProvider =
    StateNotifierProvider<ToggleNotifier, ToggleSwitchModel>(
  (ref) => ToggleNotifier(ref.watch(switchRepository)),
);
