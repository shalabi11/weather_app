import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  Dio dio = Dio();
  String urlW = 'https://api.weatherapi.com/v1';
  String apiKey = 'key=0b74a32493964e3284995739242608';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=0b74a32493964e3284995739242608&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromjosn(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errMessage =
          e.response?.data['error']['message'] ?? 'oops , try again';
      log(errMessage.toString());
      throw Exception(errMessage);
      // TODO
    } catch (e) {
      log(e.toString());
      throw Exception('oops , try again ');
    }
  }
}
