import 'dart:io';

import 'package:dio/dio.dart';

extension DioExceptionExtention on DioException {
  bool get isNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }

  bool get isConnectionTimeout {
    return type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.sendTimeout;
  }
}
