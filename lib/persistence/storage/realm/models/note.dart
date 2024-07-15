import 'package:realm/realm.dart';

part 'note.realm.dart';

@RealmModel()
class _LocalNote {
  @PrimaryKey()
  late String id;
  late String title;
  late DateTime dateTime;
  late List<String> tags;
  late String text;
}
