import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/core/utils/service_locator.dart';
import 'package:movo/repo/movie_repo_imp.dart';
import 'package:movo/view/home/home_view.dart';
import 'package:movo/view_model/cubit/now_playing/now_playing_cubit.dart';
import 'package:movo/view_model/cubit/popular/popular_cubit.dart';
import 'package:movo/view_model/cubit/recommended/recommended_cubit.dart';
import 'package:movo/view_model/cubit/top_rated/top_rated_cubit.dart';
import 'package:movo/view_model/cubit/trending/trending_cubit.dart';

void main() {
  ServiceLocator.setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingCubit(
            getIt.get<MovieRepoImp>(),
          )..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => PopularCubit(
            getIt.get<MovieRepoImp>(),
          )..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit(
            getIt.get<MovieRepoImp>(),
          )..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => TrendingCubit(
            getIt.get<MovieRepoImp>(),
          )..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => RecommendedCubit(
            getIt.get<MovieRepoImp>(),
          ),
        ),
      ],
      child: const Movo(),
    ),
  );
}

class Movo extends StatelessWidget {
  const Movo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
              fontSize: 15,
              letterSpacing: 0.5,
              height: 1.4,
              fontWeight: FontWeight.bold),
        ),
        brightness: Brightness.dark,
      ),
      title: 'Movo',
      home: const HomeView(),
    );
  }
}
