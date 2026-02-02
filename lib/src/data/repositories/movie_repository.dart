import 'package:movie_app_v1/src/data/models/cast.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/data/services/movie_api_service.dart';

/// Репозиторий инкапсулирует бизнес-логику и кэширование (пока без локального кеша).
class MovieRepository {
  MovieRepository(this._apiService);

  final MovieApiService _apiService;

  Future<MovieData> getTrendingMovies() => _apiService.fetchTrendingMovies();

  Future<MovieData> getPopularMovies() => _apiService.fetchPopularMovies();

  Future<MovieData> getTopRatedMovies() => _apiService.fetchTopRatedMovies();

  Future<MovieData> getUpcomingMovies() => _apiService.fetchUpcomingMovies();

  Future<MovieData> searchMovies(String query) => _apiService.searchMovies(query);

  Future<Cast> getMovieCredits(int movieId) =>
      _apiService.fetchMovieCredits(movieId);
}
