import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/weather/weatherdata.dart';


String apiKey = "ae21034d78f4b6f1b757f4eca55a453c";

class WeatherData {
  final String name;
  final String description;
  final double windSpeed;
  final int sunriseTime;
  final int sunsetTime;
  final num temperature;
  final int humidity;
  final String iconLabel;
  final double windDirection;
  int time;
  List<WeatherData> wList;

  WeatherData(
      {this.name,
      this.description,
      this.windSpeed,
      this.sunriseTime,
      this.sunsetTime,
      this.temperature,
      this.humidity,
      this.iconLabel,
      this.windDirection,
      this.time});

  static WeatherData fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'] ?? '',
      description: json['weather'][0]['description'] ?? '',
      windSpeed: json['wind']['speed'] * 3.6 ?? 0.0,
      temperature: json['main']['temp'] ?? 0,
      sunriseTime: json['sys']['sunrise'] ?? 0,
      sunsetTime: json['sys']['sunset'] ?? 0,
      humidity: json['main']['humidity'] ?? 0,
      iconLabel: json['weather'][0]['icon'] ?? '',
      windDirection: json['wind']['deg'].toDouble() ?? 0.0,
    );
  }

  static List<WeatherData> fromForecastJson(final json) {
    final weathers = List<WeatherData>();
    for (final item in json['list']) {
      weathers.add(WeatherData(
        name: item['name'] ?? '',
        description: item['weather'][0]['description'] ?? '',
        windSpeed: item['wind']['speed'] * 3.6 ?? 0.0,
        temperature: item['main']['temp'] ?? 0,
        sunriseTime: item['sys']['sunrise'] ?? 0,
        sunsetTime: item['sys']['sunset'] ?? 0,
        humidity: item['main']['humidity'] ?? 0,
        iconLabel: item['weather'][0]['icon'] ?? '',
        windDirection: item['wind']['deg'].toDouble() ?? 0.0,
      ));
    }
    return weathers;
  }
}
