import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/weather.dart';


class Home extends StatelessWidget {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    WeatherData weatherData =  data['weather'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
          itemCount: weatherData.list.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){},
                title: Text('${weatherData.list[index].main.feelsLike}'),
              ),
            );
          }),
    );
  }
}
