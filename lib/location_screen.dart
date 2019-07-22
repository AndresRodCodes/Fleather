import 'package:flutter/material.dart';
import 'time.dart';
import 'weather.dart';
import 'loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}

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

  void updateUI(dynamic weatherData) async {
    setState(() {
      city = weatherData['name'];
      weatherCondition = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toStringAsFixed(1);
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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Fleather'),
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
                  Text(
                    '${time.time}',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: weatherIcon,
                      ),
                      Text(
                        '$temperature°',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '${time.date} | $city ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 30.0,
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
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.wb_cloudy,
                  size: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Rain: ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Feel: ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Wind: ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'UV: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'HUMI: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Cloud: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
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
