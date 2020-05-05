import 'package:flutter/material.dart';

import 'package:loginapp/weather.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Map loginData = {};
  Color background;

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
      Response response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/forecast?',
          queryParameters: {
            'q': 'Tehran',
            'units': 'metric',
            'appid': '121bfe664777c886e1481f7feb830455'
          });

      Response response2 =
          await Dio().post('https://postman-echo.com/post', data: 'num num');
      print('kimiya $response2');
      WeatherData weatherData = weatherListFromJson(response.toString());
      Navigator.pushReplacementNamed(context, '/home', arguments: {

        'email': widget.loginData['email'],
        'password': widget.loginData['password'],
        'isDark': widget.loginData['isDark'],
        'weather': weatherData,
      });
    } catch (e) {
      print(e);
    }

  }

  Widget build(BuildContext context) {
    widget.loginData = ModalRoute.of(context).settings.arguments;
    widget.background =  widget.loginData['isDark'] ? Colors.deepOrange[900] : Colors.white;
    return Scaffold(
      backgroundColor: widget.background,
      body: Center(
        child: SpinKitFadingCircle(
          color: widget.loginData['isDark'] ? Colors.orange[300] : Colors.pinkAccent,
          size: 50,
        ),
      ),
    );
  }
}
