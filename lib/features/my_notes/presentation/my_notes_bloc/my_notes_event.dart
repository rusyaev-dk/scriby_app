part of 'my_notes_bloc.dart';

sealed class MyNotesEvent extends Equatable {}

final class LoadMyNotesEvent extends MyNotesEvent {
  @override
  List<Object?> get props => [];
}
