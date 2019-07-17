import 'package:flutter/material.dart';
import 'weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  String cityName = '';
  String description = '';
  String temperature = '';
  String weatherCondition = '';

  WeatherModel weatherModel = WeatherModel();

  void getWeatherData() async {
    var weatherData = await weatherModel.getWeatherData();

    setState(() {
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toStringAsFixed(1);
      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: weatherModel.getBackgroundImage(weatherCondition),
          fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                    children: <Widget>[
                  Text(
                    cityName,
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                      Text('$temperature°',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                ]),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.lightBlueAccent,
                  height: 250.0,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.wb_sunny),
                                  Text(
                                    'Los Angeles',
                                  ),
                                  Text('Sunny'),
                                  Text('100 Degrees'),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
