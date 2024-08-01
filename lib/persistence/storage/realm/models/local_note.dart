import 'package:realm/realm.dart';

part 'local_note.realm.dart';

@RealmModel()
class _LocalNote {
  @PrimaryKey()
  late String id;
  late String title;
  late DateTime date;
  late String hexColor;
  late List<String> tags;
  late String text;
  late bool pinned;
}
