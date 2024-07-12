part of 'my_notes_bloc.dart';

sealed class MyNotesState extends Equatable {
  const MyNotesState();

  @override
  List<Object> get props => [];
}

final class MyNotesInitial extends MyNotesState {}
