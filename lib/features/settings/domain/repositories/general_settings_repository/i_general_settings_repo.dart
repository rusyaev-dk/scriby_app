abstract interface class IGeneralSettingsRepository {
  Future<bool> toggleNotifications(bool value);
  Future<bool> toggleVibration(bool value);
  Future<bool> toggleCloudSync(bool value);
  Future<bool> toggleAutosave(bool value);

  Future<bool> getNotificationsStatus();
  Future<bool> getVibrationStatus();
  Future<bool> getCloudSyncStatus();
  Future<bool> getAutosaveStatus();
}
