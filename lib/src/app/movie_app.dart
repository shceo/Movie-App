import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/data/services/movie_api_service.dart';
import 'package:movie_app_v1/src/presentation/router/app_router.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/movie_lists_view_model.dart';

class MovieApp extends StatelessWidget {
  MovieApp({super.key})
      : _movieRepository = MovieRepository(MovieApiService());

  final MovieRepository _movieRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieRepository>.value(value: _movieRepository),
        ChangeNotifierProvider<MovieListsViewModel>(
          create: (_) => MovieListsViewModel(_movieRepository),
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
