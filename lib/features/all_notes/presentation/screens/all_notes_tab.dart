import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/features/all_notes/presentation/presentation.dart';

@RoutePage(name: "AllNotesRoute")
class AllNotesTab extends StatefulWidget {
  const AllNotesTab({
    super.key,
  });

  @override
  State<AllNotesTab> createState() => _AllNotesTabState();
}

class _AllNotesTabState extends State<AllNotesTab> {
  static const EdgeInsets _padding = EdgeInsets.only(
    left: 13,
    right: 13,
    bottom: 10,
  );

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesBloc, AllNotesState>(
      builder: (context, state) {
        return NotificationListener(
          onNotification: (Notification notification) {
            ScrollAbsorber.absorbScrollNotification(notification);
            return true;
          },
          child: DisableScrollStretching(
            child: CustomScrollView(
              cacheExtent: 350,
              physics: state is AllNotesLoadingState
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                if (state is AllNotesLoadedState)
                  if (state.notes.isEmpty)
                    const NoNotesWidget()
                  else
                    SliverPadding(
                      padding: _padding,
                      sliver: NotesSliverGrid(
                        key: ValueKey(state.notes.length),
                        notes: state.notes,
                      ),
                    )
                else if (state is AllNotesLoadingState)
                  SliverPadding(
                    padding: _padding,
                    sliver: NotesSliverGrid.loading(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    print("DISPOSING");
    _scrollController.dispose();
    super.dispose();
  }
}
