import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/switch_entity.dart';
import 'local_storage_provider.dart';

abstract class SwitchLocalStorageProvider
    extends LocalStorageProvider<SwitchEntity> {}

class SwitchLocalStorageProviderImpl extends SwitchLocalStorageProvider {
  final Box<SwitchEntity> switchesBox;

  SwitchLocalStorageProviderImpl(this.switchesBox);

  @override
  Future<void> add(SwitchEntity entity) async {
    await switchesBox.add(entity);
  }

  @override
  Future<void> update(SwitchEntity entity) async {
    await switchesBox.put(entity.id, entity);
  }

  @override
  Future<void> delete(SwitchEntity entity) async {
    return deleteById(entity.id);
  }

  @override
  Future<void> deleteById(int id) async {
    await switchesBox.delete(id);
  }

  @override
  Future<SwitchEntity?> getById(int id) async {
    return switchesBox.get(id);
  }
}
