import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SearchNotesAppBar extends StatelessWidget {
  const SearchNotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return SafeArea(
      child: Container(
        color: colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const PopScreenButtonCirlced(
                  diameter: 40,
                  icon: Icons.close_rounded,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Enter your note here...",
                        hintStyle: textScheme.headline.copyWith(
                          fontSize: 22,
                          color: colorScheme.secondary.withOpacity(0.7),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      cursorHeight: 30,
                      style: textScheme.headline.copyWith(
                        height: 1.5,
                        color: colorScheme.onBackground,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomIconButtonCircled(
                  diameter: 40,
                  icon: Icons.search_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
