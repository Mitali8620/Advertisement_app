import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'utils/core/helpers/global_helper.dart';
import 'utils/ui_utils/dialogs/app_toast.dart';

Future<void> main() async {


  await GlobalInit().globalInitializer();

  ///list of bloc used
  blocProvider() {
    return MyApp();
  }

  await GetStorage.init();
  configLoading();

  ///run app
  runApp(blocProvider());
}
