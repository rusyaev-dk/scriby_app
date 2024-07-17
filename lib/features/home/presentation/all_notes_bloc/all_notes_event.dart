part of 'all_notes_bloc.dart';

sealed class AllNotesEvent extends Equatable {}

final class LoadAllNotesEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}
