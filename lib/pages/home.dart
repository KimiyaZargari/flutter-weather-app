import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/pages/fiveDayWeatherTab.dart';
import 'package:loginapp/theme.dart';
import 'package:loginapp/weather.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    List<WeatherData> weatherData = [data['weather']];
    bool isDark = data['isDark'];
    print('log home $isDark');
    List<Tab> tabs = weatherData.map((weather){
      return Tab(text : 'hi');
    }).toList();


    return ChangeNotifierProvider<AppTheme>(
      create: (context) => AppTheme(isDark),
      child: Consumer<AppTheme>(
        builder: (_, appTheme, __) => DefaultTabController(
          length: 1,
          child: Scaffold(
            backgroundColor: appTheme.backgroundColor,
            appBar: AppBar(
              bottom: TabBar(tabs: tabs,),
              title: Text("Your Account", style: TextStyle(color: appTheme.appBarTitle),),

              actions: <Widget>[
                PopupMenuButton<MenuItem>(
                  onSelected: (MenuItem menuItem) {
                    switch (menuItem.item) {
                      case Item.ADD_LOCATION:
                        {

                        }
                        break;
                      case Item.DAK_THEME:
                        {
                          isDark = !isDark;
                          if(isDark) {
                            menuItem.icon = Icons.brightness_5;
                            menuItem.title = "Light Theme";
                            appTheme.setDarkTheme();
                          }else {
                            menuItem.icon = Icons.brightness_3;
                            menuItem.title = "Dark Theme";
                            appTheme.setLightTheme();
                          }
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
                    return popUpMenuItems.map((MenuItem item) {
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
            body: TabBarView(
              children: weatherData.map((weather){
                return HourlyWeather(appTheme: appTheme, weatherData: weather,);
              }).toList(),
            )
          ),
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

List<MenuItem> popUpMenuItems = <MenuItem>[
  MenuItem(title: 'Change Location', icon: Icons.location_on, item: Item.ADD_LOCATION),
  MenuItem(title: 'Dark Theme', icon: Icons.brightness_3, item: Item.DAK_THEME),
  MenuItem(title: 'Logout', icon: Icons.exit_to_app, item: Item.LOG_OUT)
];
