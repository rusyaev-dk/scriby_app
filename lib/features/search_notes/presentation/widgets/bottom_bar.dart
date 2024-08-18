import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

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
  late final FocusNode _textFieldFocusNote;

  bool _isExpanded = false;
  double _bottomPadding = Platform.isIOS ? 20 : 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _sizeAnimation =
        Tween<double>(begin: 40.0, end: 100.0).animate(_animationController);
    widget.searchTextController.addListener(_resizeBottomBar);

    if (Platform.isIOS) {
      _textFieldFocusNote = FocusNode();
      _textFieldFocusNote.addListener(_changeBottomPadding);
    }
  }

  void _resizeBottomBar() {
    String controllerText = widget.searchTextController.text;

    if ((controllerText.contains('\n') || controllerText.length >= 25) &&
        !_isExpanded) {
      _animationController.forward();
      _isExpanded = true;
    } else if ((!controllerText.contains('\n') && controllerText.length < 25) &&
        _isExpanded) {
      _animationController.reverse();
      _isExpanded = false;
    } else if ((controllerText.replaceAll('\n', "").isEmpty &&
            controllerText.length < 25) &&
        _isExpanded) {
      widget.searchTextController.clear();
      _animationController.reverse();
      _isExpanded = false;
    }
  }

  void _changeBottomPadding() {
    print("HERE");
    setState(() {
      _bottomPadding = _textFieldFocusNote.hasFocus ? 0 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: _bottomPadding),
          height: _sizeAnimation.value + 40, //(Platform.isIOS ? 40 : 25),
          width: double.infinity,
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
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    focusNode: Platform.isIOS ? _textFieldFocusNote : null,
                    controller: widget.searchTextController,
                    maxLines: 5,
                    scrollPhysics: const ClampingScrollPhysics(),
                    decoration: InputDecoration(
                      hintText: "Enter your note here...",
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

  void _cleanSearchText() {
    widget.searchTextController.clear();
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.searchTextController.removeListener(_resizeBottomBar);
    if (Platform.isIOS) {
      _textFieldFocusNote.removeListener(_changeBottomPadding);
      _textFieldFocusNote.dispose();
    }
    super.dispose();
  }
}
