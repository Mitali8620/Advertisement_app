import 'package:flutter/material.dart';

class AppTheme{
  static Color transparent = Colors.transparent;
  static Color purple =  const Color(0xFFBB29FF);
  static Color greyBackGroundColor =  const Color(0xFFF4F5F6);
  static Color bottomIconColor =  const Color(0XFF779BFF);
  static Color bottomIconTextColor =  const Color(0XFFD9D9D9);
  
  
  /// for home screem category
  static Color paperColor =  const Color(0XFF304FFE);
  static Color boxColor =  const Color(0XFF439F48);
  static Color plasticColor =  const Color(0XFFF34336);
  static Color steelColor =  const Color(0XFFF6953C);
  static Color copperColor =  const Color(0XFF439F48);
  static Color cableColor =  const Color(0XFF6B4EFF);
  static Color pipesColor =  const Color(0XFF304FFE);
  static Color ironColor =  const Color(0XFFF6902E);
  static Color aluminiumColor =  const Color(0XFFF34336);
  static Color tinColor =  const Color(0XFFF6953C);
  static Color eWasteColor =  const Color(0XFF439F48);
  static Color dealColor =  const Color(0XFF6B4EFF);
  static Color black262626Color =  const Color(0XFF262626);
  static Color grey9E9E9EColor =  const Color(0XFF9E9E9E);
  static Color grey464648Color =  const Color(0XFF464648);

  /// for request dashboard page
  static Color progressColor =  const Color(0xFFF6953C);
  static Color pickUpColor =  const Color(0xFF198155);
  static Color activeColor =  const Color(0xFF0065D0);
  static Color pendingColor =  const Color(0xFFD3180C);
  static Color successColor =  const Color(0xFF0065D0);

  /// for location_update screen
  static Color lightBlue =  const Color(0xFFEAEBFF);
  static Color lightYellow =  const Color(0xFFFFF9C5);
  static Color lightRed =  const Color(0xFFFFEBED);
  static Color green =  const Color(0xFFE8F5E9);
  static Color blueF2F4FFColor =  const Color(0xFFF2F4FF);
  static const Color dividerColor = Color(0xff667085);

  /// for wallet screen

  static Color lightGrey =  const Color(0xFFD8DADC);


  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color primaryColor = const Color(0xff79AEA3);
  static Color hintTextColor = const Color(0xff828282);
  static Color iconColor = const Color(0xffB0B0B0);
  static Color errorTextColor = const Color(0xffFE7762);
  static Color fieldBackgroundColor = const Color(0xff333333);
  static Color red = Colors.red;
  static Color geryHintColor = const Color(0xffC5C5C5);
  static Color chipBorderColor = const Color(0xff333333);
  static Color stackBackgroundColor1 = const Color(0xff151515);
  static Color stackBackgroundColor2 = const Color(0xff1B1B1B);
  static Color pageBgColor = const Color(0xFFEEEEEE);


  static Color tabSelectedColor({required BuildContext context}) {
    Color tabSelectedColor = Theme.of(context).colorScheme.primary;
    return tabSelectedColor;
  }

  static Color tabUnSelectedColor({required BuildContext context}) {
    Color tabSelectedColor = Theme.of(context).colorScheme.shadow;
    return tabSelectedColor;
  }
}