import 'package:scriby_app/core/utils/utils.dart';
import 'package:scriby_app/persistence/storage/key_value_storage/key_value_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage implements KeyValueStorageI {
  SharedPrefsStorage({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    // await _prefs.clear();
  }

  @override
  Future<T?> get<T>({required String key}) async {
    Object? value;
    if (sameTypes<T, List<String>>()) {
      value = _prefs.getStringList(key);
    } else {
      value = _prefs.get(key);
    }
  
    return value as T;
  }

  @override
  Future<bool> set<T>({required String key, required T value}) async {
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

  @override
  Future<bool> delete<T>({required String key}) async {
    return await _prefs.remove(key);
  }
}

Future<SharedPreferences> configSharedPreferences() async {
  return await SharedPreferences.getInstance();
}