
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'config/routes/app_router.dart';
import 'config/routes/route_constants.dart';
import 'utils/app_utils/string/strings.dart';
import 'utils/core/helpers/global_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalInit.navKey,
      builder: EasyLoading.init(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
