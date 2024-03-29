import 'dart:async';
import 'package:flutter/material.dart';
import 'time.dart';
import 'weather.dart';
import 'horizontal_listview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather, this.locationForecast});

  final locationWeather;
  final locationForecast;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  DateAndTime time = DateAndTime();
  WeatherModel weatherModel = WeatherModel();

  Timer _everySecond;
  String city;
  String weatherCondition;
  String icon;
  Image weatherIcon;
  String temperature;
  String humidity;
  String minTemp;
  String maxTemp;
  String windSpeed;
  String weatherDescription;

  String day1Icon;
  Image day1WeatherIcon;

  String day2Icon;
  Image day2WeatherIcon;

  String day3Icon;
  Image day3WeatherIcon;

  String day4Icon;
  Image day4WeatherIcon;

  String day5Icon;
  Image day5WeatherIcon;

  void updateUI(dynamic weatherData, dynamic forecastData) {
    setState(() {
      city = weatherData['name'];
      weatherCondition = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];

      var temp = weatherData['main']['temp'];
      temperature = temp.toStringAsFixed(0);
      humidity = weatherData['main']['humidity'].toString();

      var minTempNum = weatherData['main']['temp_min'];
      minTemp = minTempNum.toStringAsFixed(0);

      var maxTempNum = weatherData['main']['temp_max'];
      maxTemp = maxTempNum.toStringAsFixed(0);

      var windSpeedNum = weatherData['wind']['speed'];
      windSpeed = windSpeedNum.round().toString();

      weatherDescription = weatherData['weather'][0]['description'];
    });
    weatherIcon =
        Image.network('https://openweathermap.org/img/wn/$icon@2x.png');

    day1Icon = forecastData['list'][0]['weather'][0]['icon'];
    day1WeatherIcon =
        Image.network('https://openweathermap.org/img/wn/$day1Icon@2x.png');

    day2Icon = forecastData['list'][6]['weather'][0]['icon'];
    day2WeatherIcon =
        Image.network('https://openweathermap.org/img/wn/$day2Icon@2x.png');

    day3Icon = forecastData['list'][14]['weather'][0]['icon'];
    day3WeatherIcon =
        Image.network('https://openweathermap.org/img/wn/$day3Icon@2x.png');

    day4Icon = forecastData['list'][22]['weather'][0]['icon'];
    day4WeatherIcon =
        Image.network('https://openweathermap.org/img/wn/$day4Icon@2x.png');

    day5Icon = forecastData['list'][30]['weather'][0]['icon'];
    day5WeatherIcon =
        Image.network('https://openweathermap.org/img/wn/$day5Icon@2x.png');
  }

  @override
  void initState() {
    super.initState();

    time.setListDays(widget.locationForecast);

    time.getCurrentTimeAndDate();
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        time.getCurrentTimeAndDate();
      });
    });
    updateUI(widget.locationWeather, widget.locationForecast);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: weatherModel.getBackgroundImage(weatherCondition),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '${time.time}',
                          style: TextStyle(
                            fontFamily: 'Righteous',
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '$temperature°',
                              style: TextStyle(
                                fontSize: 80,
                                fontFamily: 'Righteous',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade300,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Text(
                          '${time.date} | $city ',
                          style: TextStyle(
                            fontFamily: 'Righteous',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text('$weatherDescription',
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  //color: Colors.white,
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ForecastData(
                        weekDay: '${time.day1}',
                        image: day1WeatherIcon,
                      ),
                      ForecastData(
                        weekDay: '${time.day2}',
                        image: day2WeatherIcon,
                      ),
                      ForecastData(
                        weekDay: '${time.day3}',
                        image: day3WeatherIcon,
                      ),
                      ForecastData(
                        weekDay: '${time.day4}',
                        image: day4WeatherIcon,
                      ),
                      ForecastData(
                        weekDay: '${time.day5}',
                        image: day5WeatherIcon,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: weatherIcon,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Humidity: $humidity%',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Righteous',
                          ),
                        ),
                        Text(
                          'Wind: $windSpeed mph',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Righteous',
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      children: <Widget>[
                        Text(
                          'Min: $minTemp°',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Righteous',
                          ),
                        ),
                        Text(
                          'Max: $maxTemp°',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        iconSize: 30.0,
                        icon: Align(
                          child: Icon(
                            FontAwesomeIcons.searchLocation,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () async {
                          var weatherData = await weatherModel.getWeatherData();
                          var fiveDayData = await weatherModel.getFiveDayData();
                          updateUI(weatherData, fiveDayData);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                'Fleather',
                style: TextStyle(
                  fontFamily: 'Paytone One',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
