import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/weather.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class Home extends StatelessWidget {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    WeatherData weatherData = data['weather'];
    bool isDark = data['isDark'];
    print('log home $isDark');

    return ChangeNotifierProvider<AppTheme>(
      create: (context) => AppTheme(isDark),
      child: Consumer<AppTheme>(
        builder: (_, appTheme, __) => Scaffold(
          backgroundColor: appTheme.backgroundColor,
          appBar: AppBar(
            title: Text("Your Account", style: TextStyle(color: appTheme.appBarTitle),),
            actions: <Widget>[
              PopupMenuButton<MenuItem>(
                onSelected: (MenuItem menuItem) {
                  switch (menuItem.item) {
                    case Item.ADD_LOCATION:
                      {}
                      break;
                    case Item.DAK_THEME:
                      {
                        print("setting dark theme from $isDark");
                        isDark = !isDark;
                        print("to $isDark");
                        isDark
                            ? appTheme.setDarkTheme()
                            : appTheme.setLightTheme();
                      }
                      break;
                    case Item.LOG_OUT:
                      {
                        Navigator.pushReplacementNamed(context, '/',
                            arguments: {'isDark': isDark});
                      }
                  }
                },
                color: appTheme.cardColor,
                itemBuilder: (BuildContext context) {
                  return items.map((MenuItem item) {
                    return PopupMenuItem<MenuItem>(
                      value: item,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              item.title,
                              style: TextStyle(
                                  color: appTheme.mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              item.icon,
                              color: appTheme.mainColor,
                            )
                          ]),
                    );
                  }).toList();
                },
              )
            ],
            backgroundColor: appTheme.appBarColor,
          ),
          body: ListView.builder(
              itemCount: weatherData.list.length,
              itemBuilder: (context, index) {
                return Card(
                  color: appTheme.cardColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                          'http://openweathermap.org/img/wn/${weatherData.list[index].weather[0].icon}@2x.png'),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${weatherData.list[index].main.temp} °C',
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
                              '${weatherData.list[index].weather[0].description}',
                              style: TextStyle(
                                fontSize: 12,
                                color: appTheme.mainColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 5, 0),
                        child: Text(
                          '${weatherData.list[index].dtTxt.hour}:${weatherData.list[index].dtTxt.minute}0',
                          style: TextStyle(
                            fontSize: 15,
                            color: appTheme.mainColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

enum Item { LOG_OUT, DAK_THEME, ADD_LOCATION }

class MenuItem {
  String title;
  IconData icon;
  Item item;

  MenuItem({this.title, this.icon, this.item});
}

List<MenuItem> items = <MenuItem>[
  MenuItem(
      title: 'Add Location', icon: Icons.location_on, item: Item.ADD_LOCATION),
  MenuItem(title: 'Dark Theme', icon: Icons.brightness_3, item: Item.DAK_THEME),
  MenuItem(title: 'Logout', icon: Icons.exit_to_app, item: Item.LOG_OUT)
];
