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



class MobileDrawerMenu extends StatefulWidget {
  const MobileDrawerMenu({super.key});

  @override
  State<MobileDrawerMenu> createState() => _MobileDrawerMenuState();
}

class _MobileDrawerMenuState extends State<MobileDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: GetBuilder<DashBoardController>(builder: (dController) {
        return Container(
            color: AppTheme.greyBackGroundColor,
            height: 200,

            child:

            SingleChildScrollView(

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
                    mainAxisSize: MainAxisSize.max,
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


                      ///category_listing
                      GetBuilder <DashBoardController>(
                          builder: (dController) {
                            return ListView.builder(
                              itemCount:dController.homeTabsCategoryItem.length ?? 0,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {

                                return  Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: dController.currentTabIndex ==  index
                                          ? AppTheme.tabSelectedColor(context: context)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: listTile(
                                    context: context,
                                    text: dController.homeTabsCategoryItem[index],
                                    fontWeight: FontWeight.w400,
                                    leading: Image.asset(dController.homeTabsCategoryItemImages[index],width: 30,height: 30,),
                                    onTap: () {
                                      dController.setInitialAllHomeDataValue();
                                      dController.currentDrawerIndex.value = index;
                                      dController.currentTabIndex = index;

                                      dController.update();

                                      Future.delayed(const Duration(milliseconds: 300))
                                          .then((value) {
                                        dController.changeTabBarIndex(index);
                                        dController.update();
                                      });

                                      Future.delayed(Duration(milliseconds: 300)).then((value) {
                                        GlobalInit.navKey.currentState?.pop();

                                        dController.tabController?.animateTo(index);
                                      });


                                      print("drawerController2.currentDrawerIndex.value :: ${dController.currentDrawerIndex.value}");
                                      print("drawerController2.currentDrawerIndex.value index :: ${dController.homeTabsCategoryItem[index]}");
                                    },
                                  ),
                                );
                              },);
                          }
                      ),







                    ],
                  ),


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
              ).  paddingOnly(top: 0,left: 10,right: 10),
            )
        );
      }),
    );
  }
}



Widget listTile({
  required GestureTapCallback onTap,
  required Widget leading,
  required BuildContext context,
  required String text,
   FontWeight? fontWeight,
}) {
  return ListTile(
    onTap: onTap,
    leading: leading,
    minLeadingWidth: 25,
    hoverColor: Theme.of(context).colorScheme.primary,
    title: Text(
      text,
      style:GoogleFonts.poppins(fontSize:12,color: blackColor, fontWeight: fontWeight ?? FontWeight.w600,),
    ),
  );
}
