abstract class Cache {
  const Cache();

  Future<T?> read<T>({
    required String key,
    T? fallback,
  });

  Future<void> write<T>({
    required String key,
    required T value,
  });

  Future<void> remove<T>({
    required String key,
    T? value,
  });

  Future<void> clear();

  Future<void> reload();
}
