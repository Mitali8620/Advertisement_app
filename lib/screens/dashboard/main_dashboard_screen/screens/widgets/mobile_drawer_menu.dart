import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:advertisement_app/utils/app_utils/string/strings.dart';
import 'package:advertisement_app/utils/core/helpers/global_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../common_components/custom_dialog.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../constants/app_constants.dart';
import 'main_menu.dart';

Widget mobileDrawerMenu({required BuildContext context}) {
  return Drawer(
    elevation: 16.0,
    child: GetBuilder<DashBoardController>(builder: (dController) {
      return Container(
        color: AppTheme.greyBackGroundColor,
        height: 200,
        child: Column(
          children: [
            ///user_data_image_name_email
            UserAccountsDrawerHeader(
              onDetailsPressed: () {},
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(Assets.imagesPersonIcon),
              ),
              accountName: buildUserName(
                  name: dController.storedLoginModel?.userData?.name ?? ""),
              accountEmail: buildUserEmail(
                  email: dController.storedLoginModel?.userData?.email ?? ""),
            ),

            ///location_update
            Column(

              children: [
                listTile(
                    context: context,
                    onTap: () {
                      GlobalInit.navKey.currentState?.pop();
                      GlobalInit.navKey.currentState
                          ?.pushNamed(AppRoutes.locationUpdateMainScreen);
                    },
                    text: Strings.updateLocation,
                    leading: Lottie.asset(Assets.locationJson, height: 30)),
                const Divider(),


                ///logout
                Align(
                  alignment: Alignment.bottomLeft,
                  child: listTile(
                      context: context,
                      onTap: () {
                        GlobalInit.navKey.currentState?.pop();
                        showConfirmDialog(
                            headerText: Strings.logOutText,
                            isHide: false,
                            contentText: Strings.logOutDescriptionText,
                            context: context,
                            positiveOnTapBtnEvent: () {
                              dController.logOutOnTap();
                            });
                      },
                      text: Strings.logOutText,
                      leading: SvgPicture.asset(
                        Assets.imagesProfileLogout,
                        color: AppTheme.black,
                        height: 25,
                      )),
                ),
              ],
            ),

          ],
        ),
      );
    }),
  );
}

Widget listTile({
  required GestureTapCallback onTap,
  required Widget leading,
  required BuildContext context,
  required String text,
}) {
  return ListTile(
    onTap: onTap,
    leading: leading,
    minLeadingWidth: 30,
    hoverColor: Theme.of(context).colorScheme.primary,
    title: Text(
      text,
      style:
          GoogleFonts.poppins(color: blackColor, fontWeight: FontWeight.w600),
    ),
  );
}
