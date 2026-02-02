import 'package:flutter/foundation.dart';
import 'package:movie_app_v1/src/data/models/cast.dart';
import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/view_state.dart';

class MovieDetailViewModel extends ChangeNotifier {
  MovieDetailViewModel(this._repository, this.movieId);

  final MovieRepository _repository;
  final int movieId;

  Loadable<Cast> cast = const Loadable<Cast>();

  Future<void> loadCast({bool force = false}) async {
    if (movieId <= 0) {
      cast = const Loadable(error: 'Неверный идентификатор фильма');
      notifyListeners();
      return;
    }
    if (!force && cast.data != null) return;

    cast = const Loadable<Cast>.loading();
    notifyListeners();
    try {
      final result = await _repository.getMovieCredits(movieId);
      cast = Loadable(data: result);
    } catch (e) {
      cast = Loadable(error: e.toString());
    }
    notifyListeners();
  }
}
