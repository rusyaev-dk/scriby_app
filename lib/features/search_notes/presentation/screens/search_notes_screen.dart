import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "SearchNotesShellRoute")
class SearchNotesSheelScreen extends AutoRouter {
  const SearchNotesSheelScreen({super.key});
}

@RoutePage(name: "SearchNotesRoute")
class SearchNotesScreen extends StatefulWidget {
  const SearchNotesScreen({super.key});

  @override
  State<SearchNotesScreen> createState() => _SearchNotesScreenState();
}

class _SearchNotesScreenState extends State<SearchNotesScreen> {
  late final TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SearchNotesAppBar(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BottomSearchBar(
            searchTextController: _searchTextController,
          ),
        ),
      ),
      // body: BlocBuilder<SearchNotesBloc, SearchNotesState>(
      //   builder: (context, state) {},
      // ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}
