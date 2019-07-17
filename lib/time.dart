import 'package:intl/intl.dart';

class DateAndTime {

  String time;
  String date;

  void getCurrentTimeAndDate() {
    time = DateFormat("h:mm a").format(DateTime.now());
    date = DateFormat("EEE, MMM d").format(DateTime.now());
  }

}