import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_v1/api/cast_data.dart';
import 'movie_data.dart';

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

  // static final _movieCreditsUrl ='https://api.themoviedb.org/3/movie/872585/credits?api_key=$apiKey';

  static Future<Cast> getMovieCredits(int movieId) async {
    Dio dio = Dio();
    final response = await dio
        .get('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey');
    if (response.statusCode == 200) {
      return Cast.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }

  static Future<MovieData> searchMovies(String query) async {
    Dio dio = Dio();
    final response = await dio
        .get('$_searchMovieUrl&query=${Uri.encodeQueryComponent(query)}');

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }

  static Future<MovieData> getTrendingMovies() async {
    Dio dio = Dio();
    final response = await dio.get(_trendingMovieUrl);

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }

  static Future<MovieData> getPopularMovies() async {
    Dio dio = Dio();
    final response = await dio.get(_popularMovieUrl);

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }

  static Future<MovieData> getTopRatedMovies() async {
    Dio dio = Dio();
    final response = await dio.get(_topRatedMovieUrl);

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }

  static Future<MovieData> getUpcomingMovies() async {
    Dio dio = Dio();
    final response = await dio.get(_upcomingMovieUrl);

    if (response.statusCode == 200) {
      return MovieData.fromJson(response.data);
    } else {
      throw Exception('Something Happened');
    }
  }
}
