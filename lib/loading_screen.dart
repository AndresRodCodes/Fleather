import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherData();
    var fiveDayData = await weatherModel.getFiveDayData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
            locationForecast: fiveDayData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitWanderingCubes(
      color: Colors.white,
      size: 60.0,
    );
  }
}
