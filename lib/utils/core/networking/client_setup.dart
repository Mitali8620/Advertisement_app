import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../services/locator_service.dart';
import 'api_exceptions.dart';

/// this method is for setting up dio client

// class NetworkService {
//   static NetworkService? _instance;
//
//   static NetworkService get instance {
//     if (_instance != null) return _instance!;
//     _instance = NetworkService._init();
//     return _instance!;
//   }
//
//   late final Dio dio;
//
//   NetworkService._init() {
//     dio = setUpApiClient();
//   }
// }

Dio getDioInstance() {
  Dio dio = locator<Dio>();
  dio.interceptors.add(CustomErrorHandlerInterceptor());

  if (kDebugMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  return dio;
}
