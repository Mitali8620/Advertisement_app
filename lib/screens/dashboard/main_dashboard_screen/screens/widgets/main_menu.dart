import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:advertisement_app/utils/app_utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utils/core/constants/app_constants.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final DashBoardController drawerController2 = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 500,
      backgroundColor: Colors.deepPurple,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(() => Container(
                color: AppTheme.black,
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
                        children: [
                          const SizedBox(
                            height: AppConstant.defaultPadding * 2,
                          ),
                          Image.asset(Assets.placeholderImage, height: 50),
                          const SizedBox(
                            height: AppConstant.defaultPadding * 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: drawerController2
                                            .currentDrawerIndex.value ==
                                        0
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                                    ? AppTheme.lightGrey
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
                          const Spacer(),
                          const Divider(
                              color: AppTheme.dividerColor,
                              indent: AppConstant.defaultPadding,
                              endIndent: AppConstant.defaultPadding),
                          const SizedBox(
                            height: AppConstant.defaultPadding * 1.3,
                          ),
                          PersonalInfo(
                              email: 'abc@gmail.com',
                              onTapLogout: () {
                                // drawerController2.logoutOnTap();
                              }),
                          const SizedBox(
                            height: AppConstant.defaultPadding * 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
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
  final GestureTapCallback? onTapLogout;

  const PersonalInfo({required this.email, required this.onTapLogout, Key? key})
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
              Text("AdminInformation.adminData.value.fullName ?? ''",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: AppConstant.defaultPadding * 0.9,
                  )),
              Text(email,
                  style: TextStyle(
                      color: AppTheme.white,
                      fontSize: AppConstant.defaultPadding * 0.9,
                      fontWeight: FontWeight.w500)),
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
