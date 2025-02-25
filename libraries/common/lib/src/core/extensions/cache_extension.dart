import 'package:shared_preferences/shared_preferences.dart';

extension SPCacheExtension on SharedPreferences {
  Future<T?> getValue<T>({
    required String key,
  }) async {
    await reload();
    final value = get(key);
    return value is T
        ? value
        : null;
  }

  Future<void> setValue<T>({
    required String key,
    required T value,
  }) async {
    if (value is int) {
      await setInt(key, value);
    } else if (value is double) {
      await setDouble(key, value);
    } else if (value is bool) {
      await setBool(key, value);
    } else if (value is String) {
      await setString(key, value);
    }
  }
}
