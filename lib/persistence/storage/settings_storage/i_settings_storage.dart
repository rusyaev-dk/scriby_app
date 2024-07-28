abstract interface class ISettingsStorage {
  Future<T?> getSetting<T>(String key);
  Future<bool> toggleSetting<T>(String key, T value);
}
