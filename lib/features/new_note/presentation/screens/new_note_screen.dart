import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/features/new_note/presentation/widgets/widgets.dart';

@RoutePage()
class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewNoteBody(),
    );
  }
}
