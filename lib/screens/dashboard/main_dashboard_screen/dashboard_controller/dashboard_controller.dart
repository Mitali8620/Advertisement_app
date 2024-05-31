import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../utils/core/helpers/global_helper.dart';
import '../../../../utils/core/services/locator_service.dart';
import '../../../../utils/core/services/store_keys.dart';
import '../../../../utils/core/services/store_service.dart';
import '../../../auth/models/auth_model.dart';
import '../models/get_request_details_response_data_model.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class DashBoardController extends GetxController {
  int currentIndex = 0;
  int tabBarIndex = 0;
  TabController? tabController;

  LoginModel? storedLoginModel;

  LoginModel? getLogInData() {
    storedLoginModel =
        locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
    return storedLoginModel;
  }

  void changeTabIndex(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  void changeTabBarIndex(int newIndex) {
    tabBarIndex = newIndex;
    update();
  }

  ///for web left panel
  final currentDrawerIndex = 0.obs;
  webMainScreenInit() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }

  void firstMenuOnTap() {
    currentDrawerIndex.value = 0;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }
  void secondMenuOnTap() {
    currentDrawerIndex.value = 1;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }  void thirdMenuOnTap() {
    currentDrawerIndex.value = 2;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }void fourMenuOnTap() {
    currentDrawerIndex.value = 3;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }void fiveMenuOnTap() {
    currentDrawerIndex.value = 4;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }void sixMenuOnTap() {
    currentDrawerIndex.value = 5;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }
  void sevenMenuOnTap() {
    currentDrawerIndex.value = 6;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }

  ///-------------------------------------- for tabBar
  ///get login user request (seller second tab)
  List<RequestData> requestItemsList = [];
  int page = 1;
  bool isLoading = false;
  bool isNoData = false;
  int paginationDataPageSize = 20;
  int totalData = 0;
  bool hasReachedEnd = false;
  bool isTapInTabBar = false;
  final ScrollController scrollController = ScrollController();

  void handleTabChange() {
    print("Current tab index: ${tabController?.index}");
  }

  setInitialAllHomeDataValue() {
    print("Page value after :: $page");
    page = 1;
    print("Page value before :: $page");
    print("hasReachedEnd value before hasReachedEnd:: $hasReachedEnd");
    isLoading = false;
    totalData = 0;
    hasReachedEnd = false;
    isNoData = false;
    //  requestItemsList.clear();
    //  requestItemsList = [];
  }

  ///static data list
  @override
  void onInit() {
    updateRequestItemsList(newList: requestItemsListData);
    super.onInit();
  }

  void updateRequestItemsList({required List<RequestData> newList}) {
    requestItemsList = requestItemsListData;
    update(); // Notify listeners about the change
  }

  List<RequestData> requestItemsListData = [
    RequestData(
        id: "1",
        images: [
          "https://imgs.search.brave.com/hn8zKSWqXcFo-YaT9HAzqq1II8PRlo4lBCsOx3A7Mj8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxOC8w/Mi8wOC8yMi8yNy9m/bG93ZXItMzE0MDQ5/Ml82NDAuanBn",
          "https://imgs.search.brave.com/dpeg8Vh7_2zu4lDcDcuIkwYZNXY5rHHbQhBNmumlwL0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9iZWF1dGlmdWwt/bmF0dXJlLW1vdW50/YWluLXNjZW5lcnkt/d2l0aC1mbG93ZXJz/LWZyZWUtcGhvdG8u/anBnP3c9NjAwJnF1/YWxpdHk9ODA"
        ],
        userId: "1"),
    RequestData(
        id: " 2",
        images: [
          "https://imgs.search.brave.com/dpeg8Vh7_2zu4lDcDcuIkwYZNXY5rHHbQhBNmumlwL0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9iZWF1dGlmdWwt/bmF0dXJlLW1vdW50/YWluLXNjZW5lcnkt/d2l0aC1mbG93ZXJz/LWZyZWUtcGhvdG8u/anBnP3c9NjAwJnF1/YWxpdHk9ODA"
        ],
        userId: "2"),
    RequestData(
        id: " 3",
        images: [
          "https://imgs.search.brave.com/jTvZUnDxoqiuRyQllST5fchF58YyNi_0nLAw87PfDE4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE1/NzIwNTE3Ny9waG90/by9zdW5zZXQtd2l0/aC1wZWJibGVzLW9u/LWJlYWNoLWluLW5p/Y2UtZnJhbmNlLndl/YnA_Yj0xJnM9MTcw/NjY3YSZ3PTAmaz0y/MCZjPXBMVEd5SDYt/OGMxZUxOSndJTHp0/UW9VemhOMmQ2bGlr/WlJLSnI5YWFrNWs9"
        ],
        userId: "3"),
    RequestData(
        id: " 4",
        images: [
          "https://imgs.search.brave.com/xER1Y2TVfLBi3yfxIMq63ALFUdeqEuUXRlvbhOw1GZc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE3/Nzk1NzU3Ny9waG90/by93b3JsZC1lbnZp/cm9ubWVudC1kYXkt/Y29uY2VwdC53ZWJw/P2I9MSZzPTE3MDY2/N2Emdz0wJms9MjAm/Yz1xZ2RfR0V4LVo2/ODJNTVVhbGp6eFV4/NXc2RnpILV83bnVD/aFM5ZXlEYlFjPQ"
        ],
        userId: "4"),
    RequestData(
        id: " 5",
        images: [
          "https://imgs.search.brave.com/5E1g3jR6Fm7OzDyI4aK0hkDG7HCcDtT76TG7EST_TGo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9ocmx0eDEy/cGw4aHEvMXBSWUly/RTdnbkw3SXdCY0V2/SDdOci82MjVmYzk4/ZjRmMzAxMjBjY2Mw/YTYwM2M4NGVlOGIz/YS8wX2hlcm9fbmV3/X18xXy53ZWJwP2Zp/dD1maWxsJnc9NjAw/Jmg9MTIwMA"
        ],
        userId: "5"),
    RequestData(
        id: " 6",
        images: [
          "https://imgs.search.brave.com/jy_8WfHR5ETwTXH4flDkp4kED4-Vo--5poTyoNOB3Is/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9mcmVl/bmF0dXJlc3RvY2su/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy9m/cmVlbmF0dXJlc3Rv/Y2stMjE4NS03Njh4/MTIxNC5qcGc"
        ],
        userId: "6"),
    RequestData(
        id: " 7",
        images: [
          "https://imgs.search.brave.com/w4l7JgbPJk7kx-uMfM6A1aBnf9b8sjZepqDSgqCHeZw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9sYW5kc2NhcGUt/cGhvdG8tbGFrZV82/NjUyODAtMjc2MjMu/anBnP3NpemU9NjI2/JmV4dD1qcGc"
        ],
        userId: "7")
  ];
}
