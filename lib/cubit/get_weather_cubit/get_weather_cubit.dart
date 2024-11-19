import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/cubit_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  GetWeatherCubit() : super(InitialState());
  getWeatherCubit({required String cityName}) async {
    try {
      weatherModel = await WeatherServices().getWeather(cityName: cityName);
      emit(LoadedState(weatherModel!));
    } catch (e) {
      emit(ErrorsState());
    }
  }
}
