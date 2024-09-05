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
        child: const AllNotesTab(),
      );
    },
    EditNoteRoute.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditNoteScreen(
          key: args.key,
          initialNoteToEdit: args.initialNoteToEdit,
        ),
      );
    },
    FoldersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoldersTab(),
      );
    },
    GeneralSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralSettingsScreen(),
      );
    },
    GeneralSettingsShellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralSettingsShellScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    PinnedNotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PinnedNotesTab(),
      );
    },
    PrivacySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyScreen(),
      );
    },
    SearchNotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchNotesScreen(),
      );
    },
    SearchNotesShellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchNotesSheelScreen(),
      );
    },
  };
}

/// generated route for
/// [AllNotesTab]
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
/// [EditNoteScreen]
class EditNoteRoute extends PageRouteInfo<EditNoteRouteArgs> {
  EditNoteRoute({
    Key? key,
    required Note? initialNoteToEdit,
    List<PageRouteInfo>? children,
  }) : super(
          EditNoteRoute.name,
          args: EditNoteRouteArgs(
            key: key,
            initialNoteToEdit: initialNoteToEdit,
          ),
          initialChildren: children,
        );

  static const String name = 'EditNoteRoute';

  static const PageInfo<EditNoteRouteArgs> page =
      PageInfo<EditNoteRouteArgs>(name);
}

class EditNoteRouteArgs {
  const EditNoteRouteArgs({
    this.key,
    required this.initialNoteToEdit,
  });

  final Key? key;

  final Note? initialNoteToEdit;

  @override
  String toString() {
    return 'EditNoteRouteArgs{key: $key, initialNoteToEdit: $initialNoteToEdit}';
  }
}

/// generated route for
/// [FoldersTab]
class FoldersRoute extends PageRouteInfo<void> {
  const FoldersRoute({List<PageRouteInfo>? children})
      : super(
          FoldersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeneralSettingsScreen]
class GeneralSettingsRoute extends PageRouteInfo<void> {
  const GeneralSettingsRoute({List<PageRouteInfo>? children})
      : super(
          GeneralSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeneralSettingsShellScreen]
class GeneralSettingsShellRoute extends PageRouteInfo<void> {
  const GeneralSettingsShellRoute({List<PageRouteInfo>? children})
      : super(
          GeneralSettingsShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralSettingsShellRoute';

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
/// [PinnedNotesTab]
class PinnedNotesRoute extends PageRouteInfo<void> {
  const PinnedNotesRoute({List<PageRouteInfo>? children})
      : super(
          PinnedNotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinnedNotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyScreen]
class PrivacySettingsRoute extends PageRouteInfo<void> {
  const PrivacySettingsRoute({List<PageRouteInfo>? children})
      : super(
          PrivacySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchNotesScreen]
class SearchNotesRoute extends PageRouteInfo<void> {
  const SearchNotesRoute({List<PageRouteInfo>? children})
      : super(
          SearchNotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchNotesSheelScreen]
class SearchNotesShellRoute extends PageRouteInfo<void> {
  const SearchNotesShellRoute({List<PageRouteInfo>? children})
      : super(
          SearchNotesShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchNotesShellRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
