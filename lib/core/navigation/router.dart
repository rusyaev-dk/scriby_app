import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/folders/presentation/screens/folders_tab.dart';
import 'package:scriby_app/features/pinned_notes/presentation/screens/pinned_notes_tab.dart';
import 'package:scriby_app/features/new_note/presentation/screens/screens.dart';
import 'package:scriby_app/features/settings/presentation/screens/screens.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: AllNotesTabRoute.page,
              path: 'all_notes',
            ),
            AutoRoute(
              page: PinnedNotesTabRoute.page,
              path: 'pinned_notes',
            ),
            AutoRoute(
              page: FoldersTabRoute.page,
              path: 'folders',
            ),
          ],
        ),
        CustomRoute(
          page: SettingsRoute.page,
          path: '/settings',
          customRouteBuilder:
              (BuildContext context, Widget child, AutoRoutePage page) {
            return PageRouteBuilder(
              transitionDuration:
                  Duration(milliseconds: Platform.isIOS ? 300 : 250),
              fullscreenDialog: page.fullscreenDialog,
              transitionsBuilder: Platform.isIOS
                  ? CustomPageTransitionsBuilder.slideWithFadeTransitionsBuilder
                  : CustomPageTransitionsBuilder.fadeTransitionsBuilder,
              settings: page,
              pageBuilder: (context, animation, _) => child,
            );
          },
        ),
        CustomRoute(
          page: PrivacyRoute.page,
          path: '/settings/privacy',
          customRouteBuilder:
              (BuildContext context, Widget child, AutoRoutePage page) {
            return PageRouteBuilder(
              transitionDuration:
                  Duration(milliseconds: Platform.isIOS ? 300 : 250),
              fullscreenDialog: page.fullscreenDialog,
              transitionsBuilder: Platform.isIOS
                  ? CustomPageTransitionsBuilder.slideWithFadeTransitionsBuilder
                  : CustomPageTransitionsBuilder.fadeTransitionsBuilder,
              settings: page,
              pageBuilder: (context, animation, _) => child,
            );
          },
        ),
        CustomRoute(
          page: NewNoteRoute.page,
          path: '/new_note',
          opaque: true,
          customRouteBuilder:
              (BuildContext context, Widget child, AutoRoutePage page) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 450),
              fullscreenDialog: page.fullscreenDialog,
              transitionsBuilder:
                  CustomPageTransitionsBuilder.scaleTransitionsBuilder,
              settings: page,
              pageBuilder: (context, animation, _) => child,
            );
          },
        ),
      ];
}

class CustomNavigationObserver extends AutoRouterObserver {
  CustomNavigationObserver({required ILogger logger}) : _logger = logger;

  final ILogger _logger;

  @override
  void didPush(Route route, Route? previousRoute) {
    _logger.log("Route pushed: ${route.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logger.log("Route popped: ${route.settings.name}");
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _logger.log("Tab route visited: ${route.name}");
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _logger.log("Tab route re-visited: ${route.name}");
  }
}
