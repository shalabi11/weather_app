import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/page/home_page.dart';

class WeatherState {}

class InitialState extends WeatherState {}

class ErrorsState extends WeatherState {}

class LoadedState extends WeatherState {
  final WeatherModel weatherModel;
  LoadedState(this.weatherModel);
}
