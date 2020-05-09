// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

class WeatherData {
  double lat;
  double lon;
  String timezone;
  Current current;
  List<Current> hourly;
  List<Daily> daily;

  WeatherData({
    this.lat,
    this.lon,
    this.timezone,
    this.current,
    this.hourly,
    this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );
}

class Current {
  int sunrise;
  int sunset;
  int temp;
  int feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  double windSpeed;
  int windDeg;
  Weather weather;
  Rain rain;

  Current({
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.rain,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    print('here');
    return Current(
      sunrise: json["sunrise"] == null ? null : json["sunrise"],
      sunset: json["sunset"] == null ? null : json["sunset"],
      temp: json["temp"].toInt(),
      feelsLike: json["feels_like"].toInt(),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"].toDouble(),
      uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      clouds: json["clouds"],
      windSpeed: json["wind_speed"].toDouble(),
      windDeg: json["wind_deg"],
      weather: List<Weather>.from(
          json["weather"].map((x) => Weather.fromJson(x)))[0],
      rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );
  }
}

class Rain {
  double the1H;

  Rain({
    this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble(),
      );
}

class Weather {
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

class Daily {
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  Weather weather;
  int clouds;
  double uvi;
  double rain;

  Daily({
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.clouds,
    this.uvi,
    this.rain,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      temp: Temp.fromJson(json["temp"]),
      feelsLike: FeelsLike.fromJson(json["feels_like"]),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"].toDouble(),
      windSpeed: json["wind_speed"].toDouble(),
      windDeg: json["wind_deg"],
      weather: List<Weather>.from(
          json["weather"].map((x) => Weather.fromJson(x)))[0],
      clouds: json["clouds"],
      uvi: json["uvi"].toDouble(),
      rain: json["rain"] == null ? null : json["rain"].toDouble(),
    );
  }
}

class FeelsLike {
  int day;
  int night;
  int morn;

  FeelsLike({
    this.day,
    this.night,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toInt(),
        night: json["night"].toInt(),
        morn: json["morn"].toInt(),
      );
}

class Temp {
  int day;
  int min;
  int max;
  int night;
  int morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        min: json["min"].toInt(),
        max: json["max"].toInt(),
        day: json["day"].toInt(),
        night: json["night"].toInt(),
        morn: json["morn"].toInt(),
      );


}
