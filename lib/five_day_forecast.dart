
class FiveDayForecast {

  String day1Min;
  String day1Max;
  String day1Icon;

  String day2Min;
  String day2Max;
  String day2Icon;

  String day3Min;
  String day3Max;
  String day3Icon;

  String day4Min;
  String day4Max;
  String day4Icon;

  String day5Min;
  String day5Max;
  String day5Icon;


  void setFiveDayData(dynamic fiveDayData) {

    day1Min = fiveDayData['list'][0]['main']['temp_min'].toString();

  }
}