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

  void updateUI(dynamic weatherData) async {
    setState(() {
      city = weatherData['name'];
      weatherCondition = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toStringAsFixed(0);
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
                  Text(
                    '${time.time}',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: TextStyle(
                          fontSize: 90,
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
                  SizedBox(height: 20.0),
                  Text(
                    '${time.date} | $city ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
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
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: weatherIcon,
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
                        fontFamily: 'Paytone One',
                      ),
                    ),
                    Text(
                      'Feel: ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Paytone One',
                      ),
                    ),
                    Text(
                      'Wind: ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Paytone One',
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
                            fontFamily: 'Luckiest Guy',
                          ),
                        ),
                        Text(
                          'HUMI: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Luckiest Guy',
                          ),
                        ),
                        Text(
                          'Cloud: ',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Luckiest Guy',
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
