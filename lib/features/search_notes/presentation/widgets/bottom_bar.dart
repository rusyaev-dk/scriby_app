import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SearchBottomBar extends StatefulWidget {
  const SearchBottomBar({
    super.key,
  });

  @override
  State<SearchBottomBar> createState() => _SearchBottomBarState();
}

class _SearchBottomBarState extends State<SearchBottomBar>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _searchTextController;
  late final AnimationController _textFieldAnimationController;
  late final Animation<double> _textFieldSizeAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _searchTextController = TextEditingController();
    _searchTextController.addListener(_resizeBottomBar);

    _textFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _textFieldSizeAnimation = Tween<double>(begin: 40.0, end: 100.0)
        .animate(_textFieldAnimationController);
  }

  void _resizeBottomBar() {
    String controllerText = _searchTextController.text;

    if ((controllerText.contains('\n') || controllerText.length >= 25) &&
        !_isExpanded) {
      _textFieldAnimationController.forward();
      _isExpanded = true;
    } else if ((!controllerText.contains('\n') && controllerText.length < 25) &&
        _isExpanded) {
      _textFieldAnimationController.reverse();
      _isExpanded = false;
    } else if ((controllerText.replaceAll('\n', "").isEmpty &&
            controllerText.length < 25) &&
        _isExpanded) {
      _searchTextController.clear();
      _textFieldAnimationController.reverse();
      _isExpanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return AnimatedBuilder(
      animation: _textFieldSizeAnimation,
      builder: (context, child) {
        return Container(
          height: _textFieldSizeAnimation.value + 30,
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: colorScheme.background,
          ),
          child: Row(
            children: [
              CustomIconButtonCircled(
                diameter: 40,
                icon: Icons.delete_forever,
                iconSize: 22,
                onPressed: _cleanSearchText,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: _textFieldSizeAnimation.value,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _searchTextController,
                    maxLines: 5,
                    onChanged: _onSearchTextChanged,
                    scrollPhysics: const ClampingScrollPhysics(),
                    decoration: InputDecoration(
                      hintText: "What to look for?",
                      hintStyle: textScheme.headline.copyWith(
                        fontSize: 22,
                        color: colorScheme.secondary.withOpacity(0.7),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    ),
                    cursorHeight: 25,
                    style: textScheme.headline.copyWith(
                      height: 1.5,
                      color: colorScheme.onBackground,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _cleanSearchText() {
    _searchTextController.clear();
  }

  void _onSearchTextChanged(String query) {
    BlocProvider.of<SearchNotesBloc>(context)
        .add(SearchNotesByQueryEvent(query: query));
  }

  @override
  void dispose() {
    _textFieldAnimationController.dispose();
    _searchTextController.removeListener(_resizeBottomBar);
    _searchTextController.dispose();
    super.dispose();
  }
}
