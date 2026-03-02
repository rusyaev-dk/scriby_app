import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter createRouter({
    required List<NavigatorObserver> navigatorObservers,
  }) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.home,
      observers: navigatorObservers,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.search,
          name: 'search',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SearchNotesScreen(),
              transitionDuration: const Duration(milliseconds: 300),
              reverseTransitionDuration: const Duration(milliseconds: 200),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return CustomPageTransitionsBuilder.fadeTransitionsBuilder(
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: AppRoutes.generalSettings,
          name: 'general-settings',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const GeneralSettingsScreen(),
              transitionDuration: Duration(
                milliseconds: Platform.isIOS ? 300 : 250,
              ),
              reverseTransitionDuration: Duration(
                milliseconds: Platform.isIOS ? 250 : 200,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                if (Platform.isIOS) {
                  return CustomPageTransitionsBuilder
                      .slideWithFadeTransitionsBuilder(
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
                );
              },
            );
          },
          routes: [
            GoRoute(
              path: 'privacy',
              name: 'privacy-settings',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const PrivacyScreen(),
                  transitionDuration: Duration(
                    milliseconds: Platform.isIOS ? 300 : 250,
                  ),
                  reverseTransitionDuration: Duration(
                    milliseconds: Platform.isIOS ? 250 : 200,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    if (Platform.isIOS) {
                      return CustomPageTransitionsBuilder
                          .slideWithFadeTransitionsBuilder(
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
                    );
                  },
                );
              },
            ),
            GoRoute(
              path: 'appearance',
              name: 'appearance-settings',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const AppearanceScreen(),
                  transitionDuration: Duration(
                    milliseconds: Platform.isIOS ? 300 : 250,
                  ),
                  reverseTransitionDuration: Duration(
                    milliseconds: Platform.isIOS ? 250 : 200,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    if (Platform.isIOS) {
                      return CustomPageTransitionsBuilder
                          .slideWithFadeTransitionsBuilder(
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
                    );
                  },
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.editNote,
          name: 'edit-note',
          pageBuilder: (context, state) {
            final Note? initialNote = state.extra as Note?;

            return CustomTransitionPage(
              key: state.pageKey,
              child: EditNoteScreen(
                initialNoteToEdit: initialNote,
              ),
              transitionDuration: const Duration(milliseconds: 450),
              reverseTransitionDuration: const Duration(milliseconds: 300),
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
            );
          },
        ),
      ],
    );
  }
}

class CustomNavigationObserver extends NavigatorObserver {
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
}
