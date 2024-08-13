import 'dart:developer';

import 'package:flutter/material.dart';

class ScrollAbsorberKeys {
  static final nestedScrollViewKey = GlobalKey();
}

class ScrollAbsorber {
  static void absorbScrollNotification(Notification notification) {
    try {
      NestedScrollView nestedScrollView = ScrollAbsorberKeys
          .nestedScrollViewKey.currentWidget as NestedScrollView;
      ScrollController primaryScrollController = nestedScrollView.controller!;

      // Проверка на то, что скроллинг активен
      if (primaryScrollController.position.axis == Axis.vertical &&
          primaryScrollController.position.isScrollingNotifier.value) return;

      double scrolled = 0;

      // Handling vertical scroll
      if (notification is OverscrollNotification) {
        if (notification.metrics.axis == Axis.horizontal) return;
        scrolled = notification.overscroll;
      }

      if (notification is ScrollUpdateNotification) {
        if (notification.metrics.axis == Axis.horizontal) return;
        scrolled = notification.scrollDelta ?? 0;
      }

      primaryScrollController.jumpTo(
        primaryScrollController.offset + scrolled,
      );
    } catch (exception) {
      log("Error while scrolling: $exception");
    }
  }
}
