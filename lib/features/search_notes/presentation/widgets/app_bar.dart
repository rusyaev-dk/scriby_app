import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SearchNotesAppBar extends StatelessWidget {
  const SearchNotesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SafeArea(
      child: Container(
        color: colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PopScreenButtonCirlced(
                      diameter: 40,
                      icon: Icons.close_rounded,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CustomContextMenu(
                          menuIcon: Icons.tune,
                          actions: [
                            ContextMenuAction(
                              title: "Search among pinned",
                              onPressed: () {},
                            ),
                            ContextMenuAction(
                              title: "Filter 2",
                              onPressed: () {},
                            ),
                            ContextMenuAction(
                              title: "Filter 3",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: SearchResultsIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultsIndicator extends StatelessWidget {
  const SearchResultsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return BlocBuilder<SearchNotesBloc, SearchNotesState>(
      builder: (context, state) {
        if (state is SearchNotesLoadedState) {
          final foundNotes = state.notes;
          if (foundNotes.isNotEmpty) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Found ",
                  style: textScheme.headline.copyWith(
                    color: colorScheme.onBackground,
                    fontSize: 20,
                  ),
                ),
                Animate(
                  key: ValueKey(foundNotes.length),
                  effects: const [FadeEffect()],
                  child: Text(
                    "${foundNotes.length}",
                    style: textScheme.headline.copyWith(
                      color: colorScheme.onBackground,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  foundNotes.length > 1 ? " notes" : " note",
                  style: textScheme.headline.copyWith(
                    color: colorScheme.onBackground,
                    fontSize: 20,
                  ),
                ),
              ],
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
