import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

class Note {
  Note({
    required this.title,
    required this.dateTime,
    required this.colorHex,
    required this.tags,
    required this.text,
  });

  final String title;
  final DateTime dateTime;
  final String colorHex;
  final List<String> tags;
  final String text;

  LocalNote toLocal() => LocalNote(
        Uuid.v4().toString(),
        title,
        dateTime,
        colorHex,
        text,
        tags: tags,
      );

  factory Note.fromLocal(LocalNote localNote) {
    return Note(
      title: localNote.title,
      dateTime: localNote.dateTime,
      colorHex: localNote.colorHex,
      tags: localNote.tags,
      text: localNote.text,
    );
  }
}
