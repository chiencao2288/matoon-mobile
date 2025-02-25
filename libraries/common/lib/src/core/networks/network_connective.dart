import 'dart:io';

abstract class NetworkConnective {
  static Future<bool> check() async {
    try {
      const checkUrl = 'www.google.com';
      final internetAddress = await InternetAddress.lookup(checkUrl);

      return internetAddress.isNotEmpty &&
          internetAddress.any(
            (address) => address.rawAddress.isNotEmpty,
          );
    } catch (_) {
      return false;
    }
  }
}
