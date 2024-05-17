import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/app_utils/colors/app_colors.dart';

/// this widget is stateless widget for elevated button
/// [onPressed] and [title] are required parameters
/// [width] and [height] are used for setting the height and width of the button
/// [alignment] is used to set alignment of a child widget default [Alignment.center]
/// [loading] is boolean used for animating [width] of a widget if it is busy default [false]
class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backGroundColor,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.isLoading = false,
  }) : super(key: key);

  /// on press function
  final Function()? onPressed;

  /// child widget
  final String title;

  /// width double
  final double? width;

  /// height double
  final double? height;

  /// alignment of a widget
  final Alignment alignment;

  /// for background color
  final Color? backGroundColor;

  /// for show loader
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: width ?? context.width,
        height: height ?? 48,
        child: (isLoading ?? false)
            ? Center(
                child: CircularProgressIndicator(color: AppTheme.primaryColor),
              )
            : InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: backGroundColor ??
                          Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.0),
                      border: backGroundColor != null
                          ? Border.all(
                              color: Theme.of(context).colorScheme.shadow)
                          : null),
                  child: Center(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                          color:
                              backGroundColor != null ? blackColor : whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
