import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/repo/movie_repo.dart';
import '../../../model/movie_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.movieRepo) : super(PopularLoading());

  final MovieRepo movieRepo;
  late final MovieModel movieModel;

  Future<void> fetchMovies() async {
    emit(PopularLoading());
    var result = await movieRepo.fetchPopular();

    result.fold(
      (error) {
        emit(PopularError(error.error));
      },
      (movies) {
        emit(PopularSuccess(movies));
      },
    );
  }
}
