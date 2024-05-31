import 'package:advertisement_app/constants/app_spacer_constants.dart';
import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/routes/app_router.dart';
import '../../../../../../utils/core/helpers/global_helper.dart';
import '../../../../../network_home_page/initial_page.dart';
import '../../widgets/main_menu.dart';

class MainHomeScreenTabBarTabletWebPage extends StatefulWidget {
  const MainHomeScreenTabBarTabletWebPage({super.key});

  @override
  State<MainHomeScreenTabBarTabletWebPage> createState() =>
      _MainHomeScreenTabBarTabletWebPageState();
}

class _MainHomeScreenTabBarTabletWebPageState
    extends State<MainHomeScreenTabBarTabletWebPage> {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  void initState() {
    // dashBoardController.webMainScreenInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SideMenu(),
         AppSpacer.p10(),
          Expanded(
              child: Navigator(
            key: GlobalInit.mainNavigation,
            reportsRouteUpdateToEngine: true,
            initialRoute: "/homePage_tablet_web_tab_widget",
            onGenerateRoute: AppRouter.generateRoute,
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                  builder: (_) => const InitiallyHomePage());
            },
          ))
        ],
      ),
    );
  }
}
