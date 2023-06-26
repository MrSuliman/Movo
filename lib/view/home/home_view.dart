import 'package:flutter/material.dart';
import 'package:movo/view/drawer/drawer.dart';
import 'package:movo/view/home/widget/carousel.dart';
import 'package:movo/view/home/widget/trending_list.dart';
import 'package:movo/view/home/widget/popular_list.dart';
import 'package:movo/view/home/widget/top_rated_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            Carousel(),
            PopularList(title: 'Popular on Movo'),
            TopRatedList(title: 'Top Rated'),
            TrendingList(title: 'Trending This Day'),
          ],
        ),
      ),
    );
  }
}
