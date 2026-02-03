import 'package:movie_app_v1/src/core/services/connectivity_service.dart';
import 'package:movie_app_v1/src/data/models/cast.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/data/services/movie_api_service.dart';

/// Репозиторий инкапсулирует бизнес-логику и кэширование (пока без локального кеша).
class MovieRepository {
  MovieRepository(this._apiService, this._connectivityService);

  final MovieApiService _apiService;
  final ConnectivityService _connectivityService;

  Future<MovieData> getTrendingMovies() async {
    await _connectivityService.ensureOnline();
    return _apiService.fetchTrendingMovies();
  }

  Future<MovieData> getPopularMovies() async {
    await _connectivityService.ensureOnline();
    return _apiService.fetchPopularMovies();
  }

  Future<MovieData> getTopRatedMovies() async {
    await _connectivityService.ensureOnline();
    return _apiService.fetchTopRatedMovies();
  }

  Future<MovieData> getUpcomingMovies() async {
    await _connectivityService.ensureOnline();
    return _apiService.fetchUpcomingMovies();
  }

  Future<MovieData> searchMovies(String query) async {
    await _connectivityService.ensureOnline();
    return _apiService.searchMovies(query);
  }

  Future<Cast> getMovieCredits(int movieId) async {
    await _connectivityService.ensureOnline();
    return _apiService.fetchMovieCredits(movieId);
  }
}
