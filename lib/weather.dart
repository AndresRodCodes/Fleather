import 'networking.dart';
import 'location.dart';
import 'package:flutter/material.dart';

const apiKey = 'beb51bdbd795166fe74622b9bce3603d';
const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  AssetImage getBackgroundImage(String weatherCondition) {
    if (weatherCondition == 'Clear') {
      return AssetImage('images/clouds.jpg');
    } else if (weatherCondition == 'Rain') {
      return AssetImage('images/clouds.jpg');
    } else if (weatherCondition == 'Clouds') {
      return AssetImage('images/clouds.jpg');
    } else {
      return AssetImage('images/clouds.jpg');
    }
  }
}
