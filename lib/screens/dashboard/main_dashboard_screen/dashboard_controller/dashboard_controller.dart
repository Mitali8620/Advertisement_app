import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/core/services/locator_service.dart';
import '../../../../utils/core/services/store_keys.dart';
import '../../../../utils/core/services/store_service.dart';
import '../../../auth/models/auth_model.dart';
import '../models/get_request_details_response_data_model.dart';

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
        images:
            "http://192.168.1.57:8000/storage/profile_images/alexander-hipp-iEEBWgY_6lA-unsplash.jpg",
        userId: "1"),
    RequestData(
        id: " 2",
        images:
            "http://192.168.1.57:8000/storage/profile_images/christian-buehner-DItYlc26zVI-unsplash.jpg",
        userId: "2"),
    RequestData(
        id: " 3",
        images:
            "http://192.168.1.57:8000/storage/profile_images/christian-buehner-DItYlc26zVI-unsplash.jpg",
        userId: "3"),
    RequestData(
        id: " 4",
        images:
            "http://192.168.1.57:8000/storage/profile_images/jake-nackos-IF9TK5Uy-KI-unsplash.jpg",
        userId: "4"),
    RequestData(
        id: " 5",
        images:
            "http://192.168.1.57:8000/storage/profile_images/joseph-gonzalez-iFgRcqHznqg-unsplash.jpg",
        userId: "5"),
    RequestData(
        id: " 6",
        images:
            "http://192.168.1.57:8000/storage/profile_images/leilani-angel-K84vnnzxmTQ-unsplash.jpg",
        userId: "6"),
    RequestData(
        id: " 7",
        images:
            "http://192.168.1.57:8000/storage/profile_images/leio-mclaren-L2dTmhQzx4Q-unsplash.jpg",
        userId: "7")
  ];
}
