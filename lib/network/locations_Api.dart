import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/core/networking/api_endpoints.dart';

Future getPlaces(String input, String sessionToken) async {
  String kPlacesApiKey = ApiEndpoints.googleMapsApiKey4;
  String baseURL = (kIsWeb)
      ? 'https://proxy.cors.sh/https://maps.googleapis.com/maps/api/place/autocomplete/json'
      : 'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  var headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
    "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token"
  };

  String data = input == "" ? "a" : input;
  String request = '$baseURL?input=$data&key=$kPlacesApiKey';

  print("request :: $request");
  var response = await http
      .get(Uri.parse(request), headers: headers)
      .timeout(const Duration(seconds: 4));

  return response;
}
