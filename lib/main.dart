import 'package:flutter/material.dart';
import 'time.dart';
import 'weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleather',
      home: MyHomePage(title: 'Fleather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateAndTime time = DateAndTime();
  WeatherModel weatherModel = WeatherModel();
  String city;
  String weatherCondition;
  String icon;
  Image weatherIcon;
  String temperature;

  void getWeatherData() async {
    var weatherData = await weatherModel.getWeatherData();

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
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Paytone One',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                print('Menu Opened');
              },
            ),
          )
        ],
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
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      '${time.time}',
                      style: TextStyle(
                        fontFamily: 'Righteous',
                        fontSize: 35,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
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
                          color: Colors.blue,
                          fontSize: 50,
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
              height: 45.0,
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
//      bottomNavigationBar: BottomAppBar(
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            IconButton(
//              padding: EdgeInsets.only(bottom: 5.0),
//              icon: Icon(
//                Icons.location_on,
//                size: 50,
//                color: Colors.blueGrey,
//              ),
//              onPressed: () {
//                print('Implement on pressed function');
//              },
//            )
//          ],
//        ),
//      ),
    );
  }
}
