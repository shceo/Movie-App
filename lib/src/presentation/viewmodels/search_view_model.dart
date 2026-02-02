import 'package:flutter/foundation.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/data/repositories/movie_repository.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/view_state.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel(this._repository);

  final MovieRepository _repository;

  Loadable<List<Results>> results = const Loadable<List<Results>>(data: []);
  String? lastQuery;

  Future<void> search(String query) async {
    final normalized = query.trim();
    if (normalized.isEmpty) {
      clear();
      return;
    }

    lastQuery = normalized;
    results = const Loadable<List<Results>>.loading();
    notifyListeners();

    try {
      final response = await _repository.searchMovies(normalized);
      results = Loadable(data: response.results ?? []);
    } catch (e) {
      results = Loadable<List<Results>>(error: e.toString(), data: const []);
    }

    notifyListeners();
  }

  void clear() {
    results = const Loadable<List<Results>>(data: []);
    notifyListeners();
  }
}
