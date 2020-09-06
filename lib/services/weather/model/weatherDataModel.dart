import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/weather/weatherdata.dart';
import 'package:weather/weather.dart';

String apiKey = "ae21034d78f4b6f1b757f4eca55a453c";

class WeatherDataModel extends ChangeNotifier {
  //To make singleton class

  String cityName;
  String weatherDescription;
  String weatherIconLabel;
  double weatherWindSpeed;
  int weatherSunriseTime;
  int weatherSunsetTime;
  num weatherTemperature;
  int weatherHumidity;
  double weatherWindDirection;
  List<WeatherData> wwlist;

  static final WeatherDataModel _weatherDataModel =
      new WeatherDataModel._internal();

  factory WeatherDataModel() {
    return _weatherDataModel;
  }
  WeatherDataModel._internal();
  WeatherData _weather;

  Future<String> getUserCityName() async {
    print('getting user position');
    String cityName = '';
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (position != null) {
      List<Placemark> results = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude)
          .catchError((e, stacktrace) {
        print(e);
        print(stacktrace);
      });

      if (results != null && results.length > 0) {
        Placemark placemark = results[0];
        cityName = placemark.subAdministrativeArea;
      }
    }
    print("////");
    print(cityName);
    print("////");
    return cityName;
  }

  //To fetch the value from API
  Future getWeatherData({@required String city}) async {
    print('getting weather data');
    String searchCity = city.toLowerCase();
    final response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$searchCity&appid=${apiKey}&units=metric");

    //Converting the response body from JSON to Map
    Map responseBody = json.decode(response.body);

    //Assigning the returned value to a WeatherData variable
    _weather = WeatherData.fromJson(responseBody);
    print(_weather.name);
    this.cityName = _weather.name;
    this.weatherDescription = _weather.description;
    this.weatherWindSpeed = _weather.windSpeed;
    this.weatherSunriseTime = _weather.sunriseTime;
    this.weatherSunsetTime = _weather.sunsetTime;
    this.weatherTemperature = _weather.temperature;
    this.weatherHumidity = _weather.humidity;
    this.weatherIconLabel = _weather.iconLabel;
    this.weatherWindDirection = _weather.windDirection;
  }

  Future getFiveDaysWeatherData({@required String city}) async {
    print('getting weather data');
    String searchCity = city.toLowerCase();
    print(searchCity);
    final response = await http.get(
        "http://api.openweathermap.org/data/2.5/forecast?q=$searchCity&appid=${apiKey}&units=metric");

    //Converting the response body from JSON to Map

    final responseBody = json.decode(response.body);
    /*print(responseBody['list'][0]['dt']);
    for (final item in responseBody['list']) {
      print(item['dt']);
    }*/
    //Assigning the returned value to a WeatherData variable
    //print(responseBody[0]['name']);
    List<WeatherData> lst = WeatherData.fromForecastJson(responseBody);
    this.wwlist = lst;
    print(lst.length);
    /*this.cityName = _weather2.name;
    this.weatherDescription = _weather2.description;
    this.weatherWindSpeed = _weather2.windSpeed;
    this.weatherSunriseTime = _weather2.sunriseTime;
    this.weatherSunsetTime = _weather2.sunsetTime;
    this.weatherTemperature = _weather2.temperature;
    this.weatherHumidity = _weather2.humidity;
    this.weatherIconLabel = _weather2.iconLabel;
    this.weatherWindDirection = _weather2.windDirection;*/
  }
}
