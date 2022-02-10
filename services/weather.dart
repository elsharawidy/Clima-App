import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '2d37b7e9f032d10f4029e1298a814db6';
const OpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    String url = '$OpenWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper nett = NetworkHelper(url);
    var cityWeatherData = await nett.getData();
    return cityWeatherData;
  }

  Future<dynamic> getLocationWeather()async{
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper net = NetworkHelper(
        '$OpenWeatherMapUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await net.getData();
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
