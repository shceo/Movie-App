import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/ui/pages/UserProfile/user_profile.dart';
import 'package:movie_app_v1/ui/pages/error_pages/buy_premium_page.dart';
import 'package:movie_app_v1/ui/pages/favoriteMovie/favorite_movie.dart';
import 'package:movie_app_v1/ui/pages/home_page/home_page.dart';
import 'package:movie_app_v1/ui/pages/info_movie/info_movie.dart';
import 'package:movie_app_v1/ui/pages/search_page/search_page.dart';
import 'package:movie_app_v1/ui/pages/settingsPage/settings_page.dart';
import 'package:movie_app_v1/ui/pages/wantBuy/want_toBuy.dart';
import 'package:movie_app_v1/ui/routes/app_routes.dart';


class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.infoMovie,
        builder: (context, state) => const InfoMovie(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const UserProfile(),
      ),
        GoRoute(
        path: AppRoutes.settingsP,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.premiumB,
        builder: (context, state) => const PremiumPage(),
      ),
      GoRoute(
        path: AppRoutes.favorite,
        builder: (context, state) =>  const FavoriteMoviePage(),
      ),
      GoRoute(
        path: AppRoutes.wantBuy,
        builder: (context, state) =>  const WantBuy(),
      ),
    ],
  );
}
