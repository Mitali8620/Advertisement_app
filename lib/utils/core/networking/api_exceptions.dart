import 'package:dio/dio.dart';
import '../../../screens/auth/models/auth_model.dart';
import '../services/locator_service.dart';
import '../services/store_keys.dart';
import '../services/store_service.dart';

class CustomErrorHandlerInterceptor extends Interceptor {
  CustomErrorHandlerInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    DioExceptions dioException = DioExceptions.fromDioError(err);
    print("DioException: ${dioException.message}");
    print("DioException: ${dioException.message}");
    return super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    UserDetails? storedLoginModel =
        await locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
    print("token value :: ${storedLoginModel?.userData?.token}");
    if (storedLoginModel?.userData?.token != null ||
        storedLoginModel?.userData?.token == '') {
      options.headers['Authorization'] = storedLoginModel?.userData?.token;
      options.headers['Content-Type'] = 'application/json';
    }
    super.onRequest(options, handler);
  }
}

class DioExceptions implements Exception {
  late String message;
  late int statusCode;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 440:
        return 'Unauthorized Token';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 415:
        return 'Unsupported Media Type error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
