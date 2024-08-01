part of 'pinned_notes_bloc.dart';

sealed class PinnedNotesEvent extends Equatable {}

final class LoadPinnedNotesEvent extends PinnedNotesEvent {
  @override
  List<Object?> get props => [];
}

final class RefreshPinnedNotesEvent extends PinnedNotesEvent {
  @override
  List<Object?> get props => [];
}
