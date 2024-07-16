import 'package:auto_route/auto_route.dart';
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
          page: NewNoteRoute.page,
          path: '/new_note',
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
      ];
}
