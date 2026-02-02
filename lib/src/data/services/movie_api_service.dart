import 'package:dio/dio.dart';
import 'package:movie_app_v1/src/core/constants/api_constants.dart';
import 'package:movie_app_v1/src/data/models/cast.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';

class MovieApiService {
  MovieApiService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<MovieData> fetchTrendingMovies() =>
      _getMovies('/trending/movie/day');

  Future<MovieData> fetchPopularMovies() => _getMovies('/movie/popular');

  Future<MovieData> fetchTopRatedMovies() => _getMovies('/movie/top_rated');

  Future<MovieData> fetchUpcomingMovies() => _getMovies('/movie/upcoming');

  Future<MovieData> searchMovies(String query) =>
      _getMovies('/search/movie', queryParameters: {'query': query});

  Future<Cast> fetchMovieCredits(int movieId) async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}/movie/$movieId/credits',
      queryParameters: _defaultQueryParameters(),
    );

    if (response.statusCode == 200) {
      return Cast.fromJson(response.data);
    }

    throw Exception('Failed to load movie credits');
  }

  Future<MovieData> _getMovies(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      '${ApiConstants.baseUrl}$path',
      queryParameters: _defaultQueryParameters(extra: queryParameters),
    );

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    }

    throw Exception('Failed to load movies');
  }

  Map<String, dynamic> _defaultQueryParameters({Map<String, dynamic>? extra}) {
    return {
      'api_key': ApiConstants.apiKey,
      'language': ApiConstants.defaultLanguage,
      ...?extra,
    };
  }
}
