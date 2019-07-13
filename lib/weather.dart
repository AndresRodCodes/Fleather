import 'networking.dart';
import 'location.dart';

const apiKey = 'beb51bdbd795166fe74622b9bce3603d';
const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
