
import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

Decoration boxDecorationWithRoundedCorners({
  Color backgroundColor = AppTheme.white,
  BorderRadius? borderRadius,
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
}) {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius:
    boxShape == BoxShape.circle ? null : (borderRadius ?? BorderRadius.circular(10)),
    gradient: gradient,
    border: border,
    boxShadow: boxShadow,
    image: decorationImage,
    shape: boxShape,
  );
}


Widget dotContainer({required Color color}) {
  return Container(
    width: 8.0,
    height: 8.0,
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}