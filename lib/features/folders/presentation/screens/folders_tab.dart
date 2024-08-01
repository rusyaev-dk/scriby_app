import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "FoldersTabRoute")
class FoldersTab extends StatelessWidget {
  const FoldersTab({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILD FOLDERS");
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text("Folders Tab"),
        )
      ],
    );
  }
}
