
class WeatherModel {
  final String cityName;

  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});
      // we get data from json that we passed in the getweather function.
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['name'],
       
        image: '',
        temp: (json['main']['temp'] - 273.15),
        maxTemp: (json['main']['temp_max'] - 273.15),
        minTemp: (json['main']['temp_min'] - 273.15),
        condition: json['weather'][0]['description']);
  }

 
}
