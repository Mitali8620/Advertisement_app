import 'package:advertisement_app/constants/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/routes/route_constants.dart';
import '../../../../../utils/app_utils/string/strings.dart';
import '../../../../../utils/core/helpers/global_helper.dart';
import '../../dashboard_controller/dashboard_controller.dart';
import 'user_avatar_widget.dart';

Widget homeScreenMobileDrawer(){
  return   Container(
    color: Colors.deepPurple,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* InkWell(
                          onTap: () {
                            tabScaffoldKey.currentState?.openDrawer();
                          },
                          child: const Icon(Icons.menu)),*/

        const AuthHeader(
          headerText: Strings.appName,
          hasBackButton: false,
          isCenter: false,
          mainAxisAlignment: MainAxisAlignment.start,
        ),

        InkWell(
            onTap: () async {
              await GlobalInit.navKey.currentState?.pushNamed(
                AppRoutes.locationUpdateMainScreen,
              );
            },
            child: userAvatarWidget()),

        InkWell(
          onTap: () {
            Get.find<DashBoardController>().logOutOnTap();
          },
          child: const Icon(
            Icons.logout,
          ),
        )
      ],
    ),
  );
}