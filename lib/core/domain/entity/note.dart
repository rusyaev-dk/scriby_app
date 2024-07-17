import 'package:equatable/equatable.dart';

import 'package:realm/realm.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.hexColor,
    required this.tags,
    required this.text,
  });

  final String id;
  final String title;
  final DateTime dateTime;
  final String hexColor;
  final List<String> tags;
  final String text;

  factory Note.create({
    required String title,
    required DateTime dateTime,
    required String hexColor,
    required List<String> tags,
    required String text,
  }) {
    final id = Uuid.v4().toString();
    return Note(
      id: id,
      title: title,
      dateTime: dateTime,
      hexColor: hexColor,
      tags: tags,
      text: text,
    );
  }

  LocalNote toLocal() => LocalNote(
        id,
        title,
        dateTime,
        hexColor,
        text,
        tags: tags,
      );

  factory Note.fromLocal(LocalNote localNote) {
    return Note(
      id: localNote.id,
      title: localNote.title,
      dateTime: localNote.dateTime,
      hexColor: localNote.hexColor,
      tags: localNote.tags,
      text: localNote.text,
    );
  }

  @override
  List<Object?> get props => [title, dateTime, hexColor, tags, text];
}
