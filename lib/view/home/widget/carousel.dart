import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/core/widget/error_msg.dart';
import 'package:movo/core/widget/loading.dart';
import 'package:movo/core/widget/movie_img.dart';
import 'package:movo/view/home/widget/caption.dart';
import '../../../model/movie_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../view_model/cubit/now_playing/now_playing_cubit.dart';
import '../../../view_model/cubit/recommended/recommended_cubit.dart';
import '../../movie_info/movie_info.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var scale = 0.0;

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
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.64,
      flexibleSpace: LayoutBuilder(
        builder: (context, BoxConstraints cons) {
          scale = cons.biggest.height;
          return BlocBuilder<NowPlayingCubit, NowPlayingState>(
            builder: (context, state) {
              if (state is NowPlayingSuccess) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.zero,
                  title: const Caption(title: 'Now Playing'),
                  background: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: double.infinity,
                    ),
                    items: state.movies.map((index) {
                      return Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              action(
                                context,
                                index.id!,
                                index,
                              );
                            },
                            child: MovieImg(img: index.posterPath!),
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              } else if (state is NowPlayingError) {
                return ErrorMsg(error: state.error);
              }
              return const Loading();
            },
          );
        },
      ),
    );
  }
}
