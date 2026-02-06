import 'package:frontend/features/catalog/presentation/catalog_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/catalog/',
  routes: [
    GoRoute(
      path: '/catalog',
      name: 'catalog',
      builder: (context, state) {
        // final pageIndex = state.pathParameters['page'] ?? '0';
        return CatalogPage();
      },
    ),

    GoRoute(
      path: '/',
      redirect: (_,_) => '/catalog'
    )
  ]
);
