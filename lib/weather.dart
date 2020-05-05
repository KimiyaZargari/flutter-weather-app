// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);
import 'dart:convert';

import 'package:flutter/cupertino.dart';

WeatherData weatherListFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

class WeatherData {
  List<ListElement> list;

  WeatherData({
    this.list,
  });


  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );
}

class ListElement {
  MainClass main;
  List<Weather> weather;
  DateTime dtTxt;

  ListElement({
    this.main,
    this.weather,
    this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        main: MainClass.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );
}

class MainClass {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int humidity;

  MainClass({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        humidity: json["humidity"],
      );
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

