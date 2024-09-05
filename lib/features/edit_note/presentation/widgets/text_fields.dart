import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<EditNoteStageCubit, EditNoteStageState>(
      buildWhen: (previous, current) {
        if (previous is EditNoteStageEditingState &&
            current is EditNoteStageEditingState) {
          if (previous.updatedNote != current.updatedNote) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        if (state is EditNoteStageEditingState && state.updatedNote != null) {
          final newText = state.updatedNote!.title;

          final previousSelection = controller.selection;

          controller.value = TextEditingValue(
            text: newText,
            selection: previousSelection.copyWith(
              baseOffset: previousSelection.baseOffset.clamp(0, newText.length),
              extentOffset:
                  previousSelection.extentOffset.clamp(0, newText.length),
            ),
          );
        }

        return TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Title",
            hintStyle: textScheme.display.copyWith(
              fontSize: 33.5,
              color: colorScheme.secondary.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          style: textScheme.display.copyWith(
            fontSize: 33.5,
            color: colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class MainInputTextField extends StatelessWidget {
  const MainInputTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<EditNoteStageCubit, EditNoteStageState>(
      buildWhen: (previous, current) {
        if (previous is EditNoteStageEditingState &&
            current is EditNoteStageEditingState) {
          if (previous.updatedNote != current.updatedNote) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        if (state is EditNoteStageEditingState && state.updatedNote != null) {
          final newText = state.updatedNote!.text;

          final previousSelection = controller.selection;

          controller.value = TextEditingValue(
            text: newText,
            selection: previousSelection.copyWith(
              baseOffset: previousSelection.baseOffset.clamp(0, newText.length),
              extentOffset:
                  previousSelection.extentOffset.clamp(0, newText.length),
            ),
          );
        }

        return TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Enter your note here...",
            hintStyle: textScheme.headline.copyWith(
              fontSize: 22,
              color: colorScheme.secondary.withOpacity(0.7),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          cursorHeight: 30,
          style: textScheme.headline.copyWith(
            height: 1.5,
            color: colorScheme.onBackground,
            fontSize: 22,
          ),
        );
      },
    );
  }
}
