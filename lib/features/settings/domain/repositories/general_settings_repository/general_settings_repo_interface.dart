abstract interface class GeneralSettingsRepositoryI {
  Future<void> toggleNotificationsOn();
  Future<void> toggleNotificationsOff();
  Future<bool> getCurrentNotificationsStatus();

  Future<void> toggleVibrationOn();
  Future<void> toggleVibrationOff();
  Future<bool> getCurrentVibrationStatus();

  Future<void> toggleCloudSyncOn();
  Future<void> toggleCloudSyncOff();
  Future<bool> getCurrentCloudSyncStatus();
}
