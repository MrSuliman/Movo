import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movo/repo/movie_repo_imp.dart';
import 'api.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    getIt.registerLazySingleton<Api>(
      () => Api(
        Dio(),
      ),
    );
    getIt.registerLazySingleton<MovieRepoImp>(
      () => MovieRepoImp(
        getIt.get<Api>(),
      ),
    );
  }
}
