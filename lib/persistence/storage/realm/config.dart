import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

Realm configRealm() {
  final config = Configuration.local(
    [
      LocalNote.schema,
      EditingLocalNote.schema,
    ],
    shouldDeleteIfMigrationNeeded: true,
  );
  return Realm(config);
}
