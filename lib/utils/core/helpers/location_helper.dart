//import 'package:location/location.dart';
import '../enums/app_enums.dart';

class LocationHelper {
 /* Location location = Location();
  LocationData? _locationData;*/
  LocationStatus? _locationStatus;

  Future<LocationStatus?> _checkLocation() async {
/*    await location.requestService();
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted == PermissionStatus.deniedForever) {
      AppToast.showFailure(message: "Permission is denied forever. Please open app setting to allow");
    }

    if (_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
      _locationData = await location.getLocation();
      if (_locationData != null) {
        _locationStatus =  LocationStatus.enabled;
      } else {
        _locationStatus =  LocationStatus.disabled;
      }
    }
    return _locationStatus;*/
  }

  _getLatLang() async {
  /*  _locationData = await location.getLocation();
    return _locationData;*/
  }

/*  Future<LocationData?> checkUserLocation() async {
    var status = await _checkLocation();
    if (status == LocationStatus.enabled) {
      var latlng = await _getLatLang();
      return latlng;
    }
    return null;
  }*/
}
