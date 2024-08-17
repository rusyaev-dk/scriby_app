import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';

@RoutePage(name: "SearchNotesShellRoute")
class SearchNotesSheelScreen extends AutoRouter {
  const SearchNotesSheelScreen({super.key});
}

@RoutePage(name: "SearchNotesRoute")
class SearchNotesScreen extends StatelessWidget {
  const SearchNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      // body: BlocBuilder<SearchNotesBloc, SearchNotesState>(
      //   builder: (context, state) {},
      // ),
    );
  }
}
