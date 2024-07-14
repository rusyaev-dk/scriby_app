import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/features/my_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class MyNotesScreen extends StatelessWidget {
  const MyNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyNotesBloc, MyNotesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                snap: true,
                floating: true,
                title: Text('Scriby'),
                elevation: 0,
              ),
              if (state is MyNotesLoadedState)
                if (state.notes.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        "No notes yet...",
                        style: TextStyle(
                          color: AppColorScheme.of(context).onBackground,
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 4,
                      // crossAxisSpacing: 4,
                      itemBuilder: (context, i) {
                        final Note note = state.notes[i];
                        return Padding(
                          padding: const EdgeInsets.all(6),
                          child: NoteCard(
                            note: note,
                            key: ValueKey(note),
                          ),
                        );
                      },
                      childCount: state.notes.length,
                    ),
                  )
              else if (state is MyNotesLoadingState)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
