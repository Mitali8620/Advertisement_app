import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../screens/auth/models/auth_model.dart';
import '../services/locator_service.dart';
import '../services/store_keys.dart';
import '../services/store_service.dart';
import 'api_endpoints.dart';

class ClientImpl {
  final Dio dio;

  ClientImpl(this.dio);

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    print("headers data :: ${dio.options.headers}");

    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: url, method: "get");
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response> getSetPathUrl(String baseUrl, String path,
      {Map<String, dynamic>? queryParameters}) async {
    final url = '$baseUrl$path';

    print("headers data :: ${dio.options.headers}");

    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: url, method: "getSetPathUrl", path: path);
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    print("headers data :: ${dio.options.headers}");
    try {
      final response = await dio.post(url, data: data);
      // print("response :: ${response}");
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: url, method: "post", data: data);
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response> postFormData({
    required String endpoint,
    required String fileName,
    required File file,
    Function(int)? progressCallback,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response = await dio.post(
        endpoint,
        data: formData,
        options: Options(contentType: "multipart/form-data"),
        onSendProgress: (count, total) {
          if (total != -1 && progressCallback != null) {
            int progressPercentage = ((count / total) * 100).round();
            progressCallback(progressPercentage);
          }
        },
      );

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: endpoint, method: "postFormData", file: file);
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response> put(
      {required String url, Map<String, dynamic>? data, String? path}) async {
    try {
      print("headers data :: ${dio.options.headers}");
      print("headers data data:: $data");

      if (path != "" && path != null) {
        final finalUrl = '$url$path';

        final response = await dio.put(finalUrl);
        return response;
      } else {
        final response = await dio.put(url, data: data);
        return response;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: url, method: "put", data: data);
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response> delete(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      print("headers data :: ${dio.options.headers}");
      final response = await dio.delete(url, data: data);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        await refreshToken(url: url, method: "delete", data: data);
      } else if (e.response?.statusCode == 401) {
        await logOutToUser();
      }
      rethrow;
    }
  }

  Future<Response?> refreshToken({
    required String url,
    Map<String, dynamic>? data,
    required String method,
    Map<String, dynamic>? queryParameters,
    File? file,
    String? path,
  }) async {
    try {
      Response? response;
      UserDetails? storedLoginModel =
          locator<StoreService>().getLoginModel(key: StoreKeys.logInData);
      final Map<String, String> headers = {
        'Accept': 'text/plain',
        'Content-Type': 'application/json'
      };

      final Map<String, dynamic> body = {
        'refreshToken': storedLoginModel?.userData?.token
      };

      final refreshTokenResponse = await dio.post(
        data: body,
        ApiEndpoints.refreshToken,
        options: Options(headers: headers),
      );

      if (refreshTokenResponse.statusCode == 200) {
        final Map<String, dynamic> responseData = refreshTokenResponse.data;
        final String newAccessToken = responseData['refreshToken'];

        UserDetails loginModel = UserDetails.fromJson(responseData);

        locator<StoreService>().storage.remove(StoreKeys.authToken);
        locator<StoreService>()
            .saveLoginModel(key: StoreKeys.logInData, loginModel: loginModel);
        String? authToken =
            locator<StoreService>().getAuthKey(authKey: StoreKeys.authToken);

        if (authToken != null && authToken != "") {
          locator<StoreService>().storage.remove(StoreKeys.logInData);
          locator<StoreService>() .setAuthKey(authKey: StoreKeys.authToken, data: newAccessToken);
        }

        //   dio.options.headers.remove("Content-Type");
        dio.options.headers.remove("Accept");

        if (method == "get") {
          response = await get(url, queryParameters: queryParameters);
        } else if (method == "post") {
          response = await post(url, data: data);
        } else if (method == "put") {
          response = await put(url: url, data: data, path: path);
        } else if (method == "postFormData") {
          response = await postFormData(
              endpoint: url, file: file!, fileName: file.path.split('/').last);
        } else if (method == "getSetPathUrl") {
          response = await getSetPathUrl(url, path ?? "",
              queryParameters: queryParameters);
        }
      } else {
        await logOutToUser();

        ///call logout
        /// TODO REMOVE HERE
      }
      return response;
    } on DioError catch (e) {
      print("ClientImpl ${e.toString()}");
      if (e.response?.statusCode == 401) {
        await logOutToUser();
      } else {
        EasyLoading.dismiss();
      }
      rethrow;
    }
  }

  ///logout user
  Future<void> logOutToUser() async {
    try {
      final response = await dio.post(ApiEndpoints.logOut);

      print("logOut data :: ${response.data}");
      if (response.statusCode == 200 || response.data != null) {
        ///  logOut success
        /*      FirebaseAuth.instance.signOut();
        StoreService().clearData();
        EasyLoading.showInfo(response.data['message'] ?? "");
        GlobalInit.navKey.currentState?.pushNamedAndRemoveUntil(
            AppRoutes.onBoardingLoginScreen, (route) => false,
            arguments: OnBoardingScreenArgs(isFromDeleteAndLogOut: true));
      */
      } else {
        ///  logOut failed
        EasyLoading.showError(response.data['message'] ?? "");
      }
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message'] ?? "");
    }
  }

  ///update_user_profile_image
  Future<Response> upLoadUserProfileImageFile({
    required String profileImage,
  }) async {
    var imageUploadResponse = await postFormData(
        endpoint: ApiEndpoints.fileUpload,
        file: File(profileImage),
        fileName: File(profileImage).path.split('/').last);

    return imageUploadResponse;
  }
}
