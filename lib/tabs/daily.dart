import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/theme.dart';
import 'package:loginapp/weather.dart';

class DailyWeatherTab extends StatelessWidget {
  AppTheme appTheme;
  List<Daily> dailyWeather;

  DailyWeatherTab({this.appTheme, this.dailyWeather});

  List<DateTime> days = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < dailyWeather.length; i++) {
      days.add(DateTime.now().add(Duration(days: i)));
    }
    return ListView.builder(
        itemCount: dailyWeather.length,
        itemBuilder: (context, index) {
          Daily day = dailyWeather[index];
          return Card(
            color: appTheme.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        getWeekDay(days[index].weekday),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: appTheme.mainColor,
                        ),
                      ),
                      Image.network(
                          'http://openweathermap.org/img/wn/${day.weather.icon}@2x.png'),
                    ],
                  ),
                  SizedBox(width: 60,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tempreture:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: appTheme.mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                          child: Text(
                            'min: ${day.temp.min} °C',
                            style: TextStyle(
                              fontSize: 12,
                              color: appTheme.mainColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                          child: Text(
                            'max: ${day.temp.max} °C',
                            style: TextStyle(
                              fontSize: 12,
                              color: appTheme.mainColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: appTheme.mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                          child: Text(
                            '${day.weather.main}',
                            style: TextStyle(
                              fontSize: 12,
                              color: appTheme.mainColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Humidity:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: appTheme.mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
                          child: Text(
                            '${day.humidity}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: appTheme.mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
