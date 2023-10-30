import 'package:dartz/dartz.dart';
import 'package:light_switch_app/features/core/domain/request_failure.dart';
import 'package:light_switch_app/features/core/infrastructure/exceptions.dart';

import '../../domain/entities/switch_entity.dart';
import '../../domain/models/add_switch_request.dart';
import '../../domain/toggle_switch_model.dart';
import '../providers/remote_service_provider.dart';

class SwitchRepository {
  final RemoteServiceProvider _remoteServiceProvider;

  SwitchRepository(this._remoteServiceProvider);

  Future<Either<RequestFailure, Unit>> toggle(ToggleSwitchModel model) async {
    try {
      await _remoteServiceProvider.toggle(model);
      return right(unit);
    }
    on NoConnectionException catch (e) {
      return left(const RequestFailure.noConnection());
    }
    on RestApiException catch (e) {
      return left(RequestFailure.server(e.errorCode));
    }
    on UnknownException catch (e) {
      return left(const RequestFailure.server());
    }
  }

  Future<Either<RequestFailure, List<SwitchEntity>>> list() async {
    return right(<SwitchEntity>[
      const SwitchEntity(id: 1, name: 'Quạt ĐN', deviceId: 'batveve', state: false),
      const SwitchEntity(id: 2, name: 'Quạt bếp', deviceId: ' aservds', state: true),
      const SwitchEntity(id: 3, name: 'Đèn bàn', deviceId: 'amsyndtbf', state: false),
    ]);
  }

  Future<Either<RequestFailure, SwitchEntity>> add(AddSwitchRequestModel model) async {
    return right(SwitchEntity(id: 0, name: model.name, deviceId: model.deviceId, state: false));
  }
}
