import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';
import 'package:scriby_app/persistence/storage/settings_storage/settings_storage.dart';

class GeneralSettingsRepository implements IGeneralSettingsRepository {
  GeneralSettingsRepository({
    required ISettingsStorage settingsStorage,
  }) : _settingsStorage = settingsStorage;

  final ISettingsStorage _settingsStorage;

  @override
  Future<bool> toggleNotifications(bool value) async {
    return await _settingsStorage.toggleSetting(
      GeneralSettingsKeys.notifications.keyName,
      value,
    );
  }

  @override
  Future<bool> toggleVibration(bool value) async {
    return await _settingsStorage.toggleSetting(
      GeneralSettingsKeys.vibration.keyName,
      value,
    );
  }

  @override
  Future<bool> toggleCloudSync(bool value) async {
    return await _settingsStorage.toggleSetting(
      GeneralSettingsKeys.cloudSync.keyName,
      value,
    );
  }

  @override
  Future<bool> getNotificationsStatus() async {
    return await _settingsStorage
        .getSetting(GeneralSettingsKeys.notifications.keyName) ?? false;
  }

  @override
  Future<bool> getVibrationStatus() async {
    return await _settingsStorage
        .getSetting(GeneralSettingsKeys.vibration.keyName) ?? false;
  }

  @override
  Future<bool> getCloudSyncStatus() async {
    return await _settingsStorage
        .getSetting(GeneralSettingsKeys.cloudSync.keyName) ?? false;
  }
}

enum GeneralSettingsKeys {
  notifications("notifications"),
  vibration("vibration"),
  cloudSync("cloud_sync");

  const GeneralSettingsKeys(this.keyName);

  final String keyName;
}
