import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/core/shared/provider.dart';
import 'package:light_switch_app/features/switch/domain/constants/hive_boxes_keys.dart';
import 'package:light_switch_app/features/switch/domain/entities/switch_entity.dart';
import 'package:light_switch_app/features/switch/domain/toggle_switch_model.dart';
import 'package:light_switch_app/features/switch/infrastructure/providers/remote_service_provider_impl.dart';

import '../application/toggle_notifier.dart';
import '../infrastructure/providers/remote_service_provider.dart';
import '../infrastructure/providers/switch_local_storage_provider.dart';
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

final switchesBoxProvider = Provider<Box<SwitchEntity>>(
  (ref) => Hive.box<SwitchEntity>(HiveBoxKeys.switches),
);
final switchLocalStorageProvider = Provider<SwitchLocalStorageProvider>(
  (ref) => SwitchLocalStorageProviderImpl(ref.watch(switchesBoxProvider)),
);
