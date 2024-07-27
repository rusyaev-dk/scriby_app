import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
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
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
        AutoRoute(
          page: PrivacyRoute.page,
          path: '/settings/privacy',
        ),
        AutoRoute(
          page: AppearanceRoute.page,
          path: '/settings/appearance',
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
              transitionsBuilder: _transitionsBuilder,
              settings: page,
              pageBuilder: (context, animation, _) => child,
            );
          },
        ),
      ];

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.ease;

    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return ScaleTransition(
      alignment: const FractionalOffset(0.91, 0.91),
      scale: curvedAnimation,
      child: child,
    );
  }
}

class CustomNavigationObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
