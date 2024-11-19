import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/page/home_page.dart';
// import 'package:weather_app/page/weather_info.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialCustom(),
    );
  }
}

class MaterialCustom extends StatelessWidget {
  const MaterialCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherStateName! ??
              'Sunny')),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
