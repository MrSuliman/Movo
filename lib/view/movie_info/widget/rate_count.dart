import 'package:flutter/material.dart';

class RateCount extends StatelessWidget {
  const RateCount({
    required this.icon,
    required this.text,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Theme.of(context).iconTheme.size,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
