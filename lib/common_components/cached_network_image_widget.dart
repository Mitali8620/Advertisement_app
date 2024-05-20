import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImageWidget({
  required String netWorkImageUrl,
  double? height,
  double? width,
}) {
  return Container(
    height:height ?? 240,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        height: height ?? 240,
        width: width ?? 150,
        imageUrl: netWorkImageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return Icon(Icons.image_not_supported_outlined);
        },
        /* placeholder: (context, url) {
          return Icon(Icons.image_not_supported_outlined);
        },*/
      ),
    ),
  );
}
