import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/search_view_model.dart';
import 'package:movie_app_v1/src/presentation/views/errors/buy_premium_page.dart';
import 'package:movie_app_v1/src/presentation/views/favorite/favorite_movie_page.dart';
import 'package:movie_app_v1/src/presentation/views/home/home_page.dart';
import 'package:movie_app_v1/src/presentation/views/info/info_movie_page.dart';
import 'package:movie_app_v1/src/presentation/views/profile/user_profile_page.dart';
import 'package:movie_app_v1/src/presentation/views/search/search_page.dart';
import 'package:movie_app_v1/src/presentation/views/settings/settings_page.dart';
import 'package:movie_app_v1/src/presentation/views/want_buy/want_to_buy_page.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'search',
            builder: (context, state) => ChangeNotifierProvider(
              create: (_) => SearchViewModel(
                context.read<MovieRepository>(),
              ),
              child: const SearchPage(),
            ),
          ),
          GoRoute(
            path: 'infoMovie',
            builder: (context, state) {
              final movie = state.extra is Results ? state.extra as Results? : null;
              return ChangeNotifierProvider(
                create: (_) => MovieDetailViewModel(
                  context.read<MovieRepository>(),
                  movie?.id ?? 0,
                )..loadCast(),
                child: InfoMovie(movie: movie),
              );
            },
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


