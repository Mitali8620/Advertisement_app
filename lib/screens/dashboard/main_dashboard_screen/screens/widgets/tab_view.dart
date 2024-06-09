import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabView extends StatelessWidget {
  final String text;
  final bool isView;

  const TabView({super.key, required this.text, this.isView = false});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: isView ? 10 : null,
      iconMargin: EdgeInsets.zero,
      child: Center(
        child: Text(
         // isView ? "" : text.toString(),
          isView ? "" : text.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              GoogleFonts.nunitoSans(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
