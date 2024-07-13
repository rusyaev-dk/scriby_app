import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  AppConfig({
    required this.realm,
    required this.sharedPreferences,
  });

  final Realm realm;
  final SharedPreferences sharedPreferences;
}
