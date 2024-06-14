import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imageBottomDescriptionWidget({required String description}) {
  return Text(
    description,
    maxLines: 5,
    style: GoogleFonts.poppins(
        color: AppTheme.activeColor,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        fontStyle: FontStyle.italic),
  );
}

Widget imageBottomLocationWidget({required String location}) {
  return Text(
    location,
    style: GoogleFonts.poppins(
      color: AppTheme.black,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
  );
}
