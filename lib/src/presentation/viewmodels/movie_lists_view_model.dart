import 'package:flutter/foundation.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/view_state.dart';

class MovieListsViewModel extends ChangeNotifier {
  MovieListsViewModel(this._repository);

  final MovieRepository _repository;

  Loadable<MovieData> trending = const Loadable<MovieData>();
  Loadable<MovieData> popular = const Loadable<MovieData>();
  Loadable<MovieData> topRated = const Loadable<MovieData>();
  Loadable<MovieData> upcoming = const Loadable<MovieData>();

  Future<void> loadTrending({bool force = false}) async {
    if (!force && trending.data != null) return;
    trending = const Loadable<MovieData>.loading();
    notifyListeners();
    try {
      final movies = await _repository.getTrendingMovies();
      trending = Loadable(data: movies);
    } catch (e) {
      trending = Loadable(error: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadPopular({bool force = false}) async {
    if (!force && popular.data != null) return;
    popular = const Loadable<MovieData>.loading();
    notifyListeners();
    try {
      final movies = await _repository.getPopularMovies();
      popular = Loadable(data: movies);
    } catch (e) {
      popular = Loadable(error: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadTopRated({bool force = false}) async {
    if (!force && topRated.data != null) return;
    topRated = const Loadable<MovieData>.loading();
    notifyListeners();
    try {
      final movies = await _repository.getTopRatedMovies();
      topRated = Loadable(data: movies);
    } catch (e) {
      topRated = Loadable(error: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadUpcoming({bool force = false}) async {
    if (!force && upcoming.data != null) return;
    upcoming = const Loadable<MovieData>.loading();
    notifyListeners();
    try {
      final movies = await _repository.getUpcomingMovies();
      upcoming = Loadable(data: movies);
    } catch (e) {
      upcoming = Loadable(error: e.toString());
    }
    notifyListeners();
  }
}
