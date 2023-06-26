part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}


class PopularLoading extends PopularState {}

class PopularError extends PopularState {
  PopularError(this.error);

  final String error;
}

class PopularSuccess extends PopularState {
  PopularSuccess(this.movies);

  final List<MovieModel> movies;
}
