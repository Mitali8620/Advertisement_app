import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImageWidget({
  required String netWorkImageUrl,
  double? height,
  double? width,
  BoxFit? boxFit,
}) {
  return   (kIsWeb) ?Container(
    height:height ?? 240,
    width: width ?? 150,
    
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: AppTheme.primaryColor.withOpacity(0.1)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        height: height ?? 240,
        width: width ?? 150,
        imageUrl: netWorkImageUrl,
        fit:boxFit ?? BoxFit.fill,
        httpHeaders:  const {
          'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
          "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token"
        },
        errorWidget: (context, url, error) {

          return const Icon(Icons.image_not_supported_outlined);
        },
        /* placeholder: (context, url) {
          return Icon(Icons.image_not_supported_outlined);
        },*/
      ),
    ),
  ) :Container(
    height:height ?? 240,
    width: width ?? 150,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        height: height ?? 240,
        width: width ?? 150,
        imageUrl: netWorkImageUrl,
        fit:boxFit ?? BoxFit.fill,
        httpHeaders:  const {
      'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
          "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token"
      },
        errorWidget: (context, url, error) {

          return const Icon(Icons.image_not_supported_outlined);
        },
        /* placeholder: (context, url) {
          return Icon(Icons.image_not_supported_outlined);
        },*/
      ),
    ),
  );
}


Widget cachedNetworkImageCircleWidget({
  required String netWorkImageUrl,
  double? height,
  double? width,
}) {
  return Container(
    height:height ?? 240,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CachedNetworkImage(
        height: height ?? 240,
        width: width ?? 150,
        imageUrl: netWorkImageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return Container(
              height: height ?? 240,
              width: width ?? 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.dividerColor)),
              child: const Icon(Icons.image_not_supported_outlined));
        },
        /* placeholder: (context, url) {
          return Icon(Icons.image_not_supported_outlined);
        },*/
      ),
    ),
  );
}