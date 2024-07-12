import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/scriby_app.dart';

import 'common/domain/repositories/my_notes/models/models.dart';

void main() {
  final config = Configuration.local([Note.schema]);
  final realm = Realm(config);
  runApp(const ScribyApp());
}
