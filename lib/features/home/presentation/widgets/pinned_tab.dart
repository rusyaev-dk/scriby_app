import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PinnedNotesTab extends StatelessWidget {
  const PinnedNotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILD Pinned");
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text("Pinned Tab"),
        )
      ],
    );
  }
}
