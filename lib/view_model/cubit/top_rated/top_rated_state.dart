part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedError extends TopRatedState {
  TopRatedError(this.error);

  final String error;
}

class TopRatedSuccess extends TopRatedState {
  TopRatedSuccess(this.movies);

  final List<MovieModel> movies;
}
