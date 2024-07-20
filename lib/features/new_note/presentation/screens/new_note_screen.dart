import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

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
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: BlocConsumer<NewNoteBloc, NewNoteState>(
          listener: _handleNewNoteSaving,
          builder: (context, state) {
            return NewNoteAppBar(
              isSaving: state is NewNoteSavingState,
              titleController: _titleController,
              noteTextController: _noteTextController,
            );
          },
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
              child: SizedBox(height: 10),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: MainInputTextField(
                controller: _noteTextController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNewNoteSaving(context, state) {
    if (state is NewNoteInitialState) {
      BlocProvider.of<AllNotesBloc>(context).add(LoadAllNotesEvent());
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteTextController.dispose();
    super.dispose();
  }
}
