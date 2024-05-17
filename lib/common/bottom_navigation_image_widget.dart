import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_spacer_constants.dart';
import 'tabView_text_widget.dart';

Widget bottomNavigationImageWidget({
  required String imageName,
  required Color color,
  required Color labelColor,
  required GestureTapCallback onTap,
  required String label,
}) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: onTap,
    child: SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageName,
            color: color,
            height: 22,
            width: 20,
          ),
          AppSpacer.p4(),
          TabViewTextWidget(
              color: labelColor,
              fontSize: 8,
              fontWeight: FontWeight.w400,
              text: label),
        ],
      ),
    ),
  );
}
