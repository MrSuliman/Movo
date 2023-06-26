part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingError extends NowPlayingState {
  NowPlayingError(this.error);

  final String error;
}

class NowPlayingSuccess extends NowPlayingState {
  NowPlayingSuccess(this.movies);

  final List<MovieModel> movies;
}
