import 'package:common/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCache extends Cache {
  final SharedPreferences _shared;

  const SharedCache(
    this._shared,
  );

  @override
  Future<T?> read<T>({
    required String key,
    T? fallback,
  }) async {
    return await _shared.getValue(
      key: key,
    );
  }

  @override
  Future<void> write<T>({
    required String key,
    required T value,
  }) async {
    return await _shared.setValue(
      key: key,
      value: value,
    );
  }

  @override
  Future<void> remove<T>({
    required String key,
    T? value,
  }) async {
    await _shared.remove(
      key,
    );
  }

  @override
  Future<void> clear() async {
    await _shared.clear();
  }

  @override
  Future<void> reload() async {
    await _shared.reload();
  }
}
