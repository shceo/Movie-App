/// Константы для запросов к TMDB API.
abstract class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const defaultLanguage = 'ru';

  /// Публичный ключ TMDB. Для продакшена лучше читать его из `.env`.
  static const apiKey =
      String.fromEnvironment('TMDB_KEY', defaultValue: '04aea9bdbb080f621f2ca2e47c81262f');
}
