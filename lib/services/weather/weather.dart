import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'package:kisanVikasApp/services/weather/homepageview.dart';
import 'package:kisanVikasApp/services/weather/model/weatherDataModel.dart';


class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherDataModel _weatherDataModel;
  WeatherDataModel _forecastWeatherModel;
  Future<Position> userPosition;
  @override
  void initState() {
    _weatherDataModel = WeatherDataModel();
    _forecastWeatherModel = WeatherDataModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherDataModel>(
          create: (BuildContext context) {
            return _weatherDataModel;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Weather',
        home: HomePageView(
            weatherDataModel: _weatherDataModel,
            forecastWeatherModel: _forecastWeatherModel),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    );
  }
}
