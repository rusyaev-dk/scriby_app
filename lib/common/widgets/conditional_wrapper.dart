import 'package:flutter/material.dart';

/// Wrapper builder.
typedef WrapperBuilder = Widget Function(Widget child);


class ConditionalWrapper extends StatelessWidget {
  const ConditionalWrapper({
    required this.condition,
    required this.onAddWrapper,
    required this.child,
    super.key,
  });

  /// Condition to wrap the child.
  final bool condition;

  /// Wrapper for the child.
  final WrapperBuilder onAddWrapper;

  /// Child to be wrapped.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? onAddWrapper(child) : child;
  }
}
