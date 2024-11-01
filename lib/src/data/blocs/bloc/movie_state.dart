part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

class MovieLoadingState extends MovieState {}

enum InternetTypes {
  connected,
  offline,
  unknow,
}

class InternetState {
  final InternetTypes type;

  InternetState({this.type = InternetTypes.unknow});
}
