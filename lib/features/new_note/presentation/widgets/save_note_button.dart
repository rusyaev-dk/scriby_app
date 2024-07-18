import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key,
    required this.onPressed,
    required this.isSaving,
    required this.height,
  });

  final void Function() onPressed;
  final bool isSaving;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      height: height,
      child: ElevatedButton(
        onPressed: isSaving ? () {} : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              AppColorScheme.of(context).background),
        ),
        child: isSaving
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: colorScheme.onBackground,
                ),
              )
            : Text(
                'Save',
                style: textScheme.label.copyWith(
                  fontSize: 19,
                  color: colorScheme.onBackground,
                ),
              ),
      ),
    );
  }
}
