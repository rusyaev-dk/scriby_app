import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/all_notes/presentation/presentation.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/features/folders/presentation/presentation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/pinned_notes/presentation/presentation.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';

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
              page: AllNotesRoute.page,
              path: 'all_notes',
            ),
            AutoRoute(
              page: PinnedNotesRoute.page,
              path: 'pinned_notes',
            ),
            AutoRoute(
              page: FoldersRoute.page,
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
          page: EditNoteRoute.page,
          path: '/edit_note',
          opaque: true,
          customRouteBuilder:
              (BuildContext context, Widget child, AutoRoutePage page) {
            final alignment = (page.arguments as EditNoteRouteArgs).alignment;

            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 450),
              fullscreenDialog: page.fullscreenDialog,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return CustomPageTransitionsBuilder.scaleTransitionsBuilder(
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                  alignment,
                );
              },
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

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _logger.log("Tab route visited: ${route.name}");
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _logger.log("Tab route re-visited: ${route.name}");
  }
}
