import 'package:dio/dio.dart';

import 'interceptors/connective_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

abstract class NetworkClient {
  Dio? _client;

  abstract final String baseUrl;

  Dio get client {
    Dio dioClient = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.addAll(
        [
          ConnectiveInterceptor(),
          LoggerInterceptor(),
        ],
      );

    return _client ?? dioClient;
  }
}
