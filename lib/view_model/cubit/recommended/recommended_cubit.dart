import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/repo/movie_repo.dart';
import '../../../model/movie_model.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.movieRepo) : super(RecommendedLoading());

  String currentId = '';
  final MovieRepo movieRepo;
  late MovieModel movieModel;

  Future<void> fetchMovies() async {
    emit(RecommendedLoading());
    var result = await movieRepo.fetchRecommended(currentId);

    result.fold(
      (error) {
        emit(RecommendedError(error.error));
      },
      (movies) {
        emit(RecommendedSuccess(movies));
      },
    );
  }
}
