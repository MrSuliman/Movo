part of 'trending_cubit.dart';

@immutable
abstract class TrendingState {}


class TrendingLoading extends TrendingState {}

class TrendingError extends TrendingState {
  TrendingError(this.error);

  final String error;
}

class TrendingSuccess extends TrendingState {
  TrendingSuccess(this.movies);

  final List<MovieModel> movies;
}
