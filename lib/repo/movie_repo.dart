import 'package:dartz/dartz.dart';
import '../core/error/error.dart';
import '../model/movie_model.dart';

abstract class MovieRepo {
  Future<Either<Error, List<MovieModel>>> fetchNowPlaying();

  Future<Either<Error, List<MovieModel>>> fetchTopRated();

  Future<Either<Error, List<MovieModel>>> fetchPopular();

  Future<Either<Error, List<MovieModel>>> fetchTrending();

  Future<Either<Error, List<MovieModel>>> fetchRecommended([String id = '550']);
}
