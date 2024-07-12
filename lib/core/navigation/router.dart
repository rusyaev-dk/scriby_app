import 'package:auto_route/auto_route.dart';
import 'package:scriby_app/features/my_notes/presentation/screens/all_notes_screen.dart';
import 'package:scriby_app/features/home/presentation/screens/home_screen.dart';
import 'package:scriby_app/features/new_note/presentation/screens/new_note_screen.dart';

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
              page: NewNoteRoute.page,
              path: 'new_note',
            ),
          ],
        ),
      ];
}
