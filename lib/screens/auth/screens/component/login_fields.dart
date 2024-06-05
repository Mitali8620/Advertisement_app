import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../common_components/app_elevated_button.dart';
import '../../../../common_components/common_textfield.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../utils/app_utils/string/strings.dart';
import '../../../../utils/app_utils/string/validation_string.dart';
import '../../../../utils/core/helpers/global_helper.dart';
import '../../auth_controller/auth_controller.dart';

Widget LogInFields ({required AuthController authController}){
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Form(
      child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppSpacer.p12(),

            ///email
            KCommonTextField(
                controller: authController.logInEmailCtr,
                errorMsg: Strings.enterYourEmail,
                hintText: Strings.emailHint,
                prefixIcon: const Icon(Icons.email_outlined)),

            AppSpacer.p12(),

            ///password
            Obx(
                  () => KCommonTextField(
                controller: authController.logInPassWordCtr,
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
      Text(Strings.donHaveAnAccount,
          style: TextStyle(
              color: AppTheme.hintTextColor,
              fontWeight: FontWeight.w400,
              fontFamily: Strings.fontFamily,
              fontSize: 14)),
      GestureDetector(
        onTap: () {
          GlobalInit.navKey.currentState
              ?.pushReplacementNamed(AppRoutes.signUpMainScreen);
        },
        child: Text(" ${Strings.signUp}",
            style: TextStyle(
                color: AppTheme.primaryColor, fontFamily: Strings.fontFamily)),
      ),
    ],
  );
}

Widget buildLoginButton({required AuthController authController}) {
  return AppElevatedButton(
    title: Strings.login,
    isLoading: authController.isLogInLoading.value,
    onPressed: () async {
      EasyLoading.show();
      /// step 1 add mobile number
      ///login
      if (authController.logInEmailCtr.text.isEmpty) {
     //   authController.loginErrorMsg.value = ValidationString.enterEmailAddress;

        EasyLoading.showError(ValidationString.enterEmailAddress);
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(authController.logInEmailCtr.text)) {
        authController.loginErrorMsg.value =
            ValidationString.enterValidEmailAddress;

        EasyLoading.showError(ValidationString.enterValidEmailAddress);
      } else if (authController.logInPassWordCtr.text.isEmpty) {
        authController.loginErrorMsg.value =ValidationString.enterPassWord ;
        EasyLoading.showError(ValidationString.enterPassWord);

      } else if (authController.logInPassWordCtr.text.length <8) {
        EasyLoading.showError(ValidationString.enterValidLengthPassword);

      }else {
        authController.userLogin(
            email: authController.logInEmailCtr.text,
            password: authController.logInPassWordCtr.text);
      }
    },
  );
}
