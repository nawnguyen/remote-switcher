import 'package:dio/dio.dart';
import 'package:light_switch_app/features/core/infrastructure/dio_extensions.dart';
import 'package:light_switch_app/features/core/infrastructure/exceptions.dart';
import 'package:light_switch_app/features/core/shared/api_paths.dart';
import 'package:light_switch_app/features/switch/domain/toggle_switch_model.dart';

import 'remote_service_provider.dart';

class RemoteServiceProviderImpl extends RemoteServiceProvider {
  final Dio _dio;

  RemoteServiceProviderImpl(this._dio);

  @override
  Future<void> toggle(ToggleSwitchModel model) async {
    try {
      await _dio.put(ApiPaths.light, data: model);
    }
    on DioException catch(e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        throw NoConnectionException();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw UnknownException();
      }
    }
  }
}
