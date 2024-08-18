import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SearchNotesAppBar extends StatelessWidget {
  const SearchNotesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return SafeArea(
      child: Container(
        color: colorScheme.background,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                PopScreenButtonCirlced(
                  diameter: 40,
                  icon: Icons.close_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
