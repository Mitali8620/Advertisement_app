import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/routes/route_constants.dart';
import '../../../utils/core/helpers/global_helper.dart';
import '../../../utils/core/services/locator_service.dart';
import '../../../utils/core/services/store_keys.dart';
import '../../../utils/core/services/store_service.dart';
import '../models/auth_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  ///for log_In
  TextEditingController logInEmailCtr = TextEditingController();
  TextEditingController logInPassWordCtr = TextEditingController();
  String email = "";
  RxString loginEmailErrorText = "".obs;
  RxString loginPasswordErrorText = "".obs;

  ///for sign_Up
  TextEditingController signUpEmailCtr = TextEditingController();
  TextEditingController signUpPassWordCtr = TextEditingController();
  TextEditingController confirmSignUpPassWordCtr = TextEditingController();
  RxString password = "".obs;
  RxString confirmPassword = "".obs;

  ///for password visibility
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxBool isLogInLoading = false.obs;
  RxBool isSignUpLoading = false.obs;

  RxString errorMsg = "".obs;
  RxString loginErrorMsg = "".obs;
  RxString signUpErrorMsg = "".obs;

  isShowPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  isShowConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  clearInitialDAta() {
    logInEmailCtr.clear();
    logInPassWordCtr.clear();
    signUpEmailCtr.clear();
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
      required String userType,
      required String modelAuthToken}) async {
    LoginModel? storedLoginModel =
        locator<StoreService>().getLoginModel(key: StoreKeys.logInData);

    if (storedLoginModel?.result?.token != null &&
        storedLoginModel?.result?.token != "") {
      GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.myHomeTabBarScreen,
        (Route<dynamic> route) => false,
      );
    } else {
      GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.onBoardingMainScreen,
        (Route<dynamic> route) => false,
      ); /*  GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.onBoardingLoginScreen,
        (Route<dynamic> route) => false,
      );*/
    }
  }

  ///for login
  Future<void> userLogin(
      {required String email, required String password}) async {
    // String apiUrl = '${APIUrls().baseUrl}${APIUrls().login}';
    String apiUrl = '';

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
        var responseData = response.data;
/*
        UserDetails userDetails = UserDetails.fromJson(responseData);

        if (userDetails.data != null) {
          userDetailsValue.value = userDetails;
          successToast(AppString.successLogin);
          StorageServices().setUserToken(userDetails.data!.apiToken);
          Get.offAllNamed(Routes.dashboardScreen);
        } else {
          loginErrorMsg.value = "Failed to login";
        }*/
      } else {
        loginErrorMsg.value = "Failed to login";
      }
    } catch (e) {
      loginErrorMsg.value = "Failed to login";
    } finally {
      isLogInLoading.value = false;
      loginErrorMsg.value = "";
    }
  }

  ///for signUp
  Future<void> userSignUp(
      {required String signUpEmail, required String signUpPassword}) async {
    // String apiUrl = '${APIUrls().baseUrl}${APIUrls().login}';
    String apiUrl = '';

    try {
      errorMsg.value = "";
      signUpErrorMsg.value = "";
      isSignUpLoading.value = true;
      password.value = "";
      confirmPassword.value = "";
      d.Response response = await _dio.post(apiUrl, data: {
        'email': signUpEmail,
        'password': signUpPassword,
      });

      if (response.statusCode == 200) {
        var responseData = response.data;
/*
        UserDetails userDetails = UserDetails.fromJson(responseData);

        if (userDetails.data != null) {
          userDetailsValue.value = userDetails;
          successToast(AppString.successLogin);
          StorageServices().setUserToken(userDetails.data!.apiToken);
          Get.offAllNamed(Routes.dashboardScreen);
        } else {
          loginErrorMsg.value = "Failed to login";
        }*/
      } else {
        loginErrorMsg.value = "Failed to login";
      }
    } catch (e) {
      loginErrorMsg.value = "Failed to login";
    } finally {
      isLogInLoading.value = false;
      loginErrorMsg.value = "";
    }
  }
}
