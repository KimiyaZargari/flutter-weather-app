
import 'package:flutter/material.dart';

import 'package:loginapp/weather.dart';
import 'package:dio/dio.dart';

class Loading extends StatefulWidget {
  Map loginData = {};

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getWeather();
  }
  void getWeather() async {
    try {
      Response response = await Dio().get('https://api.openweathermap.org/data/2.5/forecast?',
          queryParameters: {
            'q': 'Tehran',
            'units': 'metric',
            'appid': '121bfe664777c886e1481f7feb830455'
          });
      WeatherData weatherData = weatherListFromJson(response.toString());
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'email': widget.loginData['email'],
        'password': widget.loginData['password'],
        'weather': weatherData,

      });
    }catch(e){
      print(e);
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
