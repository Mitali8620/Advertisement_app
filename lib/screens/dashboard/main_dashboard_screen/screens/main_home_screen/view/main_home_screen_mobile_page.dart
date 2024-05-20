import 'package:advertisement_app/constants/auth_header.dart';
import 'package:advertisement_app/utils/app_utils/string/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../constants/app_spacer_constants.dart';
import '../../../dashboard_controller/dashboard_controller.dart';
import '../../widgets/home_page_tab_widget.dart';
import '../../widgets/tab_view.dart';

class MainHomeScreenTabBarMobilePage extends StatefulWidget {
  const MainHomeScreenTabBarMobilePage({super.key});

  @override
  State<MainHomeScreenTabBarMobilePage> createState() =>
      _MainHomeScreenTabBarMobilePageState();
}

class _MainHomeScreenTabBarMobilePageState extends State<MainHomeScreenTabBarMobilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
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
              const AuthHeader(
                headerText: Strings.myRequest,
                hasBackButton: false,
                isCenter: false,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              AppSpacer.p24(),
              Padding(
                padding: const EdgeInsets.symmetric(

                    ///horizontal padding
                    // horizontal: 20,
                    ),
                child: TabBar(
                  controller: dashBoardController.tabController,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Theme.of(context).colorScheme.shadow,
                  labelColor: Theme.of(context).colorScheme.onSecondary,
                  indicator: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(11),
                          topLeft: Radius.circular(11)),
                      color: Theme.of(context).colorScheme.primary),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w600),
                  splashBorderRadius: BorderRadius.circular(10),
                  tabs: const [
                    TabView(
                      text: Strings.active,
                      isView: true,
                    ),
                    TabView(
                      text: Strings.past,
                      isView: true,
                    ),
                  ],
                  onTap: (index) {
                    dashBoardController.changeTabBarIndex(index);
                    dashBoardController.setInitialAllHomeDataValue();
                  },
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.06),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(

                      ///horizontal padding

                      //     horizontal: 20,
                      ),
                  child: TabBar(
                    controller: dashBoardController.tabController,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Theme.of(context).colorScheme.shadow,
                    labelColor: Theme.of(context).colorScheme.onSecondary,
                    indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                    unselectedLabelStyle: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                    splashBorderRadius: BorderRadius.circular(10),
                    tabs: const [
                      TabView(text: Strings.active),
                      TabView(text: Strings.past),
                    ],
                    onTap: (index) {
                      dashBoardController.changeTabBarIndex(index);
                      dashBoardController.setInitialAllHomeDataValue();
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
    );
  }
}
