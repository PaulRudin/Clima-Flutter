import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/secrets.dart';

const String uri = 'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async {
    var url = '$uri&q=$city&units=metric';
    NetworkHelper nh = NetworkHelper(url);
    return await nh.getData();
  }
  
  Future<dynamic> getLocationWeather() async {

    Location loc = Location();
    await loc.getCurrentLocation();
    var url = '$uri&lat=${loc.latitude}&lon=${loc.longitude}&units=metric';
    NetworkHelper nh = NetworkHelper(url);
    
    return await nh.getData();
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
