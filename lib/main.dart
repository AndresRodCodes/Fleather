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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.lightBlueAccent,
              height: 400.0,
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Los Angeles'),
                              Text('Sunny'),
                              Text('100 Degrees'),
                            ],
                          ),
                        ),
                      )),
            ),
          )),
          Row(
            children: <Widget>[
              Center(
                child: Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Get Location'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
