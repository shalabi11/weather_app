import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/cubit_state.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/page/search_page.dart';
import 'package:weather_app/page/weather_info.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            // IconButtonTheme(
            //     data: IconButtonThemeData(style: ButtonStyle()),
            //     child: IconButton(onPressed: () {}, icon: Icon(Icons.sunny))),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialState) {
              return NoWeather();
            } else if (state is LoadedState) {
              return WeatherInfo();
            } else {
              return Center(child: Text('Oooops than Error'));
            }
          },
        ));
  }
}

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
            Text('No weather in now , please click the icon search in top '));
  }
}

// WeatherModel? weatherModels;
