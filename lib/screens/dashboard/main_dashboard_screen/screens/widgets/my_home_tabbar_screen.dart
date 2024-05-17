import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../common_components/app_base_widget.dart';
import '../../../../../constants/app_spacer_constants.dart';
import '../../../../../constants/auth_header.dart';
import '../../../../../utils/app_utils/string/strings.dart';
import '../../dashboard_controller/dashboard_controller.dart';
import 'home_page_tab_widget.dart';
import 'tab_view.dart';

class MyHomeTabBarScreen extends StatefulWidget {
  const MyHomeTabBarScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeTabBarScreen> createState() => _MyHomeTabBarScreenState();
}

class _MyHomeTabBarScreenState extends State<MyHomeTabBarScreen>
    with SingleTickerProviderStateMixin {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  void initState() {
    super.initState();
    dashBoardController.tabController = TabController(length: 2, vsync: this);
    dashBoardController.setInitialAllHomeDataValue();
    dashBoardController.scrollController.addListener(() {
      if (dashBoardController.scrollController.position.pixels ==
          dashBoardController.scrollController.position.maxScrollExtent) {
        /*Future.delayed(Duration(milliseconds: 200)).then((value) {
          dashBoardController.getLoginUserAllRequestData(
            pageSize: dashBoardController.paginationDataPageSize,
            pageValue: dashBoardController.page,
            isFirstPage: false,
          );
        });*/
      }
    });

    /*dashBoardController.getLoginUserAllRequestData(
      pageSize: dashBoardController.paginationDataPageSize,
      pageValue: dashBoardController.page,
      isFirstPage: true,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (dashBoardController) {
        /*     if (state is GetLogInUserAllRequestInitialState) {
          EasyLoading.show();
        } else if (state is GetLogInUserAllRequestSuccessState) {
          EasyLoading.dismiss();
        } else if (state is GetLogInUserAllRequestFailedState) {
          EasyLoading.dismiss();
          EasyLoading.showInfo(state.errorMsg);
        } else if (state is GetEventsListLoadingState) {
          if (dashBoardController.page == 1 &&
              dashBoardController.requestItemsList.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }*/
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) async {
            dashBoardController.setInitialAllHomeDataValue();
          },
          child: AppBaseScaffold(
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
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.shadow,
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
          ),
        );
      },
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
