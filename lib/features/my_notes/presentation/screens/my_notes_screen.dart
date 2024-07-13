import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/features/my_notes/presentation/presentation.dart';

@RoutePage()
class MyNotesScreen extends StatelessWidget {
  const MyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyNotesBody(),
    );
  }
}
