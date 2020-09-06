import 'package:flutter/material.dart';

class Rice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
        title: Text('All about Rice'),
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
              SizedBox(height: 8.0),
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/img/rice.jpg'),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Requirements:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Soil should contain 50% of clay',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Temp range should be 21 to 37 celcius',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Mainly grown in punjab, haryana,uttar pradesh, west bengal, odisha, andhra pradesh, assam, tamil nadu.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
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
              SizedBox(height: 8.0),

              Text(
                '* Firstly ploughed your field and then use cow dung as fertilizer',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Use the proper quality of seeds 5kg per acre field to be cultivated. ',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Then after 40-50 days after proper irrigation remove grown seeds',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Then irrigate the field and after that plough field and make the field in level',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Use grown seed and sow it in a prepared field',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* There should be 15-20 cm distance in between the grown seeds',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* After 2 months irrigate the field again and removed unwanted grown plant',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* And then use organic fertilizer',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),

            ],
          ),
        ),
      ),
    );
  }
}
