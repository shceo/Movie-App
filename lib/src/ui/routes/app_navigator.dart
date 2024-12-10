import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';

class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'search',
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: 'infoMovie',
            builder: (context, state) => const InfoMovie(),
          ),
          GoRoute(
            path: 'favorite',
            builder: (context, state) => const FavoriteMoviePage(),
          ),
          GoRoute(
            path: 'wantBuy',
            builder: (context, state) => const WantBuy(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const UserProfile(),
        routes: [
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: 'premium',
            builder: (context, state) => const PremiumPage(),
          ),
        ],
      ),
    ],
  );
}


