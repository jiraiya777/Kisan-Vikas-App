import 'package:flutter/material.dart';

class Tea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('All about Tea'),
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
                  backgroundImage: AssetImage('assets/img/tea.jpg'),
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
                '* Soil should fertile and have some acidic quality',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Field should be slightly inclined and have a proper drainage facility.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Temp should be 20-30 celsius.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Mainly grown in Assam, West Bengal, Tamil Nadu, Kerala, Tripura, Arunachal Pradesh, Himachal Pradesh, Karnataka, Sikkim, Nagaland, Uttarakhand, Manipur, Mizoram, Meghalaya, Bihar, Orissa.',
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
                '* First take seeds and soak them in water for between 24 and 48 hours.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Then keep it in a tray in warm and sunny position and cover it with an inch of cotton cloth. ',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* After 6-8 weeks later when plant will reach almost 20cm',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Use 6000-6500 plants per acre.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* Keep 60-100cm distance in between plants.',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 14.0,
                ),
              ),
              Text(
                '* There should be 15-20 cm distance in between the grown seeds',
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
