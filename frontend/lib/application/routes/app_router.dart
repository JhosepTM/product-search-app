import 'package:frontend/features/catalog/presentation/catalog_page.dart';
import 'package:frontend/features/home/presentation/home_page.dart';
import 'package:frontend/features/settings/presentation/pages/settings_page.dart';
import 'package:frontend/features/splash/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/catalog',
              name: 'catalog',
              builder: (context, state) {
                return const CatalogPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
