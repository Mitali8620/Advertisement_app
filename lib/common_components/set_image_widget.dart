import 'dart:io';
import 'package:flutter/material.dart';

import '../utils/app_utils/assets/assets_data.dart';
import '../utils/app_utils/colors/app_colors.dart';

Widget setProfileImage({required ImageProvider imageProvider, double? radius}) {
  return CircleAvatar(
    radius: radius ?? 80,
    backgroundColor: AppTheme.greyBackGroundColor,
    foregroundColor: AppTheme.lightBlue,
    backgroundImage: imageProvider,
  );
}

setNetworkImageProvider({
  required String networkImageUrl,
  double? height,
  double? width,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(150),
    child: Image.network(
      networkImageUrl,
      width: width ?? 150,
      height: height ?? 150,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              Assets.imagesPerson,
            ));
      },
    ),
  );
}

AssetImage assetImageProvider({required String assetImage}) {
  return AssetImage(assetImage);
}

NetworkImage circleNetWorkImageProvider({required String netWorkImageUrl}) {
  return NetworkImage(netWorkImageUrl);
}

FileImage fileImageProvider({required String pickedImageFile}) {
  return FileImage(File(pickedImageFile));
}

materialNetWOrkImage({required String imageUrl, double? height, double? width}) {
  return Image.network(
    imageUrl,
    errorBuilder: (context, error, stackTrace) {
      return SizedBox(height: height,child: Icon(Icons.image_not_supported_outlined),);
    },
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return SizedBox(
          height: height ?? 120.0,
          width: width?? 120.0,
          child: Center(
              child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes)!.toInt()
                : null,
          )));
    },
  );
}

Widget imageErrorWidget({required double height}) {
  return Container(
    height: height,
    child: Center(child: Icon(Icons.image_not_supported_outlined)),
  );
}
