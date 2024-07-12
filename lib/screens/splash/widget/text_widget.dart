import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_utils/string/strings.dart';

/// this widget is stateless widget for showing logo
class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, this.flex = 2}) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return /*Flexible(
      flex: flex,
      child:*/ Padding(padding: EdgeInsets.only(left: 8,right: 20),child: Text(
      Strings.appName,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontSize: 50,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSecondary),
      //  ),
    ),);
  }
}
