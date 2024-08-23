import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

class GeneralSettingsRepository implements IGeneralSettingsRepository {
  GeneralSettingsRepository({
    required ISettingsStorage settingsStorage,
  }) : _settingsStorage = settingsStorage;

  final ISettingsStorage _settingsStorage;

  @override
  Future<bool> toggleNotifications(bool value) async {
    return await _settingsStorage.toggleSetting(
      LocalStorageKeys.notificationsKey,
      value,
    );
  }

  @override
  Future<bool> toggleVibration(bool value) async {
    return await _settingsStorage.toggleSetting(
      LocalStorageKeys.vibrationKey,
      value,
    );
  }

  @override
  Future<bool> toggleCloudSync(bool value) async {
    return await _settingsStorage.toggleSetting(
      LocalStorageKeys.cloudSyncKey,
      value,
    );
  }

  @override
  Future<bool> toggleAutosave(bool value) async {
    return await _settingsStorage.toggleSetting(
      LocalStorageKeys.autosaveKey,
      value,
    );
  }

  @override
  Future<bool> getNotificationsStatus() async {
    return await _settingsStorage
            .getSetting(LocalStorageKeys.notificationsKey) ??
        false;
  }

  @override
  Future<bool> getVibrationStatus() async {
    return await _settingsStorage.getSetting(LocalStorageKeys.vibrationKey) ??
        false;
  }

  @override
  Future<bool> getCloudSyncStatus() async {
    return await _settingsStorage.getSetting(LocalStorageKeys.cloudSyncKey) ??
        false;
  }

  @override
  Future<bool> getAutosaveStatus() async {
    return await _settingsStorage.getSetting(LocalStorageKeys.autosaveKey) ??
        false;
  }
}
