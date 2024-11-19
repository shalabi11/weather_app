import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/page/home_page.dart';
import 'package:weather_app/page/search_page.dart';

class WeatherInfo extends StatelessWidget {
  WeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(
          //   flex: 4,
          // ),
          Text(
            weatherModel.name,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
              'update at ${weatherModel.date!.hour} : ${weatherModel.date!.minute}'),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: AssetImage('assets/images/clear.png')),
              Text(
                " ${weatherModel.temp!}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('Max temp : ${weatherModel.maxTemp}'),
                  Text('Min temp : ${weatherModel.mintemp}')
                ],
              )
            ],
          ),
          // Spacer(
          //   flex: 2,
          // ),
          Text(
            weatherModel.weatherStateName!,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
