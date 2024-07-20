import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({super.key});

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 33).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return GestureDetector(
      onTap: _animatedTransition,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: colorScheme.onBackground,
            borderRadius: BorderRadius.circular(32.5),
          ),
          child: Visibility(
            visible: isVisible,
            child: Icon(
              Icons.add,
              size: 33,
              color: colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _animatedTransition() async {
    setState(() {
      isVisible = false;
    });

    _animationController.forward();
    await Future.delayed(const Duration(milliseconds: 180));

    if (!mounted) return;
    context.router.push(const NewNoteRoute()).then((value) async {
      await _animationController.reverse();
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
