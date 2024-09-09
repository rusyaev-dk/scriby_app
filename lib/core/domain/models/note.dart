import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/common/utils/utils.dart';
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

  factory Note.empty() {
    return Note(
      id: Uuid.v4().toString(),
      title: "",
      date: DateTime.now(),
      hexColor: ColorFormatter.getRandomHexColor(),
      tags: const [],
      text: "",
      pinned: false,
    );
  }

  bool isEmpty() {
    return title.trim().isEmpty && text.trim().isEmpty;
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

  Note copyWith({
    String? id,
    String? title,
    DateTime? date,
    String? hexColor,
    List<String>? tags,
    String? text,
    bool? pinned,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      hexColor: hexColor ?? this.hexColor,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      pinned: pinned ?? this.pinned,
    );
  }

  @override
  List<Object?> get props => [title, date, hexColor, tags, text, pinned];
}
