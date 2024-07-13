import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/note.dart';

Realm configRealm() {
  final config = Configuration.local([LocalNote.schema]);
  return Realm(config);
}
