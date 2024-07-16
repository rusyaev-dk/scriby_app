import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      floatingActionButton: const NewNoteButton(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const HomeAppBar(),
              if (state is HomeLoadedState)
                if (state.notes.isEmpty)
                  const NoNotesWidget()
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, top: 10, bottom: 10),
                    sliver: MyNotesGrid(notes: state.notes),
                  )
              else if (state is HomeLoadingState)
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


