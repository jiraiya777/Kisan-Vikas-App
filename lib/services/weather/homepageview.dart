import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:weather_icons/weather_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kisanVikasApp/services/weather/widgets/loader.dart';
import 'package:kisanVikasApp/services/weather/widgets/dateTime.dart';
import 'package:kisanVikasApp/services/weather/weatherdata.dart';
import 'package:kisanVikasApp/services/weather/model/weatherDataModel.dart';

class HomePageView extends StatefulWidget {
  final WeatherDataModel weatherDataModel;
  final WeatherDataModel forecastWeatherModel;

  // final Position position;

  const HomePageView(
      {Key key, this.weatherDataModel, this.forecastWeatherModel})
      : super(key: key);
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  WeatherDataModel weatherDataModel;
  WeatherDataModel forecastWeatherModel;
  WeatherData wdata;
  bool isLoading = true;
  TextEditingController searchResult = TextEditingController();
  String search = '';
  bool justOpened = true;

  @override
  void initState() {
    weatherDataModel = this.widget.weatherDataModel;
    forecastWeatherModel = this.widget.forecastWeatherModel;
    super.initState();
    _getWeather();
  }

  void _getWeather() async {
    setState(() {
      isLoading = true;
    });

    if (justOpened) {
      print('just opened');
      String cityName = await weatherDataModel.getUserCityName();
      await weatherDataModel.getWeatherData(city: cityName);
      await weatherDataModel.getFiveDaysWeatherData(city: cityName);
      //print(weatherDataModel.weatherHumidity);
      //await forecastWeatherModel.getFiveDaysWeatherData(city: cityName);
      //print(weatherDataModel.weatherHumidity);
      setState(() {
        justOpened = false;
        search = cityName;
      });
    } else {
      await weatherDataModel.getWeatherData(city: searchResult.text);
      await weatherDataModel.getFiveDaysWeatherData(city: searchResult.text);
      setState(() {
        search = searchResult.text;
        //Added after proper run
        searchResult.text = '';
      });
    }

    setState(() {
      isLoading = false;
      searchResult.text = '';
    });
  }

  void _handleRefresh() async {
    setState(() {
      isLoading = true;
    });
    String cityName = await weatherDataModel.getUserCityName();
    await weatherDataModel.getWeatherData(city: cityName);
    await weatherDataModel.getFiveDaysWeatherData(city: cityName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "WEATHER",
          style: TextStyle(color: Colors.black, letterSpacing: 5, fontSize: 35),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: _handleRefresh,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: openSearchBox,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DateTimeBar(),

            //Asynchronous Code Begins.
            isLoading
                ? Loader()
                : Column(
                    children: <Widget>[
                      //City Heading
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          weatherDataModel.cityName,
                          style: TextStyle(fontSize: 35, color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            // child: Container(
                            // color: Colors.yellow,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // margin: EdgeInsets.all(2),
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  padding: EdgeInsets.all(8),

                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'http://openweathermap.org/img/wn/${weatherDataModel.weatherIconLabel}@2x.png'))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    WindIcon(
                                      degree:
                                          weatherDataModel.weatherWindDirection,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    AutoSizeText(
                                      weatherDataModel.weatherWindSpeed
                                              .toStringAsFixed(0) +
                                          " kmph",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                            // ),
                          ),

                          //Right side column
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(4),
                              height: MediaQuery.of(context).size.height * 0.20,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      BoxedIcon(
                                        WeatherIcons.day_sunny_overcast,
                                        color: Colors.black45,
                                      ),
                                      AutoSizeText(
                                        toBeginningOfSentenceCase(
                                            weatherDataModel
                                                .weatherDescription),
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 1,
                                        minFontSize: 18,
                                        maxFontSize: 25,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      BoxedIcon(
                                        WeatherIcons.thermometer,
                                        color: Colors.black45,
                                      ),
                                      AutoSizeText(
                                        "Temperature: " +
                                            weatherDataModel.weatherTemperature
                                                .toString() +
                                            "° C",
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 1,
                                        maxFontSize: 25,
                                        minFontSize: 18,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      BoxedIcon(
                                        WeatherIcons.humidity,
                                        color: Colors.black45,
                                      ),
                                      Text(
                                        "Humidity: " +
                                            weatherDataModel.weatherHumidity
                                                .toString() +
                                            "% hPa",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          //Sunrise Time
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.sunrise,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    //weatherDataModel.weatherSunriseTime.toString(),
                                    DateFormat("hh:mm a").format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            weatherDataModel
                                                    .weatherSunriseTime *
                                                1000)),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //Divider between the times
                          Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.all(2),
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: 3,
                          ),

                          //Sunset time
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.sunset,
                                    color: Colors.deepOrange,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    //weatherDataModel.weatherSunsetTime.toString(),
                                    DateFormat("hh:mm a").format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            weatherDataModel.weatherSunsetTime *
                                                1000)),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.black,
                        margin: EdgeInsets.all(50),
                        height: 3,
                        width: MediaQuery.of(context).size.width * 0.80,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            forecastElement(weatherDataModel.wwlist[7], 1),
                            forecastElement(weatherDataModel.wwlist[15], 2),
                            forecastElement(weatherDataModel.wwlist[23], 3),
                            forecastElement(weatherDataModel.wwlist[31], 4),
                            forecastElement(weatherDataModel.wwlist[39], 5),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  //Opens the search dialog box
  openSearchBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "City Search",
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10, bottom: 10),
                    child: TextField(
                      controller: searchResult,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter City name eg: chennai",
                        hintStyle: TextStyle(fontSize: 22),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await weatherDataModel.getWeatherData(
                          city: searchResult.text);
                      await weatherDataModel.getFiveDaysWeatherData(
                          city: searchResult.text);
                      setState(() {
                        isLoading = false;
                        search = searchResult.text;
                        searchResult.text = '';
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

DateTime today = DateTime.now();
List<String> months = [
  'JANUARY',
  'FEBRUARY',
  'MARCH',
  'APRIL',
  'MAY',
  'JUNE',
  'JULY',
  'AUGUST',
  'SEPTEMBER',
  'OCTOBER',
  'NOVEMBER',
  'DECEMBER'
];
List<String> day = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

Widget forecastElement(weatherDataModel, i) {
  var current = new DateTime(today.year, today.month, today.day + i);
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.all(2),
              height: 100,
              width: 100,
              padding: EdgeInsets.all(0),

              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'http://openweathermap.org/img/wn/${weatherDataModel.iconLabel}@2x.png'))),
            ),
            AutoSizeText(
              "Temperature: " + weatherDataModel.temperature.toString() + "° C",
              style: TextStyle(color: Colors.black),
              maxLines: 1,
              maxFontSize: 25,
              minFontSize: 18,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(4),
              child: Text(
                '${day[current.weekday - 1]} | ${months[current.month - 1]} ${current.day}, ${current.year} |  ${DateFormat("hh:mm a").format(current)}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
