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
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          initial: true,
          page: HomeRoute.page,
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
        SearchRoutes.route,
        SettingsRoutes.route,
        CustomRoute(
          path: '/edit_note',
          page: EditNoteRoute.page,
          opaque: true,
          customRouteBuilder:
              (BuildContext context, Widget child, AutoRoutePage page) {
            final initialNote =
                (page.arguments as EditNoteRouteArgs).initialNoteToEdit;

            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 450),
              fullscreenDialog: page.fullscreenDialog,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                if (initialNote == null) {
                  return CustomPageTransitionsBuilder.scaleTransitionsBuilder(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  );
                }
                return CustomPageTransitionsBuilder.fadeTransitionsBuilder(
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                  Curves.easeInOutQuint,
                );
              },
              settings: page,
              pageBuilder: (context, animation, _) => child,
            );
          },
        ),
      ];
}

class SearchRoutes {
  static final route = CustomRoute(
    path: "/search",
    page: SearchNotesShellRoute.page,
    children: _childrenRoutes,
    customRouteBuilder:
        (BuildContext context, Widget child, AutoRoutePage page) {
      return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        fullscreenDialog: page.fullscreenDialog,
        transitionsBuilder: CustomPageTransitionsBuilder.fadeTransitionsBuilder,
        settings: page,
        pageBuilder: (context, animation, _) => child,
      );
    },
  );

  static final _childrenRoutes = [
    AutoRoute(
      path: '',
      page: SearchNotesRoute.page,
    ),
  ];
}

class SettingsRoutes {
  static final route = CustomRoute(
    path: "/general_settings",
    page: GeneralSettingsShellRoute.page,
    children: _childrenRoutes,
    customRouteBuilder:
        (BuildContext context, Widget child, AutoRoutePage page) {
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: Platform.isIOS ? 300 : 250),
        fullscreenDialog: page.fullscreenDialog,
        transitionsBuilder: Platform.isIOS
            ? CustomPageTransitionsBuilder.slideWithFadeTransitionsBuilder
            : CustomPageTransitionsBuilder.fadeTransitionsBuilder,
        settings: page,
        pageBuilder: (context, animation, _) => child,
      );
    },
  );

  static final _childrenRoutes = [
    AutoRoute(
      path: '',
      page: GeneralSettingsRoute.page,
    ),
    CustomRoute(
      path: 'privacy',
      page: PrivacySettingsRoute.page,
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
