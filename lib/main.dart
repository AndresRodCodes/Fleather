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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Time',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.terrain,
                    ),
                    Text(
                      '95°',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Date, | Location ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 40.0,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.lightBlueAccent,
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
            height: 50.0,
          ),
          Container(
            height: 200,
//color: Colors.yellow,
            child: Row(
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
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.only(bottom: 5.0),
              icon: Icon(
                Icons.location_on,
                size: 50,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                print('Implement on pressed function');
              },
            )
          ],
        ),
      ),
    );
  }
}
