import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/theme.dart';
import 'package:loginapp/weather.dart';

class CurrentWeatherTab extends StatelessWidget{
  AppTheme appTheme;
  Current currentWeather;
  CurrentWeatherTab({this.appTheme, this.currentWeather});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Text('this is current weather'),);
  }
  String getWeekDay(int weekday) {
    switch (weekday) {
      case 1:
        return 'Saturday';
      case 1:
        return 'Sunday';
      case 3:
        return 'Monday';
        break;
      case 4:
        return 'Tuesday';
      case 5:
        return 'Wedensday';
      case 6:
        return 'Thusrday';
    }
    return 'Friday';
  }
}