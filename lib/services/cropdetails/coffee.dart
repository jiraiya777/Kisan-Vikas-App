import 'package:flutter/material.dart';

class Coffee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('All about Coffee'),
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
                  backgroundImage: AssetImage('assets/img/coffee.jpg'),
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
                '* Temp range should be 10-28 celsius',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* There should not be heavy rainfall.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Mainly grown in  Karnataka, Kerala, Tamil Nadu, Andhra Pradesh, Orissa, Assam and Manipur.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              //SizedBox(height: 4.0),
              SizedBox(height: 15.0),
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
                '* First plough field 4 to 5 times and harrow to bring fine tilth stage.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Remove any stones and weeds of previous crops.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* First take 1600- 2000 per acre and sow it.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Space between seeds should be 2.5cm.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* After 30-40 days when seeds are germinated uproot it and transplant it into polythene bags or in nursery beds at spacing of 25cm.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* After 6-7 months when plants are of height 20-25 cm , transplant it in the main prepared field.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* The space between plants in the main field should be 20-25 cm in row and 3-5 cm in column.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '* Use phosphorus and lime as fertilizer.',
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
