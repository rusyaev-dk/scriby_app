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
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: ElevatedButton(
        onPressed: isSaving ? () {} : onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                AppColorScheme.of(context).onBackground)),
        child: isSaving
            ? const CircularProgressIndicator()
            : const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
