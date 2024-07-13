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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MyNotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyNotesScreen(),
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
/// [MyNotesScreen]
class MyNotesRoute extends PageRouteInfo<void> {
  const MyNotesRoute({List<PageRouteInfo>? children})
      : super(
          MyNotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyNotesRoute';

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
