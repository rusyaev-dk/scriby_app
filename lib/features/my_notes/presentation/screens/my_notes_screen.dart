import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/my_notes/presentation/presentation.dart';

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
                  const NoNotesWidget()
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, top: 10, bottom: 10),
                    sliver: MyNotesGrid(notes: state.notes),
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
