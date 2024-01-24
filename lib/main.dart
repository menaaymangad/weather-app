import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';

import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
                appBarTheme: AppBarTheme(
                  elevation: 8,
                  color: getColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'clear':
    case 'clear sky':
      return Colors.lightBlue;
    case 'cloudy':
    case 'scattered clouds':
    case 'overcast clouds':
      return Colors.grey;
    case 'rainy':
    case 'light rain':
      return Colors.blue;
    case 'snow':
      return Colors.teal;
    default:
      return Colors.purple;
  }
}
