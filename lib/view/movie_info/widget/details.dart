import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movo/view/movie_info/widget/rate_count.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.overview,
    required this.avgRate,
    required this.avgCount,
    required this.date,
    required this.title,
  }) : super(key: key);

  final String title, overview, avgRate, avgCount, date;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  DateFormat('yyyy').format(DateTime.parse(date)).toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(flex: 1),
                RateCount(
                  icon: Icons.star,
                  iconColor: Colors.yellow,
                  text: avgRate,
                ),
                const Spacer(flex: 1),
                RateCount(
                  icon: Icons.favorite,
                  iconColor: Colors.red,
                  text: avgCount,
                ),
                const Spacer(flex: 3),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              overview,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
