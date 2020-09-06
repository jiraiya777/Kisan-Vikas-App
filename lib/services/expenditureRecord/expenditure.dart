import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/inputSeason.dart';
import 'package:kisanVikasApp/services/expenditureRecord/allSeasons.dart';

 
class CreateAndViewSeason extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          title: const Text(
            'Season Records',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
            body: SafeArea(
                child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
 
                   RaisedButton(
                      child: Text("Create New Season"),
                      onPressed: ()
                      {
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                InputSeason()
                                )
                                ,
                              );
                      } ,
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      splashColor: Colors.grey,
                    ),
                    RaisedButton(
                      child: Text("View Seasons"),
                      onPressed: ()
                      {
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                AllSeasons()
                                )
                                ,
                              );
                      } ,
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      splashColor: Colors.grey,
                    ),
 
                  ],
                  )
                )
              )
            )
         );
  }
}