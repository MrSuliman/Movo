part of 'recommended_cubit.dart';

@immutable
abstract class RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedError extends RecommendedState {
  final String error;

  RecommendedError(this.error);
}

class RecommendedSuccess extends RecommendedState {
  final List<MovieModel> movies;

  RecommendedSuccess(this.movies);
}
