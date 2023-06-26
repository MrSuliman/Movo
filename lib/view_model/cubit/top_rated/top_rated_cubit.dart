import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:movo/repo/movie_repo.dart';
import '../../../model/movie_model.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.movieRepo) : super(TopRatedLoading());

  final MovieRepo movieRepo;

  Future<void> fetchMovies() async {
    emit(TopRatedLoading());
    var result = await movieRepo.fetchTopRated();

    result.fold(
      (error) {
        emit(TopRatedError(error.error));
      },
      (movies) {
        emit(TopRatedSuccess(movies));
      },
    );
  }
}
