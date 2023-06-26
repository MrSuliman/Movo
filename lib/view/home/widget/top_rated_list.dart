import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/error_msg.dart';
import '../../../core/widget/loading.dart';
import '../../../model/movie_model.dart';
import '../../../view_model/cubit/recommended/recommended_cubit.dart';
import '../../../view_model/cubit/top_rated/top_rated_cubit.dart';
import '../../movie_info/movie_info.dart';
import '../../see_more/SeeMore.dart';
import 'list_title.dart';
import '../../../core/widget/list_img.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({required this.title, Key? key}) : super(key: key);

  final String title;

  void action(BuildContext context, String? id, MovieModel movieModel) {
    BlocProvider.of<RecommendedCubit>(context)
      ..currentId = id!
      ..movieModel = movieModel;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MovieInfo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTitle(
              title,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeeMore(),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: BlocBuilder<TopRatedCubit, TopRatedState>(
                builder: (context, state) {
                  if (state is TopRatedSuccess) {
                    return ListView.separated(
                      itemCount: state.movies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          action(
                            context,
                            state.movies[index].id!,
                            state.movies[index],
                          );
                        },
                        child: ListImg(img: state.movies[index].posterPath),
                      ),
                    );
                  } else if (state is TopRatedError) {
                    return ErrorMsg(error: state.error);
                  }
                  return const Loading();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
