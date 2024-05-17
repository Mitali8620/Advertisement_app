import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkConnectivityCubit extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  RxBool isNetworkOn = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      _updateNetworkStatus(result);
    });
  }

  void _updateNetworkStatus(ConnectivityResult result) {
    print("result :: $result");
    if (result == ConnectivityResult.none) {
      isNetworkOn.value = false;
    } else {
      isNetworkOn.value = true;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();

    super.onClose();
  }
}
