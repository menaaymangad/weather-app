import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                // make a request in this text field because i get the city name here.
                onSubmitted: (value) async {
                  var getWeather = BlocProvider.of<GetWeatherCubit>(context);
                  getWeather.getCurrentWeather(cityName: value);
                  Navigator.pop(context);
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Type a City',
                  label: const Text('City'),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
