import 'package:flutter/material.dart';

class Caption extends StatefulWidget {
  const Caption({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  State<Caption> createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  var scale = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        scale = cons.biggest.height;
        return AnimatedOpacity(
          opacity:
              scale >= MediaQuery.of(context).size.height * 0.32 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.red.withOpacity(0.7),
                ),
                const SizedBox(width: 3),
                Text(
                  widget.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 3),
              ],
            ),
          ),
        );
      },
    );
  }
}
