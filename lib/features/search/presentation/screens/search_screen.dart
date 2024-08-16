import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "SearchShellRoute")
class SearchSheelScreen extends AutoRouter {
  const SearchSheelScreen({super.key});
}

@RoutePage(name: "SearchRoute")
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
    );
  }
}
