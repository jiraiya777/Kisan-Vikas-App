import 'package:flutter/material.dart';

class Wheat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('All about Wheat'),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/img/wheat.jpg'),
                ),
              ),
              Text(
                'Requirements:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                '* Temp range should be 16-25 celsius.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Mainly grown in Uttar Pradesh, Punjab, Haryana, Madhya Pradesh, Rajasthan, Bihar and Gujarat.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),

              SizedBox(height: 10.0),
              Text(
                'Process:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                ),
              ),
              Text(
                '* Sow field in between 25th oct to 15th of nov.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use 40-47 kg of seeds per acre. ',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Maintain 10-20 cm space between seeds',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Then irrigate the field and after that plough field and make the field in level',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* After 15 days irrigate the plant.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* And use fertilizer in following quantity',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '           Nitrogen (N) @8- - 50 kg/acre',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '          Phosphorus (P2O5) @ 16- 25 kg/acre',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '          Potash (K2O)   @ 16 kg/acre.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use zinc/Manganese to prevent disease in plants',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
