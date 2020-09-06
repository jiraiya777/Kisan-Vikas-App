import 'package:flutter/material.dart';

class Sugarcane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('All about Sugarcane'),
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
                  backgroundImage: AssetImage('assets/img/sugarcane.jpg'),
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
                '* Temp range should be 20-50 celsius.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Mainly grown in Uttar pradesh Maharashtra, Karnataka, Tamil Nadu, Andhra Pradesh, Gujarat, Bihar, Haryana and Punjab.',
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
                '* Firstly plough field well.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Then prepare ridges and furrows on 100-120cm spacing.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use 10000 - 12000 per acre three eye budded cane setts',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* From day 1-35 keep the field mosturable, after that irrigate the field every 10th days till 100th days and after that irrigate every week till 270th days after that irrigate every 14th day till harvesting the crop',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* In early days apply paddy straw or spread sugarcane trash in the field, it will decrease the evaporation and thus this will decrease water demand of the field.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Tye the cane so that it does not sway away during wind.',
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
