import 'dart:convert';
import 'package:advertisement_app/screens/auth/models/user_error_model.dart';
import 'package:advertisement_app/screens/location_update/location_controller/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../config/routes/route_constants.dart';
import '../../../network/api_const_string.dart';
import '../../../network/api_urls.dart';
import '../../../network/locations_Api.dart';
import '../../../utils/app_utils/string/validation_string.dart';
import '../../../utils/core/helpers/global_helper.dart';
import '../../../utils/core/services/locator_service.dart';
import '../../../utils/core/services/store_keys.dart';
import '../../../utils/core/services/store_service.dart';
import '../../splash/screens/splash_screen.dart';
import '../models/auth_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  @override
  void onInit() {
///clear initial data;
    clearInitialData();
    super.onInit();
  }


  ///for log_In
  TextEditingController logInEmailCtr = TextEditingController();
  TextEditingController logInPassWordCtr = TextEditingController();
  String email = "";
  RxString loginEmailErrorText = "".obs;
  RxString loginPasswordErrorText = "".obs;

  ///for sign_Up
  TextEditingController signUpEmailCtr = TextEditingController();
  TextEditingController signUpPassWordCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController confirmSignUpPassWordCtr = TextEditingController();
  RxString password = "".obs;
  RxString confirmPassword = "".obs;

  ///for location_update location

  TextEditingController locationSearchCtr = TextEditingController();

  validateStringIfEmptyOnly(String value, String validationString) {
    if (value.trim().isEmpty) {
      return validationString;
    }
    return null;
  }

  String sessionToken = '123456';
  var uuid = const Uuid();
  List<String> places = [];
  List placesList = [];

  Position? currentPosition;
  String? currentAddress;

  getSuggestion(String input) async {
    if (sessionToken.isEmpty) {
      sessionToken = uuid.v4();
    }
    var response = await getPlaces(input, sessionToken);
    places.clear();
    if (response != null) {
      placesList = jsonDecode(response.body.toString())['predictions'];

      for (int i = 0; i < placesList.length; i++) {
        places.add(placesList[i]['description']);
      }
      update();
      return places;
    } else {
      throw Exception('Failed to load data');
    }
  }

  chooseSearchableLocation({required String text, required bool isSaveLatLng}) {
    locationSearchCtr.text = text;
    if(kIsWeb){
      Get.find<LocationController>().getCoordinatesFromAddress(address:text,isSaveLatLng:  isSaveLatLng);
    }else{
      getLocationFromAddress(searchingAddress: text, isSaveLatLng: isSaveLatLng);
    }
  }

  Future<void> getLocationFromAddress(
      {required String searchingAddress, required bool isSaveLatLng}) async {
    
    
    try {
      List<Location> locations = await locationFromAddress(searchingAddress);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        double latitude = location.latitude;
        double longitude = location.longitude;

        print('Latitude: $latitude, Longitude: $longitude');
        update();
        if (location.latitude != 0 && location.longitude != 0) {

          if(isSaveLatLng == true){
            StoreService().setLatitude(latitudeKey: StoreKeys.latitude, data: location.latitude ?? 0);
            StoreService().setLongitude(longitude: StoreKeys.longitude, data: location.longitude ?? 0);


            Future.delayed(Duration(milliseconds: 150)).then((value){
              EasyLoading.showSuccess(ValidationString.locationUpdatedSuccessFully);
            });
          }

          update();
          

          
        } else {
          Future.delayed(const Duration(seconds: 2), () {
            Get.back();
          });
        }
      } else {
        print('No location found for the provided address');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  ///for password visibility
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxBool isLogInLoading = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool isProfileUpdateLoading = false.obs;

  RxString errorMsg = "".obs;
  RxString loginErrorMsg = "".obs;
  RxString signUpErrorMsg = "".obs;

  isShowPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  isShowConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }


  clearSignUpDate(){
    signUpEmailCtr.clear();
    signUpPassWordCtr.clear();
    confirmSignUpPassWordCtr.clear();
    nameCtr.clear();
    email = "";
    password.value = "";
    confirmPassword.value = "";
    isPasswordVisible.value = true;
    isConfirmPasswordVisible.value = true;
    isSignUpLoading.value = false;
  }

  clearLogInData(){
    logInEmailCtr.clear();
    logInPassWordCtr.clear();
    email = "";
    password.value = "";
    isLogInLoading.value = false;
    isPasswordVisible.value = true;
  }


  clearInitialData() {
    logInEmailCtr.clear();
    logInPassWordCtr.clear();
    nameCtr.clear();
    signUpPassWordCtr.clear();
    confirmSignUpPassWordCtr.clear();
    email = "";
    password.value = "";
    confirmPassword.value = "";
    isPasswordVisible.value = true;
    isConfirmPasswordVisible.value = true;
    isLogInLoading.value = false;
    isSignUpLoading.value = false;
  }

  redirectionFromSplashScreen() {
    GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.dashboardScreen,
      (Route<dynamic> route) => false,
    );
  }

  redirectionCheckAfterLogin(
      {required bool isFromVerification,
      required String authToken,
      required String modelAuthToken}) async {
    UserDetails? storedLoginModel =
        locator<StoreService>().getLoginModel(key: StoreKeys.logInData);

    if (storedLoginModel?.userData?.token != null && storedLoginModel?.userData?.token != "") {
      GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.myHomeTabBarScreen,
        (Route<dynamic> route) => false,
      );
    } else {
    /*  GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.myHomeTabBarScreen,
        (Route<dynamic> route) => false,
      ); */


      GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.onBoardingMainScreen,
            (Route<dynamic> route) => false,
      );

    }
  }

  ///for login
  Future<void> userLogin(
      {required String email, required String password}) async {
    String apiUrl = '${APIUrls().baseUrl}${APIUrls().login}';

    try {
      errorMsg.value = "";
      loginErrorMsg.value = "";
      isLogInLoading.value = true;
      loginEmailErrorText.value = "";
      loginPasswordErrorText.value = "";
      d.Response response = await _dio.post(apiUrl, data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print("------------- 1 ------------");
        var responseData = response.data;
        UserDetails userDetails = UserDetails.fromJson(responseData);

        if (userDetails.userData != null) {
          print("------------- 2 ------------");

          userDetailsValue.value = userDetails;

          locator<StoreService>().saveLoginModel(
              key: StoreKeys.logInData, loginModel: userDetails);
          locator<StoreService>() .setAuthKey(authKey: StoreKeys.authToken, data: userDetails.userData?.token ?? "");

          EasyLoading.showSuccess(userDetails.message ?? "");
          StoreService().setUserToken(
              tokenKey: StoreKeys.token,
              data: userDetails.userData?.token ?? "");

          GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.myHomeTabBarScreen,
            (Route<dynamic> route) => false,
          );
        } else {
          print("------------- 3 ------------");
          print("------------- 3 ------------ :: ${userDetails.message}");

          loginErrorMsg.value = "Failed to login";
          EasyLoading.showError(userDetails.message ?? "");
        }
      } else {
        print("------------- 4 ------------");

        //    EasyLoading.showError(responseData.message);
      }
    } catch (e) {
      print("------------- 5 ------------");

      EasyLoading.dismiss();
      loginErrorMsg.value = "";

      print("-------------e:: $e");
      EasyLoading.showError(ValidationString.failedToLoginError);
    } finally {
      isLogInLoading.value = false;
      loginErrorMsg.value = "";
      print("------------- 6 ------------");
    }
  }

  ///for signUp
  Future<void> userSignUp({
    required String signUpEmail,
    required String signUpPassword,
    required String name,
  }) async {
    String apiUrl = '${APIUrls().baseUrl}${APIUrls().signup}';
    EasyLoading.show();

    try {
      errorMsg.value = "";
      signUpErrorMsg.value = "";
      isSignUpLoading.value = true;
      password.value = "";
      confirmPassword.value = "";

      d.Response response = await _dio.post(apiUrl, data: {
        ApiConstString.name: name,
        ApiConstString.email: signUpEmail,
        ApiConstString.password: signUpPassword,
      });

      if (response.statusCode == 200) {
        var responseData = response.data;

        print("responseData -------- :: $responseData");
        if (response.data['status'] != false) {
          UserDetails userDetails = UserDetails.fromJson(responseData);

          if (userDetails.userData != null) {
            userDetailsValue.value = userDetails;
            EasyLoading.showSuccess(userDetails.message ?? "");

          Future.delayed(Duration(milliseconds: 300)).then((value) {
            GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutes.logInMainScreen,
                  (Route<dynamic> route) => false,
            );
          });

          } else {
            EasyLoading.showError(userDetails.message ?? "");
          }
        } else {
          UserErrorModel userErrorModel = UserErrorModel.fromJson(responseData);
          EasyLoading.showError(userErrorModel.message?.email?.first ?? "");
        }
        EasyLoading.dismiss();
      } else {
        loginErrorMsg.value = "Failed to login";
        EasyLoading.showError(ValidationString.failedToSignUpError);
        EasyLoading.dismiss();
      }
    } catch (e) {
      loginErrorMsg.value = "Failed to login";
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
      isLogInLoading.value = false;
      isSignUpLoading.value = false;
      loginErrorMsg.value = "";
    }
  }
}
