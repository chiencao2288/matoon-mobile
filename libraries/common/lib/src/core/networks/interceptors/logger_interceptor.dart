import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggerInterceptor extends PrettyDioLogger {
  LoggerInterceptor()
      : super(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          enabled: true,
        );
}
