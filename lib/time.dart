import 'package:intl/intl.dart';

class DateAndTime {
  String time;
  String date;

  String day1;
  String day2;
  String day3;
  String day4;
  String day5;

  void getCurrentTimeAndDate() {
    time = DateFormat("h:mm a").format(DateTime.now());
    date = DateFormat("EEE, MMM d").format(DateTime.now());
  }

  void setListDays(dynamic forecastData) {
    DateTime firstDay = DateTime.parse(forecastData['list'][0]['dt_txt']);
    day1 = DateFormat("EEE").format(firstDay).toString();

    DateTime secondDay = DateTime.parse(forecastData['list'][6]['dt_txt']);
    day2 = DateFormat("EEE").format(secondDay).toString();

    DateTime thirdDay = DateTime.parse(forecastData['list'][14]['dt_txt']);
    day3 = DateFormat("EEE").format(thirdDay).toString();

    DateTime fouthDay = DateTime.parse(forecastData['list'][22]['dt_txt']);
    day4 = DateFormat("EEE").format(fouthDay).toString();

    DateTime fifthDay = DateTime.parse(forecastData['list'][30]['dt_txt']);
    day5 = DateFormat("EEE").format(fifthDay).toString();
  }
}
