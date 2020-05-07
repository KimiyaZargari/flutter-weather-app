import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/theme.dart';
import 'package:loginapp/weather.dart';

class DailyWeatherTab extends StatelessWidget{
  AppTheme appTheme;
  List<Daily> dailyWeather;
  DailyWeatherTab({this.appTheme, this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: dailyWeather.length,
        itemBuilder: (context, index) {
          Daily day = dailyWeather[index];
          return Card(
            color: appTheme.cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    'http://openweathermap.org/img/wn/${day.weather.icon}@2x.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'min temp :${day.temp.min} °C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: appTheme.mainColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'max temp :${day.temp.max} °C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: appTheme.mainColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${day.weather.main}',
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.mainColor,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 5, 0),
                  child: Text('hi',
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.mainColor,
                        ),),
                )
              ],
            ),
          );
        });
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