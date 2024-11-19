// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/page/home_page.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              cityName = value;
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeatherCubit(cityName: value);
              Navigator.pop(context);
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      //  BlocProvider.of<GetWeatherCubit>(context).getWeatherCubit(cityName: cityName)
                      //   Navigator.pop(context);
                    },
                    icon: const Icon(Icons.send)),
                hintText: 'Search ',
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30)),
          ),
        ),
      ),
    );
  }
}
