import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movo/repo/movie_repo.dart';
import '../core/error/error.dart';
import '../core/utils/api.dart';
import '../model/movie_model.dart';

class MovieRepoImp implements MovieRepo {
  const MovieRepoImp(this.api);

  final Api api;

  @override
  Future<Either<Error, List<MovieModel>>> fetchNowPlaying() async {
    try {
      List<MovieModel> movies = [];
      Map<String, dynamic> data = await api.get(endPoint: 'movie/now_playing');

      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie));
      }

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceError.fromDio(e));
      }
      return left(ServiceError(e.toString()));
    }
  }

  @override
  Future<Either<Error, List<MovieModel>>> fetchTopRated() async {
    try {
      List<MovieModel> movies = [];
      Map<String, dynamic> data = await api.get(endPoint: 'movie/top_rated');

      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie));
      }

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceError.fromDio(e));
      }
      return left(ServiceError(e.toString()));
    }
  }

  @override
  Future<Either<Error, List<MovieModel>>> fetchPopular() async {
    try {
      List<MovieModel> movies = [];
      Map<String, dynamic> data = await api.get(endPoint: 'movie/popular');

      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie));
      }

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceError.fromDio(e));
      }
      return left(ServiceError(e.toString()));
    }
  }

  @override
  Future<Either<Error, List<MovieModel>>> fetchTrending() async {
    try {
      List<MovieModel> movies = [];
      Map<String, dynamic> data = await api.get(endPoint: 'trending/movie/day');

      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie));
      }

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceError.fromDio(e));
      }
      return left(ServiceError(e.toString()));
    }
  }

  @override
  Future<Either<Error, List<MovieModel>>> fetchRecommended([id = '550']) async {
    try {
      List<MovieModel> movies = [];
      Map<String, dynamic> data =
          await api.get(endPoint: 'movie/$id/recommendations');

      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie));
      }

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceError.fromDio(e));
      }
      return left(ServiceError(e.toString()));
    }
  }
}
