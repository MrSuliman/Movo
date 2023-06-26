import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movo/core/utils/consts.dart';
import 'loading.dart';

class MovieImg extends StatefulWidget {
  const MovieImg({this.img, Key? key}) : super(key: key);
  final String? img;

  @override
  State<MovieImg> createState() => _MovieImgState();
}

class _MovieImgState extends State<MovieImg> {
  var clicked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${Consts.imgUrlOrg}${widget.img!}',
          fit: BoxFit.fill,
          width: double.maxFinite,
          height: double.maxFinite,
          placeholder: (context, _) => const Loading(),
          errorWidget: (context, _, error) => const Icon(
            size: 36,
            Icons.error,
            color: Consts.kColor,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              color: (clicked == false) ? Colors.white : Colors.red,
              onPressed: () {
                setState(
                  () {
                    clicked == false ? clicked = true : clicked = false;
                  },
                );
              },
              icon: Icon(
                (clicked == false) ? Icons.favorite_outline : Icons.favorite,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getColor() {
    if (clicked == true) {
    } else {}
  }
}

// toggle button

//ToggleButtons(
//             isSelected: clicked,
//             focusColor: Colors.green,
//             fillColor: Colors.white.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(100),
//             borderColor: Colors.white,
//             selectedBorderColor: Colors.white.withOpacity(0.5),
//             color: Colors.white,
//             selectedColor: Colors.red,
//             splashColor: Colors.white.withOpacity(0.25),
//             children: [
//               Icon((clicked[0] == false)
//                   ? Icons.favorite_outline
//                   : Icons.favorite_outlined),
//             ],
//             onPressed: (int index) {
//               setState(
//                 () {
//                   clicked[index] = !clicked[index];
//                 },
//               );
//             },
//           )
