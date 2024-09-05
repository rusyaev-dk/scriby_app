import 'package:flutter/material.dart';

abstract class CustomPageTransitionsBuilder {
  static Widget scaleTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child, [
    Alignment alignment = const FractionalOffset(0.90, 0.95),
  ]) {
    const curve = Curves.ease;

    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return ScaleTransition(
      alignment: alignment,
      scale: curvedAnimation,
      child: child,
    );
  }

  static Widget fadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child, [
    Curve curve = Curves.easeInOutQuad,
  ]) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return FadeTransition(
      opacity: curvedAnimation,
      child: child,
    );
  }

  static Widget slideWithFadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedSlideAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).animate(curvedSlideAnimation);

    final curvedFadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.ease,
    );

    return SlideTransition(
      position: tween,
      child: FadeTransition(
        opacity: curvedFadeAnimation,
        child: child,
      ),
    );
  }

  static Widget verticalSlideTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedSlideAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).animate(curvedSlideAnimation);

    final curvedFadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.ease,
    );

    return SlideTransition(
      position: tween,
      child: FadeTransition(
        opacity: curvedFadeAnimation,
        child: child,
      ),
    );
  }
}
