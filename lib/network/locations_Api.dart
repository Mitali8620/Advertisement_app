import 'package:http/http.dart' as http;
import '../utils/core/networking/api_endpoints.dart';

Future getPlaces(String input, String sessionToken) async {
  String kPlacesApiKey = ApiEndpoints.googleMapsApiKey;

  String data = input == "" ? "a" : input;
  String request = '${ApiEndpoints.placeApi}$data';

  print("request :: $request");
  var response = await http
      .get(Uri.parse(request));
  print("response :: $response");
  return response;
}
