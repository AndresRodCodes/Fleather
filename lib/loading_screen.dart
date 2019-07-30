import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'weather.dart';
import 'location_screen.dart';
import 'package:location_permissions/location_permissions.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  PermissionStatus permissionStatus;

  @override
  void initState() {
    super.initState();

    checkPermissions();
  }

  void checkPermissions() async {
    permissionStatus = await LocationPermissions().checkPermissionStatus();

    if (permissionStatus == PermissionStatus.granted) {
      getLocationData();
    }
    else {
      permissionStatus = await LocationPermissions().requestPermissions();

      if (permissionStatus == PermissionStatus.granted) {
        getLocationData();
      }
      else {
        exit(0);
      }
    }
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
