import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required movieRepository}) : super(MovieInitial()) {
    on<MovieEvent>(_movieLoadEvent);
  }

  _movieLoadEvent(event, emit) async {
    // await Future.delayed(const Duration(seconds: 10));
    emit(MovieLoadingState());
    on<MovieLoadEvent>(_movieLoadEvent);
  }
  //  final NewsRepository newsRepository;
}

class InternetCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity;
  late final StreamSubscription _connectivityStream;

  InternetCubit({required Connectivity connectivity})
      : _connectivity = connectivity,
        super(ConnectivityResult.none) {
    _connectivityStream =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult res) {
      if (res == ConnectivityResult.wifi || res == ConnectivityResult.mobile) {
        emit(InternetState(type: InternetTypes.connected) as ConnectivityResult);
      } else if (res == ConnectivityResult.none) {
        emit(InternetState(type: InternetTypes.offline) as ConnectivityResult);
      } else {
        emit(InternetState(type: InternetTypes.unknow) as ConnectivityResult);
      }
    });
  }

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}
