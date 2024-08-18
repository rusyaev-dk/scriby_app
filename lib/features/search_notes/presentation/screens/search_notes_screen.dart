import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "SearchNotesShellRoute")
class SearchNotesSheelScreen extends AutoRouter {
  const SearchNotesSheelScreen({super.key});
}

@RoutePage(name: "SearchNotesRoute")
class SearchNotesScreen extends StatefulWidget {
  const SearchNotesScreen({super.key});

  @override
  State<SearchNotesScreen> createState() => _SearchNotesScreenState();
}

class _SearchNotesScreenState extends State<SearchNotesScreen> {
  late final TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size(double.infinity, 60),
      //   child: SearchNotesAppBar(
      //     searchTextController: _searchTextController,
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomSearchBar(
              searchTextController: _searchTextController,
            ),
          ],
        ),
      ),
      // body: BlocBuilder<SearchNotesBloc, SearchNotesState>(
      //   builder: (context, state) {},
      // ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}

class BottomSearchBar extends StatefulWidget {
  const BottomSearchBar({
    super.key,
    required this.searchTextController,
  });

  final TextEditingController searchTextController;

  @override
  State<BottomSearchBar> createState() => _BottomSearchBarState();
}

class _BottomSearchBarState extends State<BottomSearchBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizeAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _sizeAnimation =
        Tween<double>(begin: 40.0, end: 100.0).animate(_animationController);
    widget.searchTextController.addListener(_listenToText);
  }

  void _listenToText() {
    final controllerText = widget.searchTextController.text;

    if (controllerText.contains('\n') && !_isExpanded) {
      _animationController.forward();
      _isExpanded = true;
    } else if (!controllerText.contains('\n') && _isExpanded) {
      _animationController.reverse();
      _isExpanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
          height: _sizeAnimation.value + 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.background,
          ),
          child: Row(
            children: [
              const PopScreenButtonCirlced(
                diameter: 40,
                icon: Icons.close_rounded,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: widget.searchTextController,
                    maxLines: 3,
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
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.searchTextController.removeListener(_listenToText);
    super.dispose();
  }
}
