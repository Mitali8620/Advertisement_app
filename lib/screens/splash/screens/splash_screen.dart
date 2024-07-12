import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/app_utils/colors/app_colors.dart';
import '../../../utils/core/services/locator_service.dart';
import '../../../utils/core/services/store_keys.dart';
import '../../../utils/core/services/store_service.dart';
import '../../auth/auth_controller/auth_controller.dart';
import '../../auth/models/auth_model.dart';
import '../widget/text_widget.dart';
ValueNotifier<UserDetails?> userDetailsValue = ValueNotifier(null);
ValueNotifier<String> searchFyndeg = ValueNotifier<String>("");
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());

  Future<void> checkUserData() async {
    String? authToken =
        locator<StoreService>().getAuthKey(authKey: StoreKeys.authToken);
    UserDetails? storedLoginModel =
        locator<StoreService>().getLoginModel(key: StoreKeys.logInData);

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );

    Timer(const Duration(seconds: 5), () async {
      authController.redirectionCheckAfterLogin(
          authToken: authToken ?? "null",
          modelAuthToken: storedLoginModel?.userData?.token ?? "",
          isFromVerification: false);
    });


  }

  @override
  void initState() {
    super.initState();
    checkUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [-0.8, 0.8],
          colors: [
            AppTheme.purple.withOpacity(0.9),
            Theme.of(context).colorScheme.primary
          ],
        )),
        child: Container(
        //  color: Colors.deepPurple,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(),
              ],
            ),
          ),
      ),
    );
  }
}
