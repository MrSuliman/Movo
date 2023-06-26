import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/movie_model.dart';
import '../../../repo/movie_repo.dart';
part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(this.movieRepo) : super(TrendingLoading());

  final MovieRepo movieRepo;

  Future<void> fetchMovies() async {
    emit(TrendingLoading());
    var result = await movieRepo.fetchTrending();

    result.fold(
      (error) {
        emit(TrendingError(error.error));
      },
      (movies) {
        emit(TrendingSuccess(movies));
      },
    );
  }
}
