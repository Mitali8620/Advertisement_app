import 'package:get_storage/get_storage.dart';
import '../../../screens/auth/models/auth_model.dart';
import 'store_keys.dart';

class StoreService {
  GetStorage storage = GetStorage();

  setData({required String key, required String data}) async {
    await storage.write(key, data);
  }

  String? getData({required String key}) {
    String? data = storage.read(key);
    return data;
  }

  setMapData(
      {required String key, required List<Map<String, dynamic>> data}) async {
    await storage.write(key, data);
  }

  List<dynamic> getMapData({required String key}) {
    List<dynamic>? data = storage.read(key);
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<void> saveLoginModel(
      {required UserDetails loginModel, required String key}) async {
    await storage.write(key, loginModel.toJson());
  }

  UserDetails? getLoginModel({required String key}) {
    final json = storage.read(key);
    return json != null
        ? UserDetails.fromJson(Map<String, dynamic>.from(json))
        : null;
  }


  ///token
  setAuthKey({required String authKey, required String data}) async {
    await storage.write(authKey, data);
  }

  String? getAuthKey({required String authKey}) {
    String? data = storage.read(authKey);
    return data;
  }

  ///location_permission_status
  setLocationPermissionStatus({required String locationStatusKey, required bool data}) async {
    await storage.write(locationStatusKey, data);
  }

  bool? getLocationPermissionStatus({required String locationStatusKey}) {
    bool? data = storage.read(locationStatusKey);
    return data;
  }

  ///current_location
  setCurrentAddressLocation({required String locationAddressKey, required String data}) async {
    await storage.write(locationAddressKey, data);
  }

  String? getCurrentAddressLocation({required String locationAddressKey}) {
    String? data = storage.read(locationAddressKey);
    return data;
  }

  ///latitude
  setLatitude({required String latitudeKey, required double data}) async {
    await storage.write(latitudeKey, data);
  }

  double? getLatitude({required String latitudeKey}) {
    double? data = storage.read(latitudeKey);
    return data;
  }

  ///longitude
  setLongitude({required String longitude, required double data}) async {
    await storage.write(longitude, data);
  }

  double? getLongitude({required String longitude}) {
    double? data = storage.read(longitude);
    return data;
  }




  setUserToken({required String tokenKey, required String data}) async {
    await storage.write(tokenKey, data);
  }

  String? getUserToken({required String tokenKey}) {
    String? data = storage.read(tokenKey);
    return data;
  }

  clearData() {
    storage.remove(StoreKeys.authToken);
    storage.remove(StoreKeys.logInData);
    storage.remove(StoreKeys.categoryListItems);
    storage.erase();
  }
}
