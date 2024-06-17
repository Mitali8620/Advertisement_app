import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'config/firebase/firebase_options.dart';
import 'utils/core/helpers/global_helper.dart';
import 'utils/ui_utils/dialogs/app_toast.dart';
import 'dart:io' show Platform;

Future<void> main() async {


  await GlobalInit().globalInitializer();

  ///list of bloc used
  blocProvider() {
    return MyApp();
  }

  await GetStorage.init();
  configLoading();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } else {
    if (Platform.isAndroid) {
      print("Platform is :: Android");
    } else if (Platform.isIOS) {
      print("Platform is :: IOS");
    }
  }

  ///run app
  runApp(blocProvider());
}
