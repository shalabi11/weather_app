// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel {
  DateTime? date;
  String name;
  double? temp;
  double? maxTemp;
  double? mintemp;
  String? weatherStateName;
  WeatherModel(
      {required this.date,
      required this.name,
      required this.temp,
      required this.maxTemp,
      required this.mintemp,
      required this.weatherStateName});
  factory WeatherModel.fromjosn(json) {
    // var jsonData  data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      name: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStateName: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}

MaterialColor? getThemeColor(String condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition == 'Sunny' ||
      condition == 'Clear' ||
      condition == 'partly cloudy') {
    return Colors.orange;
  } else if (condition == 'Blizzard' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Blowing snow') {
    return Colors.blue;
  } else if (condition == 'Freezing fog' ||
      condition == 'Fog' ||
      condition == 'Heavy Cloud' ||
      condition == 'Mist' ||
      condition == 'Fog') {
    return Colors.blueGrey;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Heavy Rain' ||
      condition == 'Showers	') {
    return Colors.blue;
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Moderate or heavy snow with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
