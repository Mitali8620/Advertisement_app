import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabViewTextWidget extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? height;

  const TabViewTextWidget(
      {super.key,
      this.fontSize,
      this.color,
      this.textAlign,
      this.fontWeight,
      required this.text,
      this.style,
      this.maxLines,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: style ??
          GoogleFonts.poppins(
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color),
    );
  }
}
