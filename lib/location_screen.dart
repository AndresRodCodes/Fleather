import 'package:flutter/material.dart';
import 'time.dart';
import 'weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  DateAndTime time = DateAndTime();
  WeatherModel weatherModel = WeatherModel();
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

  void updateUI(dynamic weatherData) {
    setState(() {
      city = weatherData['name'];
      weatherCondition = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];

      double temp = weatherData['main']['temp'];
      temperature = temp.toStringAsFixed(0);
      humidity = weatherData['main']['humidity'].toString();

      var minTempNum = weatherData['main']['temp_min'];
      minTemp = minTempNum.toStringAsFixed(0);

      double maxTempNum = weatherData['main']['temp_max'];
      maxTemp = maxTempNum.toStringAsFixed(0);

      double windSpeedNum = weatherData['wind']['speed'];
      windSpeed = windSpeedNum.round().toString();

      weatherDescription = weatherData['weather'][0]['description'];
    });
    weatherIcon =
        Image.network('https://openweathermap.org/img/wn/$icon@2x.png');
  }

  @override
  void initState() {
    super.initState();
    time.getCurrentTimeAndDate();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Fleather',
          style: TextStyle(
            fontFamily: 'Paytone One',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: weatherModel.getBackgroundImage(weatherCondition),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
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
                        fontSize: 50,
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
                            fontSize: 90,
                            fontFamily: 'Righteous',
                            fontWeight: FontWeight.bold,
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
                    SizedBox(height: 20.0),
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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 150.0,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'degrees',
                                  ),
                                  Icon(Icons.wb_sunny),
                                  Text('Time'),
                                ],
                              ),
                            ),
                          )),
                ),
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
                      'Humidity: $humidity',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Paytone One',
                      ),
                    ),
                    Text(
                      'Wind: $windSpeed mph',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Paytone One',
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
                        fontFamily: 'Paytone One',
                      ),
                    ),
                    Text(
                      'Max: $maxTemp°',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Paytone One',
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
