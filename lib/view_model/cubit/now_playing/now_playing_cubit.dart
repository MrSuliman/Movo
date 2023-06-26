import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/movie_model.dart';
import '../../../repo/movie_repo.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.movieRepo) : super(NowPlayingLoading());

  final MovieRepo movieRepo;

  Future<void> fetchMovies() async {
    var result = await movieRepo.fetchNowPlaying();

    result.fold(
      (error) {
        emit(NowPlayingError(error.error));
      },
      (movies) {
        emit(NowPlayingSuccess(movies));
      },
    );
  }
}
