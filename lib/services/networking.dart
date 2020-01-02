import 'dart:convert';

import 'package:http/http.dart' as http;

const API_KEY = 'faea71cdb4115df81508043f73ca44bf';
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';


class NetworkingHelper {
  NetworkingHelper({
    this.lat,
    this.lon,
  });

  final double lat;
  final double lon;

  Future getData() async {
    http.Response res = await http.get('$BASE_URL?lat=$lat&lon=$lon&appid=$API_KEY&units=metric');

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(res.statusCode);
    }
  }
}
