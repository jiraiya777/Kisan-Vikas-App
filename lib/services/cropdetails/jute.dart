import 'package:flutter/material.dart';

class Jute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('All about Jute'),
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
                  backgroundImage: AssetImage('assets/img/jute.jpg'),
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
                '* Temp range should be 25-30 celsius.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Ph range of soil should be less than 7.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Mainly grown in West Bengal , Assam, Orissa, Bihar, Uttar Pradesh, Tripura and Meghalaya.',
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
                '* Firstly plough the field 3-4 times to make it fine tilth',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use the proper quality of seeds 5kg per acre field to be cultivated. ',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* After that spread cow dung or previous crussed crops.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use 2-3 kg jute seeds per acre.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Keep the distance of 4-7 cm in column and 25-30 cm in row while sowing seeds.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* On the fifth day after sowing irrigate the field lightly, and after that irrigate the field in a 2 week interval.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Carry out weeding of the field in an interval of 10-12 days twice and then once after 5-6 week, and also use 4-5 kg of nitrogen as fertilizer after every weeding .',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Spray the fluchloralin in the field after every 3-4 days, use 0.5 kg per acre followed by watering.',
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
