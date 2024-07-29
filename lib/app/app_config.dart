import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppConfig {
  AppConfig({
    required this.realm,
    required this.sharedPreferences,
    required this.talker,
  });

  final Realm realm;
  final SharedPreferences sharedPreferences;
  final Talker talker;
}
