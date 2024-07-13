import 'package:flutter/material.dart';
import 'package:scriby_app/app/app.dart';
import 'package:scriby_app/persistence/storage/realm/config.dart';

void main() {
  final realm = configRealm();

  final appConfig = AppConfig(realm: realm);

  runApp(ScribyApp(appConfig: appConfig));
}
