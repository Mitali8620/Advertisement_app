import 'package:advertisement_app/screens/location_update/location_controller/location_controller.dart';
import 'package:advertisement_app/utils/app_utils/assets/assets_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../network/api_const_string.dart';
import '../../../../network/api_urls.dart';
import '../../../../utils/app_utils/string/strings.dart';
import '../../../../utils/core/helpers/global_helper.dart';
import '../../../../utils/core/services/locator_service.dart';
import '../../../../utils/core/services/store_keys.dart';
import '../../../../utils/core/services/store_service.dart';
import '../../../auth/models/auth_model.dart';
import '../../model/category_response_data_model.dart';
import 'package:dio/dio.dart' as d;

import '../models/get_request_details_response_data_model.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> tabScaffoldKey = GlobalKey<ScaffoldState>();

LocationController locationController = Get.put(LocationController());

class DashBoardController extends GetxController {
  final d.Dio _dio = d.Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

String currentLocation = "";


  @override
  void onInit() {
    isCheckLocationPermissionStatus();
    print("----------------- location find");
    storedLoginModel =locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
    displaySavedLocation();
    super.onInit();
  }

  int currentIndex = 0;
  int tabBarIndex = 0;
  TabController? tabController;
  int currentTabIndex = 0;


 Future<String> displaySavedLocation() async {
    currentLocation = StoreService().getCurrentAddressLocation(locationAddressKey: StoreKeys.currentLocation) ?? "";
    update();
    return currentLocation;
  }

  ///tab list item
  List<String> homeTabsCategoryItem = [
    Strings.allFyndEG,
    Strings.groceries,
    Strings.restaurants,
    Strings.homeAndGarden,
    Strings.pharmacy,
    Strings.generalMerchandise,
    Strings.electronics,
    Strings.babyAndKids,
    Strings.fashion,
    Strings.automotive,
    Strings.sportingGoods,
    Strings.pets,
    Strings.office,
    Strings.specialty,
  ];
  ///tab list item
  List<String> homeTabsCategoryItemImages = [
    Assets.allFyndergImage,
    Assets.groceriesImage,
    Assets.restaurantsImage,
    Assets.homeAndGardenImage,
    Assets.pharmacyImage,
    Assets.generalMerchandiseImage,
    Assets.electronicsImage,
    Assets.babyAndKidsImage,
    Assets.fashionImage,
    Assets.automotiveImage,
    Assets.sportingGoodsImage,
    Assets.petsImage,
    Assets.officeImage,
    Assets.specialtyImage,
  ];
  ///start location permission


isCheckLocationPermissionStatus(){
  bool isLocationPermissionStatus = locator<StoreService>().getLocationPermissionStatus(locationStatusKey: StoreKeys.permissionStatus) ?? false;
    locationController.askPermission();
}

  ///end location permission

  String getItemAtIndex({required int index}) {
    if (index < 0 || index >= homeTabsCategoryItem.length) {
      throw RangeError('Index out of range');
    }
    return homeTabsCategoryItem[index];
  }

  UserDetails? storedLoginModel;

  UserDetails? getLogInData() {
    storedLoginModel =
        locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
    return storedLoginModel;
  }

