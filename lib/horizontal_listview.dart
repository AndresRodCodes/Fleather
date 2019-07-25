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
            weekDay: 'Mon',
            weatherIcon: 'check',
          ),
          Forecastdata(
            weekDay: 'Tues',
            weatherIcon: 'menu',
          ),
          Forecastdata(
            weekDay: 'Wed',
            weatherIcon: 'menu',
          ),
          Forecastdata(
            weekDay: 'Thurs',
            weatherIcon: 'menu',
          ),
          Forecastdata(
            weekDay: 'Fri',
            weatherIcon: 'menu',
          ),
          Forecastdata(
            weekDay: 'Sat',
            weatherIcon: 'menu',
          ),
          Forecastdata(
            weekDay: 'Sun',
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
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 80,
        //color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
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
