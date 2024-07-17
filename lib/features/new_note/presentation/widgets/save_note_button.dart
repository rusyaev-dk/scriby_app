import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key,
    required this.onPressed,
    required this.isSaving,
  });

  final void Function() onPressed;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: 40,
      child: ElevatedButton(
        onPressed: isSaving ? () {} : onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                AppColorScheme.of(context).onBackground)),
        child: isSaving
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: colorScheme.background,
                ),
              )
            : Text(
                'Save',
                style: textScheme.label.copyWith(
                  fontSize: 19,
                  color: colorScheme.background,
                ),
              ),
      ),
    );
  }
}
