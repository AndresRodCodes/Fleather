import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ForecastData(
            weekDay: 'Monday',
            weatherIcon: 'check',
          ),
          ForecastData(
            weekDay: 'Tuesday',
            weatherIcon: 'menu',
          ),
        ],
      ),
    );
  }
}

class ForecastData extends StatelessWidget {
  final String weekDay;
  final String weatherIcon;

  ForecastData({this.weekDay, this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 80,
        //color: Colors.transparent,
        child: ListView(
          children: <Widget>[
            Text(weekDay),
            Icon(Icons.wb_sunny),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
