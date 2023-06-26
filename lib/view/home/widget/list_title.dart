import 'package:flutter/material.dart';
import 'package:movo/core/utils/consts.dart';

class ListTitle extends StatelessWidget {
  const ListTitle(this.text, this.onTap, {super.key});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 4, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 5),
                Text(
                  'See More',
                  style: TextStyle(
                    fontSize: 13,
                    color: Consts.kColor,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: Consts.kColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
