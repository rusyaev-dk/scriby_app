import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "EditNoteRoute")
class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteTextController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title);
    _noteTextController = TextEditingController(text: widget.note?.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: EditNoteAppBar(
          titleController: _titleController,
          noteTextController: _noteTextController,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<EditNoteBloc, EditNoteState>(
          builder: (context, state) {
            if (state is NoteEditingState || state is NoteSavingState) {
              return DisableScrollStretching(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 15),
                    ),
                    SliverToBoxAdapter(
                      child: TitleTextField(
                        controller: _titleController,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 6),
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

            return Center(
              child: CircularProgressIndicator(
                color: colorScheme.onBackground,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteTextController.dispose();
    super.dispose();
  }
}
