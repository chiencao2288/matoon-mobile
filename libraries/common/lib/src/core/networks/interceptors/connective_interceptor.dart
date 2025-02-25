import 'package:dio/dio.dart';

import '../network_connective.dart';

class ConnectiveInterceptor extends QueuedInterceptor {
  @override
  void onRequest(options, handler) async {
    final isConnective = await NetworkConnective.check();

    if (isConnective == true) {
      super.onRequest(
        options,
        handler,
      );
    } else {
      handler.reject(
        DioException.connectionError(
          requestOptions: options,
          reason: "",
        ),
      );
    }
  }
}
