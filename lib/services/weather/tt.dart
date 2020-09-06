import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightGreen[600],
      title: const Text('Weather Report' ,
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      ),
      ),
    );
  }
}