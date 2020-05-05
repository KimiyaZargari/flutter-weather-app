import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/weather.dart';

class Home extends StatelessWidget {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    WeatherData weatherData = data['weather'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account"),
        actions: <Widget>[
          PopupMenuButton<MenuItem>(
            color: Colors.pink[100],
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
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          item.icon,
                          color: Colors.pinkAccent,
                        )
                      ]),
                );
              }).toList();
            },
          )
        ],
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
          itemCount: weatherData.list.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.pink[100],
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
                            color: Colors.pinkAccent,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${weatherData.list[index].weather[0].description}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.pinkAccent,
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
                        color: Colors.pinkAccent,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem({this.title, this.icon});
}

List<MenuItem> items = <MenuItem>[
  MenuItem(title: 'Add Location', icon: Icons.location_on),
  MenuItem(title: 'Dark Theme', icon: Icons.brightness_3),
  MenuItem(title: 'Logout', icon: Icons.exit_to_app)
];
