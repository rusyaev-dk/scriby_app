import 'package:realm/realm.dart';

part 'note.realm.dart';

@RealmModel()
class _Note {
  @PrimaryKey()
  late String id;
  late String title;
  late String dateTime;
  late List<String> tags;
  late String text;
}
