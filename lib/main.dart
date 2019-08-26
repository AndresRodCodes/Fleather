import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleather',
      routes: {
        'loading_screen': (context) => LoadingScreen(),
        'location_screen': (context) => LocationScreen(),
      },
      initialRoute: 'loading_screen',
    );
  }
}
