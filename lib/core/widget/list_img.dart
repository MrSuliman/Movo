import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movo/core/utils/consts.dart';
import 'loading.dart';

class ListImg extends StatelessWidget {
  const ListImg({this.img, Key? key}) : super(key: key);

  final String? img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: CachedNetworkImage(
        imageUrl: '${Consts.imgUrlOrg}${img!}',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 0.6,
        height: double.maxFinite,
        placeholder: (context, _) => const Loading(),
        errorWidget: (context, _, error) => const Icon(
          Icons.error,
          size: 36,
          color: Consts.kColor,
        ),
      ),
    );
  }
}
