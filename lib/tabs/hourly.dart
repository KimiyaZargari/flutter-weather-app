import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/theme.dart';
import 'package:loginapp/weather.dart';

class HourlyWeatherTab extends StatelessWidget{
  AppTheme appTheme;
  List<Current> hourlyWeather;
  HourlyWeatherTab({this.appTheme, this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: hourlyWeather.length,
        itemBuilder: (context, index) {
          Current current = hourlyWeather[index];
          List<DateTime> dateTimes = [];
          for(int i = 0; i < hourlyWeather.length; i ++){
            dateTimes.add(DateTime.now().add(Duration(hours: i)));
          }
       

          return Card(
            color: appTheme.cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    'http://openweathermap.org/img/wn/${current.weather.icon}@2x.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${current.temp} °C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: appTheme.mainColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${current.weather.main}',
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${dateTimes[index].hour}:00',
                        style: TextStyle(
                          fontSize: 18,
                          color: appTheme.mainColor,
                        ),
                      ),
                      SizedBox(height: 10),

                      Text(getWeekDay(dateTimes[index].weekday),
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.mainColor,
                        ),),
                    ],
                  ),
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