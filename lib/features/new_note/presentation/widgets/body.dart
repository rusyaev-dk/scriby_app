import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';

class NewNoteBody extends StatelessWidget {
  const NewNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewNoteBloc, NewNoteState>(
      builder: (context, state) {
        return const Placeholder();
      },
    );
  }
}
