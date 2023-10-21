import 'package:dartz/dartz.dart';
import 'package:light_switch_app/features/core/domain/request_failure.dart';
import 'package:light_switch_app/features/core/infrastructure/exceptions.dart';

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
}
