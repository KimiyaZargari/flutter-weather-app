import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gson/gson.dart';
import 'package:http/http.dart';
import 'package:loginapp/weather.dart';

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
    Response response = await get('https://api.openweathermap.org/data/2.5/forecast?q=Tehran&units=metric&appid=121bfe664777c886e1481f7feb830455');
    WeatherData weatherData  = weatherListFromJson(response.body);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'email': widget.loginData['email'],
      'password': widget.loginData['password'],
      'weather': weatherData,

    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
