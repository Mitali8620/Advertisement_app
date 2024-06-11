import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/screens/widgets/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../../common_components/app_base_widget.dart';
import '../../../../../constants/auth_header.dart';
import '../../../../../utils/app_utils/string/strings.dart';
import '../../../../location_update/location_controller/location_controller.dart';
import '../../dashboard_controller/dashboard_controller.dart';
import '../widgets/home_screen_mobile_header.dart';
import '../widgets/mobile_drawer_menu.dart';
import 'view/main_home_screen_mobile_page.dart';
import 'view/main_home_screen_tabbar_teblet_web_page.dart';

class MyHomeTabBarScreen extends StatefulWidget {
  const MyHomeTabBarScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeTabBarScreen> createState() => _MyHomeTabBarScreenState();
}

class _MyHomeTabBarScreenState extends State<MyHomeTabBarScreen>
    with SingleTickerProviderStateMixin {
  DashBoardController dashBoardController = Get.put(DashBoardController());
  LocationController locationController = Get.put(LocationController());

  void initState() {
    super.initState();

    dashBoardController.tabController = TabController(length: dashBoardController.homeTabsCategoryItem.length, vsync: this);
    dashBoardController.setInitialAllHomeDataValue();
    dashBoardController.scrollController.addListener(() {
      if (dashBoardController.scrollController.position.pixels ==
          dashBoardController.scrollController.position.maxScrollExtent) {
        Future.delayed(const Duration(milliseconds: 200)).then((value) {
          dashBoardController.getLoginUserAllRequestData(
            pageSize: dashBoardController.paginationDataPageSize,
            pageValue: dashBoardController.page,
            isFirstPage: false,
            category: 0
          );
        });
      }
    });

    dashBoardController.getLoginUserAllRequestData(
      pageSize: dashBoardController.paginationDataPageSize,
      pageValue: dashBoardController.page,
      isFirstPage: true,
      category: 0
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
        return GetBuilder<DashBoardController>(
          builder: (dashBoardController) {
            return PopScope(
              canPop: true,
              onPopInvoked: (didPop) async {
                dashBoardController.setInitialAllHomeDataValue();
              },
              child: AppBaseScaffold(topPadding: 0,
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) ? 0:10),
                drawerWidget: (sizingInformation.deviceScreenType ==
                      DeviceScreenType.mobile)
                  ? mobileDrawerMenu(context: context)
                  : null,
              appbar: (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) ? AppBar(
                  title: const AuthHeader(
                    headerText: Strings.appName,
                    hasBackButton: false,
                    isCenter: false,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ):null,
                child: ResponsiveBuilder(builder: (context, sizingInformation) {
                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.desktop) {
                    return const MainHomeScreenTabBarTabletWebPage();
                  }

                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.tablet) {
                    return const MainHomeScreenTabBarTabletWebPage();
                  }

                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.mobile) {
                    return const MainHomeScreenTabBarMobilePage();
                  }
                  return const SizedBox.shrink();
                }),
              ),
            );
          },
        );
      }
    );
  }

  @override
  void dispose() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (mounted) {
        dashBoardController.scrollController.dispose();
      }
    });
    super.dispose();
  }
}
