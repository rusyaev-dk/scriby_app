import 'package:flutter/material.dart';

class NoPinnedNotesWidget extends StatelessWidget {
  const NoPinnedNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No pinned notes yet..."),
    );
  }
}
