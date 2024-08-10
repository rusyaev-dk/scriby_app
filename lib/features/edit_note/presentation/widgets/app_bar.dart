import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    super.key,
    required this.onSaveButtonPressed,
  });

  final void Function(BuildContext context) onSaveButtonPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SafeArea(
      child: Container(
        color: colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: PopScreenButton(
                    onPressed: () => _onScreenPopButtonPressed(context),
                  ),
                ),
                const Spacer(),
                BlocBuilder<EditNoteBloc, EditNoteState>(
                  builder: (context, state) {
                    return SaveNoteButton(
                      onPressed: () => (state is EditNoteEditingState)
                          ? onSaveButtonPressed(context)
                          : () {},
                      isSaving: state is EditNoteSavingState,
                      height: 40,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onScreenPopButtonPressed(BuildContext context) async {
    final editBlocState = BlocProvider.of<EditNoteBloc>(context).state;
    if (editBlocState is EditNoteEditingState) {}
    AutoRouter.of(context).back();
  }
}
