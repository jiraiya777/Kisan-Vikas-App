import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Top SVG Image
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            height: MediaQuery.of(context).size.height * 0.35,
            child: SvgPicture.asset('assets/img/weather_rain.svg',
                fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              child: Text(
                "LOADING",
                style: TextStyle(fontSize: 25, letterSpacing: 3),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.80,
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
