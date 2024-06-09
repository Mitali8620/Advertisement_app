import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../common_components/app_elevated_button.dart';
import '../../../../utils/app_utils/string/strings.dart';
import 'package:flutter/material.dart';
import '../../../../common_components/common_textfield.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../utils/app_utils/string/validation_string.dart';
import '../../../../utils/core/helpers/global_helper.dart';
import '../../auth_controller/auth_controller.dart';

Widget signUpFields({required AuthController authController}) {
  EasyLoading.dismiss();

  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Form(
      child: Column(children: [
        AppSpacer.p12(),

        ///name
        KCommonTextField(
            controller: authController.nameCtr,
            errorMsg: Strings.enterYourName,
            hintText: Strings.nameHint,
            prefixIcon: const Icon(Icons.person)),
        AppSpacer.p12(),

        ///email
        KCommonTextField(
            controller: authController.signUpEmailCtr,
            errorMsg: Strings.enterYourEmail,
            hintText: Strings.emailHint,
            prefixIcon: const Icon(Icons.email_outlined)),
        AppSpacer.p12(),

        ///password
        Obx(
          () => KCommonTextField(
            controller: authController.signUpPassWordCtr,
            hintText: Strings.password,
            errorMsg: Strings.enterYourPassword,
            prefixIcon: const Icon(Icons.lock),
            obscureText: authController.isPasswordVisible.value,
            suffixOnPressed: () {
              authController.isShowPassword();
            },
            suffixIcon: authController.isPasswordVisible.value
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
          ),
        ),
/* Obx(() =>
              CommonErrorWidget(message: authController.loginErrorMsg.value)),
*/

        AppSpacer.p12(),

        ///confirm_password
        Obx(
          () => KCommonTextField(
            controller: authController.confirmSignUpPassWordCtr,
            hintText: Strings.password,
            errorMsg: Strings.enterYourPassword,
            prefixIcon: const Icon(Icons.lock),
            obscureText: authController.isConfirmPasswordVisible.value,
            suffixOnPressed: () {
              authController.isShowConfirmPassword();
            },
            suffixIcon: authController.isConfirmPasswordVisible.value
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
          ),
        ),
        AppSpacer.p12(),

        ///show purpose text
        logInBottomText(),
        AppSpacer.p24(),
      ]),
    ),
  );
}

Widget logInBottomText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(Strings.alreadyHaveAnAccount,
          style: TextStyle(
              color: AppTheme.hintTextColor,
              fontWeight: FontWeight.w400,
              fontFamily: Strings.fontFamily,
              fontSize: 14)),
      GestureDetector(
        onTap: () {
          GlobalInit.navKey.currentState
              ?.pushReplacementNamed(AppRoutes.logInMainScreen);
        },
        child: Text(" ${Strings.login}",
            style: TextStyle(
                color: AppTheme.primaryColor, fontFamily: Strings.fontFamily)),
      ),
    ],
  );
}

Widget buildSignUpButton({required AuthController authController}) {
  return AppElevatedButton(
    title: Strings.signUp,
    isLoading: authController.isSignUpLoading.value,
    onPressed: () async {
      /// step 2 add mobile number
      ///sign up
      if (authController.nameCtr.text.isEmpty) {
        print("----------------- 1 ----------------- *");
        authController.signUpErrorMsg.value = ValidationString.enterName;
        EasyLoading.showError(ValidationString.enterName);
      } else if (authController.signUpEmailCtr.text.isEmpty) {
        print("----------------- 2 ----------------- *");

        authController.signUpErrorMsg.value =
            ValidationString.enterEmailAddress;
        EasyLoading.showError(ValidationString.enterEmailAddress);
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(authController.signUpEmailCtr.text)) {
        print("----------------- 3 ----------------- *");

        authController.signUpErrorMsg.value =
            ValidationString.enterValidEmailAddress;
        EasyLoading.showError(ValidationString.enterValidEmailAddress);
      } else if (authController.signUpPassWordCtr.text.isEmpty) {

        authController.signUpErrorMsg.value = ValidationString.enterPassWord;
        EasyLoading.showError(ValidationString.enterPassWord);
        print("----------------- 4 ----------------- *");

      } else if (authController.signUpPassWordCtr.text.length < 8) {

        authController.signUpErrorMsg.value =
            ValidationString.enterValidPassword;
        EasyLoading.showError(ValidationString.enterValidPassword);
        print("----------------- 5 ----------------- *");

      } else if (authController.confirmSignUpPassWordCtr.text.isEmpty) {

        authController.signUpErrorMsg.value =
            ValidationString.enterConfirmPassWord;
        EasyLoading.showError(ValidationString.enterConfirmPassWord);
        print("----------------- 6 ----------------- *");

      } else if (authController.confirmSignUpPassWordCtr.text.length < 8) {

        authController.signUpErrorMsg.value =
            ValidationString.enterValidLengthPassword;
        EasyLoading.showError(ValidationString.enterValidLengthPassword);
        print("----------------- 7 ----------------- *");

      } else if ((authController.signUpPassWordCtr.text) != (authController.confirmSignUpPassWordCtr.text)) {
        authController.signUpErrorMsg.value = ValidationString.passWordAndConfirmPasswordMisMatchError;
       EasyLoading.showError(ValidationString.passWordAndConfirmPasswordMisMatchError);
        print("----------------- 8 ----------------- *");

      } else {
        authController.userSignUp(
            signUpEmail: authController.signUpEmailCtr.text,
            signUpPassword: authController.signUpPassWordCtr.text,
            name: authController.nameCtr.text);
      }
    },
  );
}
