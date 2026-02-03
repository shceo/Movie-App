import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_app_v1/src/core/services/connectivity_service.dart';
import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/data/services/movie_api_service.dart';
import 'package:movie_app_v1/src/presentation/router/app_router.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/movie_lists_view_model.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectivityService>(
          create: (_) => ConnectivityService(),
        ),
        Provider<MovieRepository>(
          create: (context) => MovieRepository(
            MovieApiService(),
            context.read<ConnectivityService>(),
          ),
        ),
        ChangeNotifierProvider<MovieListsViewModel>(
          create: (context) => MovieListsViewModel(
            context.read<MovieRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
