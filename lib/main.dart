import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          Row(
            children: <Widget>[
              Column(children: <Widget>[
                Center(
                  child: Text(
                    'City Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Cloudy with a chance of rain',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                    itemCount: 3,
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
    );
  }
}
