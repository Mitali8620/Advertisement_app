import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../common/tabView_text_widget.dart';
import '../../../../../common_components/app_base_widget.dart';
import '../../../../../utils/app_utils/assets/assets_data.dart';
import '../../../../../utils/app_utils/string/strings.dart';
import '../../../../../utils/core/services/launcher_url_link.dart';
import '../../../../location_update/location_controller/location_controller.dart';
import '../../dashboard_controller/dashboard_controller.dart';
import '../widgets/mobile_drawer_menu.dart';
import '../widgets/web_data_header.dart';
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


    locationController.askPermission().then((value) {});
    Future.delayed( Duration(milliseconds: 0)).then((value) {


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
    });
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
                  horizontal: 0.0, vertical: (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) ? 0:10),
                drawerWidget: (sizingInformation.deviceScreenType ==
                      DeviceScreenType.mobile)
                  ? MobileDrawerMenu()
                  : null,
              appbar: (sizingInformation.deviceScreenType ==
                    DeviceScreenType.mobile) ? AppBar(

                centerTitle: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Expanded(
                        flex: 3,
                        child:

                          TabViewTextWidget(
                              color:
                                  Theme.of(context).colorScheme.shadow,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              text: Strings.appName)
                      ),
                          Expanded(
                              flex: 5,
                              child: buildSearchTextField(
                                  searchFlyerController:
                                      dashBoardController.txtSearchFydeg,dashBoardController:dashBoardController ))
                        ],
                  ),
                actions: [
                  InkWell(
                          onTap: () async {
                            LauncherLink().launcherLink(
                                link: Strings.aboutRedirectionUrl);
                          },child:
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(Assets.appLogoImage),
                    ),
                  ),
                  ),

                ],
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

