import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/my_notes/presentation/presentation.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';

@RoutePage()
class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteTextController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _noteTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocConsumer<NewNoteBloc, NewNoteState>(
            listener: _handleNewNoteSaving,
            builder: (context, state) {
              return SliverAppBar(
                elevation: 0,
                forceMaterialTransparency: true,
                pinned: false,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SaveNoteButton(
                      onPressed: _onSaveButtonPressed,
                      isSaving: state is NewNoteSavingState,
                    ),
                  ),
                ],
              );
            },
          ),
          SliverToBoxAdapter(
            child: TitleTextField(
              controller: _titleController,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: MainInputTextField(
              controller: _noteTextController,
            ),
          ),
        ],
      ),
    );
  }

  void _handleNewNoteSaving(context, state) {
    if (state is NewNoteInitialState) {
      BlocProvider.of<MyNotesBloc>(context).add(LoadMyNotesEvent());
    }
  }

  void _onSaveButtonPressed() async {
    final Completer completer = Completer();

    BlocProvider.of<NewNoteBloc>(context).add(
      SaveNewNoteEvent(
        title: _titleController.text,
        dateTime: DateTime.now().toString(),
        tags: const ["test_tag", "one_more_test_tag"],
        text: _noteTextController.text,
        completer: completer,
      ),
    );

    await completer.future;
    _titleController.clear();
    _noteTextController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteTextController.dispose();
    super.dispose();
  }
}
