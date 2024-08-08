import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    required this.date,
    required this.hexColor,
    required this.tags,
    required this.text,
    required this.pinned,
  });

  final String id;
  final String title;
  final DateTime date;
  final String hexColor;
  final List<String> tags;
  final String text;
  final bool pinned;

  factory Note.create({
    String? id,
    required String title,
    required DateTime date,
    required String hexColor,
    required List<String> tags,
    required String text,
    required bool pinned,
  }) {
    return Note(
      id: id ?? Uuid.v4().toString(),
      title: title,
      date: date,
      hexColor: hexColor,
      tags: tags,
      text: text,
      pinned: pinned,
    );
  }

  LocalNote toLocal() => LocalNote(
        id,
        title,
        date,
        hexColor,
        text,
        pinned,
        tags: tags,
      );

  factory Note.fromLocal(LocalNote localNote) {
    return Note(
      id: localNote.id,
      title: localNote.title,
      date: localNote.date,
      hexColor: localNote.hexColor,
      tags: localNote.tags,
      text: localNote.text,
      pinned: localNote.pinned,
    );
  }

  @override
  List<Object?> get props => [title, date, hexColor, tags, text, pinned];
}
