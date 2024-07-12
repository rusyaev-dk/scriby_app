import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/domain/repositories/my_notes/my_notes.dart';

part 'my_notes_event.dart';
part 'my_notes_state.dart';

class MyNotesBloc extends Bloc<MyNotesEvent, MyNotesState> {
  MyNotesBloc({
    required IMyNotesRepository allNotesRepository,
  })  : _myNotesRepository = allNotesRepository,
        super(MyNotesInitial()) {
    on<MyNotesEvent>((event, emit) {});
  }

  final IMyNotesRepository _myNotesRepository;
}
