import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/models/weather_model.dart';

import '../services/weather_services.dart';

import 'get_weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);
      emit(
        WeatherLoadedState(),
      );
    } catch (e) {
      emit(
        WeatherFailureState(
          e.toString(),
        ),
      );
    }
  }
}
