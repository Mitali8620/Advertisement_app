import 'package:flutter/material.dart';
import '../utils/app_utils/assets/assets_data.dart';
import '../utils/app_utils/colors/app_colors.dart';
import '../utils/app_utils/string/strings.dart';
import 'bottom_navigation_image_widget.dart';

///custom_bottom_navigation_bar
Widget buildBottomNavigationBar({
  required BuildContext context,
  required int currentIndex,
  required bool isBuyer,
  required Function(int) onTap,
}) {
  return BottomAppBar(
    color: Theme.of(context).colorScheme.primary,
    shape: const CircularNotchedRectangle(),
    height: 70,
    notchMargin: 8.0,
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ///call_first_bottom_navigation_item

              bottomNavigationImageWidget(
                  imageName: Assets.imagesHome,
                  color: currentIndex == 0
                      ? Theme.of(context).colorScheme.onTertiary
                      : AppTheme.bottomIconColor,
                  onTap: () {
                    onTap(0);
                  },
                  label: Strings.home,
                  labelColor: AppTheme.bottomIconTextColor),

 /*             ///call_sec_bottom_navigation_item
              bottomNavigationImageWidget(
                  imageName: isBuyer ? Assets.imagesBid : Assets.imagesMyRequest,
                  color: currentIndex == 1
                      ? Theme.of(context).colorScheme.onTertiary
                      : AppTheme.bottomIconColor,
                  onTap: () {
                    onTap(1);
                  },
                  label: Strings.myRequest,
                  labelColor: AppTheme.bottomIconTextColor),*/


            ///call_third_bottom_navigation_item
            bottomNavigationImageWidget(
                imageName: Assets.imagesContactUs,
                color: currentIndex == (isBuyer ? 3 : 2)
                    ? Theme.of(context).colorScheme.onTertiary
                    : AppTheme.bottomIconColor,
                onTap: () {
                  onTap(isBuyer ? 3 : 2);
                },
                label: Strings.contactUs,
                labelColor: AppTheme.bottomIconTextColor),

       /*     ///call_fourth_bottom_navigation_item
            bottomNavigationImageWidget(
                imageName: Assets.imagesProfile,
                color: currentIndex == (isBuyer ? 4 : 3)
                    ? Theme.of(context).colorScheme.onTertiary
                    : AppTheme.bottomIconColor,
                onTap: () {
                  onTap(isBuyer ? 4 : 3);
                },
                label: Strings.profile,
                labelColor: AppTheme.bottomIconTextColor),*/

        ],
      ),
    ),
  );
}
