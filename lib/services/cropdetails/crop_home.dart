
import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/cropdetails/wheat.dart';
import 'package:kisanVikasApp/services/cropdetails/rice.dart';
import 'package:kisanVikasApp/services/cropdetails/jute.dart';
import 'package:kisanVikasApp/services/cropdetails/sugarcane.dart';
import 'package:kisanVikasApp/services/cropdetails/tea.dart';
import 'package:kisanVikasApp/services/cropdetails/coffee.dart';

class CropQuery extends StatefulWidget {
  @override
  _CropQueryState createState() => _CropQueryState();
}

class _CropQueryState extends State<CropQuery> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Text('Crop Query' ,
        style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/home.jpg'),
                radius: 80.0,
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 40.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Choose any of the major crops of India:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Rice()
                                )
                                ,
                              );
                    },
                    icon: Icon(Icons.bubble_chart),
                    label: Text(
                        'Rice'
                    )
                ),
                FlatButton.icon(
                    onPressed: (){
                      Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Wheat()
                                )
                                ,
                              );
                    },
                    icon: Icon(Icons.bubble_chart),
                    label: Text(
                        'Wheat'
                    )
                ),
              ]
            ),
            Row(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Jute()
                                )
                                ,
                              );
                      },
                      icon: Icon(Icons.bubble_chart),
                      label: Text(
                          'Jute'
                      )
                  ),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Coffee()
                                )
                                ,
                              );
                      },
                      icon: Icon(Icons.bubble_chart),
                      label: Text(
                          'Coffee'
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Tea()
                                )
                                ,
                              );
                      },
                      icon: Icon(Icons.bubble_chart),
                      label: Text(
                          'Tea'
                      )
                  ),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Sugarcane()
                                )
                                ,
                              );
                      },
                      icon: Icon(Icons.bubble_chart),
                      label: Text(
                          'Sugarcane'
                      )
                  ),
                ]
            ),


          ],

        ),
      ),

    );
  }
}

