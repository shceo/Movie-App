import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_v1/src/exports.dart';

class Api {
  static final apiKey = dotenv.get('API_KEY');
  static final _trendingMovieUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey&language=ru';
  static final _popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=ru';
  static final _topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=ru';
  static final _upcomingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=ru';
  static final _searchMovieUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=ru';

  static Future<Cast> getMovieCredits(int movieId) async {
    Dio dio = Dio();
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey');
      if (response.statusCode == 200) {
        return Cast.fromJson(response.data);
      } else {
        throw Exception('Failed to load movie credits');
      }
    } catch (error) {
      throw Exception('Error fetching movie credits: ${error.toString()}');
    }
  }

  static Future<MovieData> searchMovies(String query) async {
    Dio dio = Dio();
    try {
      final response = await dio
          .get('$_searchMovieUrl&query=${Uri.encodeQueryComponent(query)}');
      if (response.statusCode == 200) {
        return MovieData.fromJson(response.data);
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (error) {
      throw Exception('Error searching movies: ${error.toString()}');
    }
  }

  static Future<MovieData> getTrendingMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(_trendingMovieUrl);
      if (response.statusCode == 200) {
        return MovieData.fromJson(response.data);
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (error) {
      throw Exception('Error fetching trending movies: ${error.toString()}');
    }
  }

  static Future<MovieData> getPopularMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(_popularMovieUrl);
      if (response.statusCode == 200) {
        return MovieData.fromJson(response.data);
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (error) {
      throw Exception('Error fetching popular movies: ${error.toString()}');
    }
  }

  static Future<MovieData> getTopRatedMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(_topRatedMovieUrl);
      if (response.statusCode == 200) {
        return MovieData.fromJson(response.data);
      } else {
        throw Exception('Failed to load top-rated movies');
      }
    } catch (error) {
      throw Exception('Error fetching top-rated movies: ${error.toString()}');
    }
  }

  static Future<MovieData> getUpcomingMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(_upcomingMovieUrl);
      if (response.statusCode == 200) {
        return MovieData.fromJson(response.data);
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (error) {
      throw Exception('Error fetching upcoming movies: ${error.toString()}');
    }
  }
}