  void changeTabIndex(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  Future<void> changeTabBarIndex(int newIndex) async {
    tabBarIndex = newIndex;
    print("=========================== 1 ::  $tabBarIndex ");
    print("=========================== 2 :: $newIndex ");
    print("=========================== 3 ::  $tabBarIndex ");

    await getLoginUserAllRequestData(
      pageSize: paginationDataPageSize,
      pageValue: page,
      category: newIndex ?? 0,
      isFirstPage: true,
    );
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
   // currentDrawerIndex.value = 0;
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
  }

  void thirdMenuOnTap() {
    currentDrawerIndex.value = 2;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }

  void fourMenuOnTap() {
    currentDrawerIndex.value = 3;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }

  void fiveMenuOnTap() {
    currentDrawerIndex.value = 4;
    GlobalInit.mainNavigation.currentState!
        .pushReplacementNamed(AppRoutes.homePageTabletWebTabWidget);
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        Get.back();
      });
    }
  }

  void sixMenuOnTap() {
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

  void logOutOnTap(){
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      StoreService().clearData();
      GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.logInMainScreen,
            (Route<dynamic> route) => false,
      );
    });
  }

  ///-------------------------------------- for tabBar
  ///get login user request (seller second tab)
  CategoryResponseDataModel getRequestAllData = CategoryResponseDataModel();

  List<CategoryData> requestItemsList = [];

  //List<RequestData> requestItemsList = [];

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
      requestItemsList.clear();
      requestItemsList = [];
  }

  reloadCategoryData() {
    setInitialAllHomeDataValue();
    update();
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      changeTabBarIndex(currentDrawerIndex.value);
      update();
    });
  }

  void updateRequestItemsList({required List<RequestData> newList}) {
  //  requestItemsList = requestItemsListData;
    update(); // Notify listeners about the change
  }

  List<RequestData> requestItemsListDataV = [
    RequestData(
        id: "1",
        image: [
          "https://imgs.search.brave.com/hn8zKSWqXcFo-YaT9HAzqq1II8PRlo4lBCsOx3A7Mj8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxOC8w/Mi8wOC8yMi8yNy9m/bG93ZXItMzE0MDQ5/Ml82NDAuanBn",
          "https://imgs.search.brave.com/dpeg8Vh7_2zu4lDcDcuIkwYZNXY5rHHbQhBNmumlwL0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9iZWF1dGlmdWwt/bmF0dXJlLW1vdW50/YWluLXNjZW5lcnkt/d2l0aC1mbG93ZXJz/LWZyZWUtcGhvdG8u/anBnP3c9NjAwJnF1/YWxpdHk9ODA"
        ],
        userId: "1"),
    RequestData(
        id: " 2",
        image: [
          "https://imgs.search.brave.com/dpeg8Vh7_2zu4lDcDcuIkwYZNXY5rHHbQhBNmumlwL0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9iZWF1dGlmdWwt/bmF0dXJlLW1vdW50/YWluLXNjZW5lcnkt/d2l0aC1mbG93ZXJz/LWZyZWUtcGhvdG8u/anBnP3c9NjAwJnF1/YWxpdHk9ODA"
        ],
        userId: "2"),
    RequestData(
        id: " 3",
        image: [
          "https://imgs.search.brave.com/jTvZUnDxoqiuRyQllST5fchF58YyNi_0nLAw87PfDE4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE1/NzIwNTE3Ny9waG90/by9zdW5zZXQtd2l0/aC1wZWJibGVzLW9u/LWJlYWNoLWluLW5p/Y2UtZnJhbmNlLndl/YnA_Yj0xJnM9MTcw/NjY3YSZ3PTAmaz0y/MCZjPXBMVEd5SDYt/OGMxZUxOSndJTHp0/UW9VemhOMmQ2bGlr/WlJLSnI5YWFrNWs9"
        ],
        userId: "3"),
    RequestData(
        id: " 4",
        image: [
          "https://imgs.search.brave.com/xER1Y2TVfLBi3yfxIMq63ALFUdeqEuUXRlvbhOw1GZc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE3/Nzk1NzU3Ny9waG90/by93b3JsZC1lbnZp/cm9ubWVudC1kYXkt/Y29uY2VwdC53ZWJw/P2I9MSZzPTE3MDY2/N2Emdz0wJms9MjAm/Yz1xZ2RfR0V4LVo2/ODJNTVVhbGp6eFV4/NXc2RnpILV83bnVD/aFM5ZXlEYlFjPQ"
        ],
        userId: "4"),
    RequestData(
        id: " 5",
        image: [
          "https://imgs.search.brave.com/5E1g3jR6Fm7OzDyI4aK0hkDG7HCcDtT76TG7EST_TGo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9ocmx0eDEy/cGw4aHEvMXBSWUly/RTdnbkw3SXdCY0V2/SDdOci82MjVmYzk4/ZjRmMzAxMjBjY2Mw/YTYwM2M4NGVlOGIz/YS8wX2hlcm9fbmV3/X18xXy53ZWJwP2Zp/dD1maWxsJnc9NjAw/Jmg9MTIwMA"
        ],
        userId: "5"),
    RequestData(
        id: " 6",
        image: [
          "https://imgs.search.brave.com/jy_8WfHR5ETwTXH4flDkp4kED4-Vo--5poTyoNOB3Is/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9mcmVl/bmF0dXJlc3RvY2su/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy9m/cmVlbmF0dXJlc3Rv/Y2stMjE4NS03Njh4/MTIxNC5qcGc"
        ],
        userId: "6"),
    RequestData(
        id: " 7",
        image: [
          "https://imgs.search.brave.com/w4l7JgbPJk7kx-uMfM6A1aBnf9b8sjZepqDSgqCHeZw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9sYW5kc2NhcGUt/cGhvdG8tbGFrZV82/NjUyODAtMjc2MjMu/anBnP3NpemU9NjI2/JmV4dD1qcGc"
        ],
        userId: "7")
  ];

  ///for display pagination fetch data circular
  bool isFetchDataLoading = false;
  bool isLezyLoading = true;

  Future<void> getLoginUserAllRequestData({
    required int pageValue,
    required int pageSize,
    required int category,
    bool? isFirstPage,
  }) async {

    EasyLoading.show();
    double latitude = StoreService().getLatitude(latitudeKey: StoreKeys.latitude) ?? 0;
    double longitude = StoreService().getLongitude(longitude: StoreKeys.longitude) ?? 0;

    print("Latitude :: $latitude");
    print("longitude :: $longitude");

    String apiUrl = '${APIUrls().baseUrl}${APIUrls().getPosts}';
    Map<String, dynamic>? queryParameters = {};
    UserDetails? storedLoginModel =locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
    try {
      if (hasReachedEnd != true) {
        isFetchDataLoading = true;
        if (category != 0) {
          queryParameters = {
            ApiConstString.page: page,
            ApiConstString.category: getItemAtIndex(index: category),
          };
        } else {
          queryParameters = {
            ApiConstString.page: page,
          };
        }

        print("queryParameters :: $queryParameters");

        String? authToken =
            locator<StoreService>().getAuthKey(authKey: StoreKeys.authToken);
        d.Response getLoginUSerAllRequestDataResponse = await _dio.get(apiUrl,
            queryParameters: queryParameters,
            options: d.Options(
              headers: {
                'Authorization': 'Bearer $authToken',
              },
            ));

        final responseData = getLoginUSerAllRequestDataResponse.data;

        if (getLoginUSerAllRequestDataResponse.statusCode == 200) {
          getRequestAllData = CategoryResponseDataModel.fromJson(getLoginUSerAllRequestDataResponse.data);
          List<CategoryData> data =
              getRequestAllData.data?.categoryListData ?? [];
          totalData += data.length;
          update();
          if (data.isNotEmpty || data.length != 0) {
            isNoData = false;
            update();
            if (isFirstPage ?? false) {
              /// Clear the list if it's the first page
              requestItemsList.clear();
              requestItemsList.addAll(data);
              isFetchDataLoading = false;
              update();
            } else {
              requestItemsList.addAll(data);
              isFetchDataLoading = false;
              update();
            }

            if (totalData >= 0/*(responseData['data']['total'] ?? 0)*/) {
              hasReachedEnd = true;
              isFetchDataLoading = false;
              isLezyLoading = false;
              update();
            } else {
              page += 1;

              isFetchDataLoading = false;
              update();
            }
          } else {
            isFetchDataLoading = false;
            isNoData = true;
            update();
          }
        } else {
          isFetchDataLoading = false;
          update();

          ///error message
          EasyLoading.showError(responseData.statusMessage ?? "");
        }
      } else {
        isFetchDataLoading = false;
        print("hasReachedEnd 3 :: $hasReachedEnd");
        update();
      }

      EasyLoading.dismiss();
    } on DioError catch (e) {
      isFetchDataLoading = false;
      update();

      print("Error :: ${e.response?.data['message'] ?? ""}");
      EasyLoading.showError(e.response?.data['message'] ?? "");
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
    }
  }
}
