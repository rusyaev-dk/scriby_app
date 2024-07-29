import 'package:flutter/material.dart';
import 'package:scriby_app/app/app.dart';
import 'package:scriby_app/persistence/storage/realm/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final realm = configRealm();
  final prefs = await configSharedPreferences();
  final talker = Talker();
  final appConfig = AppConfig(
    realm: realm,
    sharedPreferences: prefs,
    talker: talker,
  );

  runApp(ScribyApp(appConfig: appConfig));
}

Future<SharedPreferences> configSharedPreferences() async {
  return await SharedPreferences.getInstance();
}
