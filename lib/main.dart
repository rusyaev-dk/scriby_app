import 'package:flutter/material.dart';
import 'package:scriby_app/app/app.dart';
import 'package:scriby_app/persistence/storage/key_value_storage/key_value_storage.dart';
import 'package:scriby_app/persistence/storage/realm/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final realm = configRealm();
  final prefs = await configSharedPreferences();
  final appConfig = AppConfig(
    realm: realm,
    sharedPreferences: prefs,
  );

  runApp(ScribyApp(appConfig: appConfig));
}
