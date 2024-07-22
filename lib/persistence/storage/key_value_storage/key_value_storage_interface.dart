abstract interface class KeyValueStorageI {
  Future<void> init();

  Future<T?> get<T>({required String key});

  Future<bool> set<T>({required String key, required T value});

  Future<void> delete<T>({required String key});
}
