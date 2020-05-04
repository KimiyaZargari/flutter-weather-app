// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);
import 'dart:convert';

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
  MainEnum main;
  Description description;
  String icon;

  Weather({
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: mainEnumValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        icon: json["icon"],
      );
}

enum Description {
  CLEAR_SKY,
  FEW_CLOUDS,
  BROKEN_CLOUDS,
  OVERCAST_CLOUDS,
  SCATTERED_CLOUDS,
  LIGHT_RAIN
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
