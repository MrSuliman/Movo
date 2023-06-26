import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/core/widget/error_msg.dart';
import 'package:movo/core/widget/loading.dart';
import 'package:movo/core/widget/list_img.dart';
import 'package:movo/view/movie_info/widget/details.dart';
import '../../core/widget/movie_img.dart';
import '../../model/movie_model.dart';
import '../../view_model/cubit/recommended/recommended_cubit.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({Key? key}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecommendedCubit>(context).fetchMovies();
  }

  void action(String? id, MovieModel movieModel) {
    BlocProvider.of<RecommendedCubit>(context)
      ..currentId = id!
      ..fetchMovies()
      ..movieModel = movieModel;
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<RecommendedCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RecommendedCubit, RecommendedState>(
          builder: (context, state) {
            if (state is RecommendedSuccess) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.55,
                    flexibleSpace: FlexibleSpaceBar(
                      background: MovieImg(img: provider.movieModel.posterPath),
                    ),
                  ),
                  Details(
                    title: provider.movieModel.title!,
                    date: provider.movieModel.releaseDate!,
                    avgRate: provider.movieModel.voteAvg!,
                    avgCount: provider.movieModel.voteCount!,
                    overview: provider.movieModel.overview!,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Text(
                        'Movo Recommends:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.movies.length,
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            action(
                              state.movies[index].id!,
                              state.movies[index],
                            );
                          },
                          child: ListImg(img: state.movies[index].posterPath!),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is RecommendedError) {
              return ErrorMsg(error: state.error);
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}
