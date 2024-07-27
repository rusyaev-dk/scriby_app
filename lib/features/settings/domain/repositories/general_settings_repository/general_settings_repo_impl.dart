import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';
import 'package:scriby_app/persistence/storage/key_value_storage/key_value_storage.dart';

sealed class GeneralSettingsKeys {
  static const String notificationsKey = "notifications";
  static const String vibrationKey = "vibration";
  static const String cloudSyncKey = "cloud_sync";
}

class GeneralSettingsRepository implements GeneralSettingsRepositoryI {
  GeneralSettingsRepository({
    required KeyValueStorageI keyValueStorage,
  }) : _keyValueStorage = keyValueStorage;

  final KeyValueStorageI _keyValueStorage;

  @override
  Future<void> toggleCloudSyncOff() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.cloudSyncKey, value: false);
  }

  @override
  Future<void> toggleCloudSyncOn() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.cloudSyncKey, value: true);
  }

  @override
  Future<void> toggleNotificationsOff() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.notificationsKey, value: false);
  }

  @override
  Future<void> toggleNotificationsOn() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.notificationsKey, value: true);
  }

  @override
  Future<void> toggleVibrationOff() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.vibrationKey, value: false);
  }

  @override
  Future<void> toggleVibrationOn() async {
    await _keyValueStorage.set<bool>(
        key: GeneralSettingsKeys.vibrationKey, value: true);
  }

  @override
  Future<bool> getCurrentCloudSyncStatus() async {
    final bool? status = await _keyValueStorage.get<bool?>(
      key: GeneralSettingsKeys.cloudSyncKey,
    );
    return status ?? false;
  }

  @override
  Future<bool> getCurrentNotificationsStatus() async {
    final bool? status = await _keyValueStorage.get<bool?>(
      key: GeneralSettingsKeys.notificationsKey,
    );
    return status ?? false;
  }

  @override
  Future<bool> getCurrentVibrationStatus() async {
    final bool? status = await _keyValueStorage.get<bool?>(
      key: GeneralSettingsKeys.vibrationKey,
    );
    return status ?? false;
  }
}
