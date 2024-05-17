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
      {required LoginModel loginModel, required String key}) async {
    await storage.write(key, loginModel.toJson());
  }

  LoginModel? getLoginModel({required String key}) {
    final json = storage.read(key);
    return json != null
        ? LoginModel.fromJson(Map<String, dynamic>.from(json))
        : null;
  }

  setAuthKey({required String authKey, required String data}) async {
    await storage.write(authKey, data);
  }

  String? getAuthKey({required String authKey}) {
    String? data = storage.read(authKey);
    return data;
  }

  clearData() {
    storage.remove(StoreKeys.authToken);
    storage.remove(StoreKeys.logInData);
    storage.remove(StoreKeys.categoryListItems);
    storage.erase();
  }
}
