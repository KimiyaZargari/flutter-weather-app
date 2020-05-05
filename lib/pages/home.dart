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
                        SizedBox(height:  10,),
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
                  SizedBox(width: 70,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 5, 0),
                    child: Text('${weatherData.list[index].dtTxt.hour}:${weatherData.list[index].dtTxt.minute}0',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.pinkAccent,
                      ),),
                  )
                ],
              ),
            );
          }),
    );
  }
}
