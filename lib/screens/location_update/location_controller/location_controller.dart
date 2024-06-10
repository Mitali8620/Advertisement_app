import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../utils/core/services/locator_service.dart';
import '../../../utils/core/services/store_keys.dart';
import '../../../utils/core/services/store_service.dart';

class LocationController extends GetxController {
  Future<void> askPermission() async {
    String isUserSavedLocation = locator<StoreService>()
            .getCurrentAddressLocation(
                locationAddressKey: StoreKeys.currentLocation) ??
        "";
    EasyLoading.show();
    print("isUserSavedLocation :: $isUserSavedLocation");

    if (isUserSavedLocation == "") {
      handleLocationPermission().then((value) async {
        print("value :: $value");

        await locator<StoreService>().setLocationPermissionStatus(
            locationStatusKey: StoreKeys.permissionStatus, data: value);
        storeLocation();
      }).catchError((e) {
        log("Location error :: $e");
        EasyLoading.dismiss();
      });
    } else {
      handleLocationPermission();
    }
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

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
  //  try {
      Position position = await Geolocator.getCurrentPosition();

      print("position.latitude :: ${position.longitude}");

      return await buildFullAddressFromLatLong(
          latitude: position.latitude, longitude: position.longitude);
/*    } catch (e) {
      print('Failed to get location: $e');
      throw e.toString();
    }*/
  }

  Future<String> buildFullAddressFromLatLong(
      {required double latitude, required double longitude}) async {


    List<Placemark> placeMark =
        await placemarkFromCoordinates(latitude, longitude);
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

    return address;
  }
}
