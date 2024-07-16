import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

class Note {
  Note({
    required this.title,
    required this.dateTime,
    required this.hexColor,
    required this.tags,
    required this.text,
  });

  final String title;
  final DateTime dateTime;
  final String hexColor;
  final List<String> tags;
  final String text;

  LocalNote toLocal() => LocalNote(
        Uuid.v4().toString(),
        title,
        dateTime,
        hexColor,
        text,
        tags: tags,
      );

  factory Note.fromLocal(LocalNote localNote) {
    return Note(
      title: localNote.title,
      dateTime: localNote.dateTime,
      hexColor: localNote.hexColor,
      tags: localNote.tags,
      text: localNote.text,
    );
  }
}
