import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/local_note.dart';

Realm configRealm() {
  final config = Configuration.local(
    [LocalNote.schema],
    shouldDeleteIfMigrationNeeded: true,
  );
  return Realm(config);
}
