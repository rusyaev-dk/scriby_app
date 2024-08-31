import 'package:realm/realm.dart';

part 'editing_local_note.realm.dart';

@RealmModel()
class _EditingLocalNote {
  @PrimaryKey()
  late String id;
  late String title;
  late DateTime date;
  late String hexColor;
  late List<String> tags;
  late String text;
  late bool pinned;
}
