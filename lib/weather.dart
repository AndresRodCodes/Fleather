import 'networking.dart';
import 'location.dart';
import 'package:flutter/material.dart';

const apiKey = 'beb51bdbd795166fe74622b9bce3603d';
const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
const fiveDayWeatherUrl = 'https://api.openweathermap.org/data/2.5/forecast';

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

  Future<dynamic> getFiveDayData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        '$fiveDayWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var fiveDayData = await networkHelper.getData();
    return fiveDayData;
  }

  AssetImage getBackgroundImage(String weatherCondition) {
    if (weatherCondition == 'Clear') {
      return AssetImage('images/clear.jpg');
    } else if (weatherCondition == 'Rain') {
      return AssetImage('images/rain2.jpg');
    } else if (weatherCondition == 'Clouds') {
      return AssetImage('images/Su.jpg');
    } else {
      return AssetImage('images/Su.jpg');
    }
  }
}
