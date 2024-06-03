import 'package:http/http.dart' as http;

Future getPlaces(String input, String sessionToken) async {
  String kPlacesApiKey = "AIzaSyD77iSXiorGVMdVXMwrkIBsFdEjePBdtTU";
  String baseURL =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  String data = input == "" ? "a" : input;
  String request =
      '$baseURL?input=$data&key=$kPlacesApiKey&sessiontoken=$sessionToken';
  var response =
      await http.get(Uri.parse(request)).timeout(const Duration(seconds: 4));
  return response;
}
