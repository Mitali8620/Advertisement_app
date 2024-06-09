import 'package:advertisement_app/common_components/app_base_widget.dart';
import 'package:advertisement_app/constants/auth_header.dart';
import 'package:advertisement_app/utils/app_utils/string/strings.dart';
import 'package:advertisement_app/utils/core/services/store_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../config/routes/route_constants.dart';
import '../../../../../../constants/app_spacer_constants.dart';
import '../../../../../../utils/core/helpers/global_helper.dart';
import '../../../dashboard_controller/dashboard_controller.dart';
import '../../widgets/home_page_tab_widget.dart';
import '../../widgets/tab_view.dart';
import '../../widgets/user_avatar_widget.dart';

class MainHomeScreenTabBarMobilePage extends StatefulWidget {
  const MainHomeScreenTabBarMobilePage({super.key});

  @override
  State<MainHomeScreenTabBarMobilePage> createState() =>
      _MainHomeScreenTabBarMobilePageState();
}

class _MainHomeScreenTabBarMobilePageState
    extends State<MainHomeScreenTabBarMobilePage> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      key: tabScaffoldKey,
      backgroundColor: Colors.deepPurple,
      padding: const EdgeInsets.all(0),
      child: GetBuilder<DashBoardController>(
        builder: (dashBoardController) {
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) async {
              dashBoardController.setInitialAllHomeDataValue();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacer.p32(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          tabScaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(Icons.menu)),

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
                        Future.delayed(const Duration(milliseconds: 300)).then((value) {
                          StoreService().clearData();
                          GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
                            AppRoutes.logInMainScreen,
                                (Route<dynamic> route) => false,
                          );
                        });
                      },
                      child: const Icon(
                        Icons.logout,
                      ),
                    )
                  ],
                ),
                AppSpacer.p24(),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.06),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      controller: dashBoardController.tabController,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Theme.of(context).colorScheme.shadow,
                      labelColor: Theme.of(context).colorScheme.onSecondary,
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                      splashBorderRadius: BorderRadius.circular(10),
                      tabs: dashBoardController.homeTabsCategoryItem
                          .map((tab) => Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                        child: TabView(
                          text: tab,
                          isView: false,
                        ),
                      ))
                          .toList(),
                      onTap: (index) {
                        print("index :: $index");
                        dashBoardController.currentTabIndex = index;
                        dashBoardController.update();
                        setState(() {
                        });
                        Future.delayed(Duration(milliseconds: 300)).then((value) {
                          dashBoardController.changeTabBarIndex(index);
                          dashBoardController.setInitialAllHomeDataValue();
                        });

                      },
                    ),
                  ),
                ),
                AppSpacer.p16(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: HomePageTabWidget(
                      onTapTile: (index) {},
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
