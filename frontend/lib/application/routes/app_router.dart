import 'package:frontend/features/catalog/presentation/catalog_page.dart';
import 'package:frontend/features/home/presentation/home_page.dart';
import 'package:frontend/features/settings/presentation/settings_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/catalog',
          name: 'catalog',
          builder: (context, state) {
            return const CatalogPage();
          },
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) {
            return const SettingsPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, _) => '/catalog',
    ),
  ],
);
