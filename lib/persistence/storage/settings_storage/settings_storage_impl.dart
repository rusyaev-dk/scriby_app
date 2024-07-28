import 'package:scriby_app/common/utils/service_funtions.dart';
import 'package:scriby_app/persistence/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorage implements ISettingsStorage {
  SettingsStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<T?> getSetting<T>(String key) async {
    Object? value;
    if (sameTypes<T, List<String>>()) {
      value = _prefs.getStringList(key);
    } else {
      value = _prefs.get(key);
    }

    return value as T;
  }

  @override
  Future<bool> toggleSetting<T>(String key, T value) async {
    if (sameTypes<T, bool>()) {
      return await _prefs.setBool(key, value as bool);
    }

    if (sameTypes<T, int>()) {
      return await _prefs.setInt(key, value as int);
    }

    if (sameTypes<T, double>()) {
      return await _prefs.setDouble(key, value as double);
    }

    if (sameTypes<T, String>()) {
      return await _prefs.setString(key, value as String);
    }

    if (sameTypes<T, List<String>>()) {
      return await _prefs.setStringList(key, value as List<String>);
    }

    if (value is Enum) {
      return await _prefs.setInt(key, value.index);
    }

    return false;
  }
}
