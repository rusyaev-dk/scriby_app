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
    AllNotesTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllNotesTab(),
      );
    },
    FoldersTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoldersTab(),
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
    PinnedNotesTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PinnedNotesTab(),
      );
    },
    PrivacyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AllNotesTabRoute]
class AllNotesTabRoute extends PageRouteInfo<void> {
  const AllNotesTabRoute({List<PageRouteInfo>? children})
      : super(
          AllNotesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllNotesTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoldersTabRoute]
class FoldersTabRoute extends PageRouteInfo<void> {
  const FoldersTabRoute({List<PageRouteInfo>? children})
      : super(
          FoldersTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersTab';

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

/// generated route for
/// [PinnedNotesTabRoute]
class PinnedNotesTabRoute extends PageRouteInfo<void> {
  const PinnedNotesTabRoute({List<PageRouteInfo>? children})
      : super(
          PinnedNotesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinnedNotesTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyScreen]
class PrivacyRoute extends PageRouteInfo<void> {
  const PrivacyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
