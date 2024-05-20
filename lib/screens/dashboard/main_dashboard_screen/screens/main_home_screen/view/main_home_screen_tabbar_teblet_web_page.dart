import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../common_components/app_base_widget.dart';
import '../../widgets/main_menu.dart';
import 'main_home_screen_mobile_page.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
        key: scaffoldKey,
        //    drawerWidget:SideMenu(),

        child: SideMenu());
  }
}
