import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

class EditStackStorage implements IEditStackStorage {
  EditStackStorage({required Realm realm}) : _realm = realm;

  final Realm _realm;

  @override
  Future<void> push() async {}

  @override
  Future<void> pop() async {}

  @override
  Future<void> clear() async {}
}
