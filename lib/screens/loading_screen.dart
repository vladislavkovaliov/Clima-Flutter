import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    this.getLocation();
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(
        locationWeather: weatherData,
      )),
    );
  }
//
//  void getData() async {
//    http.Response res = await http.get('$BASE_URL?lat=${this.latitude}&lon=${this.longitude}&appid=$API_KEY');
//
//    if (res.statusCode == 200) {
//      String data = res.body;
//      var decodedData = jsonDecode(data);
//
//    } else {
//      print(res.statusCode);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
