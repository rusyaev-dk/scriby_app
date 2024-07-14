part of 'new_note_bloc.dart';

sealed class NewNoteEvent extends Equatable {}

final class SaveNewNoteEvent extends NewNoteEvent {
  SaveNewNoteEvent({
    required this.title,
    required this.dateTime,
    required this.tags,
    required this.text,
    required this.completer,
  });

  final String title;
  final String dateTime;
  final List<String> tags;
  final String text;
  final Completer completer;

  @override
  List<Object?> get props => [title, dateTime, tags, text];
}
