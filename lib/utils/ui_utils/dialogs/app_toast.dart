import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppToast {
  static showSuccess({required String message}) {
    return EasyLoading.showInfo(message);
  }

  static showFailure({required String message}) {
    return EasyLoading.showInfo(message);
  }

  static showWaring({required String message}) {
    return EasyLoading.showInfo(message);
  }
}

printValue(value){
  return  print(value);
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..userInteractions = false
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorSize = 45.0
    ..radius = 10.0;
}