import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  WeatherInfoBody({Key? key}) : super(key: key);
  late final String time = getCurrentTime();
  // final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColor(weatherModel.condition),
          getColor(weatherModel.condition)[500]!,
          getColor(weatherModel.condition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'updated at ',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  getImage(weatherModel.condition),
                ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh:mm a').format(now);
    return formattedTime;
  }

  String getImage(String condition) {
    switch (condition) {
      case 'clear':
      case 'clear sky':
        return 'assets/images/clear.png';
      case 'cloudy':
      case 'scattered clouds':
      case 'overcast clouds':
        return 'assets/images/cloudy.png';
      case 'rainy':
        return 'assets/images/rainy.png';
      case 'snow':
        return 'assets/images/snow.png';
      default:
        return 'assets/images/clear.png';
    }
  }
}
