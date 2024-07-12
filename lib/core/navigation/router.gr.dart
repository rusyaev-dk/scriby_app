// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllNotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllNotesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewNoteScreen(),
      );
    },
  };
}

/// generated route for
/// [AllNotesScreen]
class AllNotesRoute extends PageRouteInfo<void> {
  const AllNotesRoute({List<PageRouteInfo>? children})
      : super(
          AllNotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllNotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewNoteScreen]
class NewNoteRoute extends PageRouteInfo<void> {
  const NewNoteRoute({List<PageRouteInfo>? children})
      : super(
          NewNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
