import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../common_components/custom_dialog.dart';
import '../../../../../utils/app_utils/string/strings.dart';
import '../../../../../utils/core/constants/app_constants.dart';
import '../../../../../utils/core/services/locator_service.dart';
import '../../../../../utils/core/services/store_keys.dart';
import '../../../../../utils/core/services/store_service.dart';
import '../../../../location_update/screens/widgets/location_update_web_dialog.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final DashBoardController drawerController2 = Get.put(DashBoardController());

  @override

  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
            height: Get.height,
            padding: const EdgeInsets.only(
                left: AppConstant.defaultPadding,
                right: AppConstant.defaultPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints:
                BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox( height: AppConstant.defaultPadding * 2,),

                      ///side menu top image

                      InkWell(
                        onTap:(){
                          locationUpdateWebDialog(
                            context: context,
                            des: Strings.updateLocation,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Lottie.asset(Assets.locationJson, height: 50),

                      ),


                      const SizedBox(height: 8,),



                      ///dotted box with container


                      DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        child: Center(
                          child: GetBuilder<DashBoardController>(
                              builder: (controller) {
                            controller.currentLocation = locator<StoreService>()
                                    .getCurrentAddressLocation(
                                        locationAddressKey:
                                            StoreKeys.currentLocation) ??
                                "";
                            return Text(controller.currentLocation);
                          }),
                        ),
                      ),

                      const SizedBox(
                        height: AppConstant.defaultPadding * 3,
                      ),
/*
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        0
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "a",
                              icon: Icon(Icons.supervisor_account,
                                  color: AppTheme.white),
                              press: () {
                                drawerController2.firstMenuOnTap();
                              },
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        1
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "b",
                              icon: Image.asset(Assets.placeholderImage,
                                  color: AppTheme.white, height: 25, width: 25),
                              press: () {
                                drawerController2.secondMenuOnTap();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        2
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "c",
                              icon: Image.asset(Assets.placeholderImage,
                                  color: AppTheme.white, height: 25, width: 25),
                              press: () {
                                drawerController2.thirdMenuOnTap();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        3
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "d",
                              icon: Icon(Icons.shopping_bag_outlined,
                                  color: AppTheme.white),
                              press: () {
                                drawerController2.fourMenuOnTap();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        4
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "e",
                              icon: Icon(Icons.error_outline,
                                  color: AppTheme.white, size: 25),
                              press: () {
                                drawerController2.fiveMenuOnTap();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        5
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "f",
                              icon: Icon(Icons.policy_outlined,
                                  color: AppTheme.white, size: 25),
                              press: () {
                                drawerController2.sixMenuOnTap();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        6
                                    ? AppTheme.tabSelectedColor(context: context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: DrawerListTile(
                              title: "g",
                              icon: Icon(Icons.question_mark_outlined,
                                  color: AppTheme.white, size: 25),
                              press: () {
                                drawerController2.sevenMenuOnTap();
                              },
                            ),
                          ),
                          */

                      Container(
                        height: Get.height *0.9,
                        width: Get.width *0.3,
                        child: GetBuilder <DashBoardController>(
                          builder: (dController) {
                            return ListView.builder(
                              itemCount:dController.homeTabsCategoryItem.length ?? 0,
                              shrinkWrap: true,

                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {

                                return  Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: dController.currentDrawerIndex.value ==  index
                                          ? AppTheme.tabSelectedColor(context: context)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: DrawerListTile(
                                    title: dController.homeTabsCategoryItem[index],
                                    icon: Image.asset(dController.homeTabsCategoryItemImages[index],width: 30,height: 30,),
                                  press: () {
                                    dController.setInitialAllHomeDataValue();
                                    dController.currentDrawerIndex.value = index;

                                    dController.update();

                                    Future.delayed(const Duration(milliseconds: 300))
                                        .then((value) {
                                      dController.changeTabBarIndex(index);
                                      dController.update();
                                    });

                                    dController.firstMenuOnTap();

                                    print("drawerController2.currentDrawerIndex.value :: ${dController.currentDrawerIndex.value}");
                                    print("drawerController2.currentDrawerIndex.value index :: ${dController.homeTabsCategoryItem[index]}");
                                  },
                                ),
                                );
                              },);
                          }
                        ),
                      ),












                      const Spacer(),
                      const Divider(
                          color: AppTheme.dividerColor,
                          indent: AppConstant.defaultPadding,
                          endIndent: AppConstant.defaultPadding),
                      const SizedBox(
                        height: AppConstant.defaultPadding * 1.3,
                      ),
                      GetBuilder<DashBoardController>(builder: (dController){
                        return PersonalInfo(
                            email: dController.storedLoginModel?.userData?.email ?? "",
                            name: dController.storedLoginModel?.userData?.name ?? "",
                            onTapLogout: () {

                              showConfirmDialog(
                                  headerText: Strings.logOutText,
                                  isHide: false,
                                  contentText: Strings.logOutDescriptionText,
                                  context: context,
                                  positiveOnTapBtnEvent: () {
                                    drawerController2.logOutOnTap();
                                  });



                            });

                      }),
                      const SizedBox(
                        height: AppConstant.defaultPadding * 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      contentPadding: EdgeInsets.zero,
      onTap: press,
      leading: Padding(
        padding: const EdgeInsets.only(
            left: AppConstant.defaultPadding,
            right: AppConstant.defaultPadding),
        child: icon,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppTheme.black, fontSize: AppConstant.defaultPadding),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  final String email;
  final String name;
  final GestureTapCallback? onTapLogout;

  const PersonalInfo({
    required this.email,
    required this.name,
    required this.onTapLogout, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppConstant.defaultPadding * 2,
          right: AppConstant.defaultPadding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUserName(name: name),
              buildUserEmail(email: email),
            ],
          ),
          InkWell(
            onTap: onTapLogout,
            child: SvgPicture.asset(
              Assets.imagesProfileLogout,
              color: AppTheme.white,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}

Widget buildUserName({required String name}) {
  return Text(name,
      maxLines: 2,
      style: TextStyle(
        color: AppTheme.white,
        fontSize: AppConstant.defaultPadding * 0.9,
      ));
}

Widget buildUserEmail({required String email}) {
  return Text(email,
      style: TextStyle(
          color: AppTheme.white,
          fontSize: AppConstant.defaultPadding * 0.9,
          fontWeight: FontWeight.w500));
}