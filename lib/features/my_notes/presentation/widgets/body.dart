import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/my_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class MyNotesBody extends StatelessWidget {
  const MyNotesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyNotesBloc, MyNotesState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              snap: true,
              floating: true,
              title: Text('История'),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
            ),
            if (state is MyNotesLoadedState)
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "No notes yet...",
                    style: TextStyle(
                      color: AppColorScheme.of(context).onBackground,
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
