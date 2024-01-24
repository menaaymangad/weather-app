import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  final String baseUrl = 'https://api.openweathermap.org';

  final String apiKey = 'e40099f11e03965cba9aefcd2e5bc6cd';
  /* we return future method because we wait to recieve data from the server.
     but we make a method type is weather model to use it for show data in UI Screen*/
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      // we get json data from the server and convert it to a weather model
      Response response =
          await dio.get('$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey');
      /* we pass the response to method in weather model to extract the weather data from json
     and pass it to model fields. */

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
      // make a dio exception for showing response error.
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'there was an error, please try later';
      log(e.toString());
      throw Exception(errorMessage);
    } 
    // make a general catch for all errors such as the url error and ....
    catch (e) {
      log(e.toString());
      throw Exception('there was an error, please try later');
    }
  }
}
