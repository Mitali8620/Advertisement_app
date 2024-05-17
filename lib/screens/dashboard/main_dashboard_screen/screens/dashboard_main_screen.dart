import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/bottom_navigation_bar.dart';
import '../../../../common_components/app_base_widget.dart';
import '../dashboard_controller/dashboard_controller.dart';
import 'widgets/bottom_floating_button.dart';
import 'widgets/my_home_tabbar_screen.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  void initState() {
    dashBoardController.changeTabIndex(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (dController) {
        return SafeArea(
          child: AppBaseScaffold(
            padding: EdgeInsets.zero,
            floatingWidget: bottomMiddleFloatingActionButton(
              context: context,
              onPressed: () {},
            ),
            bottomNavigationBar: buildBottomNavigationBar(
              context: context,
              currentIndex: dController.currentIndex,
              isBuyer: false,
              onTap: (index) {
                dController.changeTabIndex(index);
              },
            ),
            floatingButtonLocation: FloatingActionButtonLocation.centerDocked,
            child: _buildBody(dController.currentIndex),
          ),
        );
      },
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const MyHomeTabBarScreen();
      case 1:
        return const Center(child: Text("------ 2222222------"));
      case 2:
        return const Center(child: Text("------ 3333333------"));
      default:
        return Container();
    }
  }
}
