import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/features/my_notes/presentation/my_notes_bloc/my_notes_bloc.dart';

@RoutePage()
class MyNotesScreen extends StatelessWidget {
  const MyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyNotesBloc, MyNotesState>(
        builder: (context, state) {
          if (state is MyNotesLoadedState) {
            final List<Note> notes = state.notes;

            if (notes.isEmpty) {
              return const Center(
                child: Text("No notes yet..."),
              );
            }
            return Placeholder();
          }

          return const Placeholder();
        },
      ),
    );
  }
}
