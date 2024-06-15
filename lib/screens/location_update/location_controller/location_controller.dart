import 'dart:convert';
import 'dart:developer';
import 'package:advertisement_app/screens/auth/auth_controller/auth_controller.dart';
import 'package:advertisement_app/screens/dashboard/main_dashboard_screen/dashboard_controller/dashboard_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../network/api_const_string.dart';
import '../../../utils/core/networking/api_endpoints.dart';
import '../../../utils/core/services/locator_service.dart';
import '../../../utils/core/services/store_keys.dart';
import '../../../utils/core/services/store_service.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {


  Future<void> askPermission() async {
    String isUserSavedLocation = locator<StoreService>()
            .getCurrentAddressLocation(locationAddressKey: StoreKeys.currentLocation) ??
        "";

    bool isUserPermission = locator<StoreService>().getLocationPermissionStatus(
            locationStatusKey: StoreKeys.permissionStatus) ??
        false;

    EasyLoading.show();
    print("isUserSavedLocation :: $isUserSavedLocation");

    if (!(isUserPermission == true)) {
      handleLocationPermission().then((value) async {
        print("value :: $value");

        await locator<StoreService>().setLocationPermissionStatus(
            locationStatusKey: StoreKeys.permissionStatus, data: value);
       await storeLocation();
      }).catchError((e) {
        log("Location error :: $e");
        EasyLoading.dismiss();
      });
    } else {
  //    authController.locationSearchCtr.text = isUserSavedLocation;
      update();
    }
  }

  @override
  void onInit() {
    askPermission();
    print("----------------- location find");
    super.onInit();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(serviceEnabled){
      storeLocation();
    }


    if (!serviceEnabled) {
      await Geolocator.checkPermission();
      Permission.location;

      EasyLoading.showError(
          "Location services are disabled. Please enable the services");

      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        EasyLoading.showError("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      EasyLoading.showError(
          "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<String> storeLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      print("position.latitude :: ${position.longitude}");
      String gAddress = "";

      if(kIsWeb){
        gAddress = await getGeocodingData(latitude: position.latitude, longitude: position.longitude);
      }else{
        gAddress = await buildFullAddressFromLatLong(latitude: position.latitude, longitude: position.longitude);
      }

      print("=============== gAddress :: $gAddress");
      return gAddress;
    } catch (e) {
      print('Failed to get location: $e');
      throw e.toString();
    }
  }

  Future<String> buildFullAddressFromLatLong({required double latitude, required double longitude}) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(latitude, longitude);
    print("placeMark :: $placeMark");

    await locator<StoreService>()
        .setLatitude(latitudeKey: StoreKeys.latitude, data: latitude);
    await locator<StoreService>()
        .setLongitude(longitude: StoreKeys.longitude, data: longitude);

    Placemark place = placeMark[0];
    print("place :: $place");

    String address = '';

    if ((place.name != "" && place.name != null) &&
        (place.street != "" && place.street != null) &&
        (place.name != place.street)) {
      address = '${place.name}, ';
      if ((place.name != "" && place.name != null)) {
        address = '${place.name}, ';
      }

      if (place.street != "" && place.street != null)
        address = '$address${place.street}';
      if (place.locality != "" && place.locality != null)
        address = '$address, ${place.locality}';
      if (place.administrativeArea != "" && place.administrativeArea != null)
        address = '$address, ${place.administrativeArea}';
      if (place.postalCode != "" && place.postalCode != null)
        address = '$address, ${place.postalCode}';
      if (place.country != "" && place.country != null)
        address = '$address, ${place.country}';

      await locator<StoreService>().setCurrentAddressLocation(
          locationAddressKey: StoreKeys.currentLocation, data: address);
      print("address :: $address");

    }
    return address;
  }

  Future<String> buildGoogleAddressValue({required double latitude, required double longitude}) async {


    await locator<StoreService>()
        .setLatitude(latitudeKey: StoreKeys.latitude, data: latitude);
    await locator<StoreService>()
        .setLongitude(longitude: StoreKeys.longitude, data: longitude);
/*
    GeoData place = await Geocoder2.getDataFromCoordinates(
        latitude: latitude,
        longitude: longitude,
        googleMapApiKey: ApiEndpoints.googleMapsApiKey);

    print("Google Data address :: ${place.address}");

    String address = '';

    if ((place.address != "" && place.address != null)) {
      address = '${place.address}, ';
    }

    await locator<StoreService>().setCurrentAddressLocation(
        locationAddressKey: StoreKeys.currentLocation, data: address);
    print("address :: $address");

    return address;*/

    return "";
  }

  Future<String> getGeocodingData({required double latitude, required double longitude}) async {
    String apiKey = ApiEndpoints.googleMapsApiKey;
    String url = '${ApiEndpoints.googlePlaceSearchFromLatLagApi}?${ApiConstString.latLng}=$latitude,$longitude&${ApiConstString.key}=$apiKey';
    String address = "";


    await locator<StoreService>()
        .setLatitude(latitudeKey: StoreKeys.latitude, data: latitude);
    await locator<StoreService>()
        .setLongitude(longitude: StoreKeys.longitude, data: longitude);

    print("url :: $url");
    print("latitude  in address to lat:: $latitude");
    print("longitude :: $longitude");

    EasyLoading.show();
 //   try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final results = data['results'];
          if (results.isNotEmpty) {
            address = results[0]['formatted_address'];
          } else {
            print('No results found');
            address = "";
          }
        } else {
          print('Geocoding failed: ${data['status']}');
          EasyLoading.showError(data['status']);
        }
        EasyLoading.dismiss();
      } else {
        print('HTTP error: ${response.statusCode}');
        EasyLoading.showError(response.statusCode.toString() ?? "0");
        address = "";
      }
   /* } catch (e) {
      print('Error: $e');
      EasyLoading.showError(e.toString());
      address = "";
    }*/
    print("=============== :: $address");
    await locator<StoreService>().setCurrentAddressLocation(locationAddressKey: StoreKeys.currentLocation, data: address);

    Get.find<DashBoardController>().currentLocation.value = address;
      update();
    return address;
  }



  Future<Map<String, double>?> getCoordinatesFromAddress({required String address, required bool isSaveLatLng}) async {
    String apiKey = ApiEndpoints.googleMapsApiKey;
    final encodedAddress = Uri.encodeQueryComponent(address); // Use encodeQueryComponent for encoding the address

    final url = '${ApiEndpoints.googlePlaceSearchFromLatLagApi}?${ApiConstString.address}=$encodedAddress&${ApiConstString.key}=$apiKey';
   // 'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$apiKey');

    print("url :: $url");
   // try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final location = data['results'][0]['geometry']['location'];
          final lat = location['lat'];
          final lng = location['lng'];
        if (lat != 0 && lng != 0) {
          print("lat :: $lat");
          print("lng :: $lng");

          if (isSaveLatLng == true) {
            StoreService().setLatitude(latitudeKey: StoreKeys.latitude, data: lat ?? 0);
            StoreService().setLongitude(longitude: StoreKeys.longitude, data: lng ?? 0);
          }
          update();
        } else {
            Future.delayed(const Duration(seconds: 2), () {
              Get.back();
            });
          }

          return {'latitude': lat, 'longitude': lng};
        } else {
          print('Geocoding failed: ${data['status']}');
        }
      } else {
        print('HTTP error: ${response.statusCode}');
      }/*
    } catch (e) {
      print('Error: $e');
    }*/
    return null;
  }

}
