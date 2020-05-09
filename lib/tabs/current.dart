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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
             Center(
              child: Image.network('http://openweathermap.org/img/wn/${currentWeather.weather.icon}@2x.png', scale: 0.7,),
            ),
          Center(
            child: Text('${currentWeather.temp}°C',
            style: TextStyle(fontSize: 60, color: appTheme.mainColor),),
          ),
          SizedBox(height: 10),
          Text(currentWeather.weather.main, style: TextStyle(fontSize: 30,
          color: appTheme.mainColor),),

          Text(currentWeather.weather.description, style: TextStyle(fontSize: 18,
              color: appTheme.mainColor),),
          SizedBox(height: 20),

          Text('feels like: ${currentWeather.feelsLike}°C',  style: TextStyle(fontSize: 18,
              color: appTheme.mainColor),),
          Text('humidity: ${currentWeather.humidity}%', style: TextStyle(fontSize: 18,
              color: appTheme.mainColor), ),
          Text('wind speed: ${currentWeather.windSpeed} m/s', style: TextStyle(fontSize: 18,
              color: appTheme.mainColor), ),

        ],
      ),
    );
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