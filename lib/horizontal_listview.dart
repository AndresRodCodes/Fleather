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
          Forecastdata(
            weekDay: 'Monday',
            weatherIcon: 'check',
          ),
          Forecastdata(
            weekDay: 'Tuesday',
            weatherIcon: 'menu',
          ),
        ],
      ),
    );
  }
}

class Forecastdata extends StatelessWidget {
  String weekDay;
  String weatherIcon;

  Forecastdata({this.weekDay, this.weatherIcon});

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
