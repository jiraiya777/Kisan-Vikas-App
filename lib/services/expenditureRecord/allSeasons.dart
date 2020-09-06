import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisanVikasApp/services/vidoes/videos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/expenditureRecord/firebase_season.dart';
import 'package:kisanVikasApp/services/expenditureRecord/input_Ex_Record.dart';
import 'package:kisanVikasApp/services/expenditureRecord/input_Im_Record.dart';
import 'package:kisanVikasApp/services/expenditureRecord/allRecords.dart';

import 'package:intl/intl.dart';

import 'dart:async';


class AllSeasons extends StatefulWidget {
  @override
  _AllSeasonsState createState() => _AllSeasonsState();
}

class _AllSeasonsState extends State<AllSeasons> {

  int totalseason;
  List<Season> allseasons;
  String currentUserID , s1;
  List<String> dateList;
  DateTime currentDate;
  QuerySnapshot querySnapshot5;
  final formatter = new DateFormat('dd-MM-yyyy');

  Future getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();

    setState(() {
      currentUserID = user.uid;
    });
     print('pppppppppppppppppppppppppp $currentUserID');
  }

  Future<void> getSeasonList() async {
    await getCurrentUser();

    await Firestore.instance.collection('AllSeasonList').where("userid", isEqualTo: currentUserID).getDocuments().then((result){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
      setState(() {
        print('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
        querySnapshot5 = result;
        totalseason = querySnapshot5.documents.length;
        print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD');
      });
      print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    });

    
    
    
    
  }

  @override
  void initState() {
      super.initState();
      getSeasonList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Your Seasons List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _showSeasonsList(),
    );
  }



Widget _showSeasonsList() {
    //check if querysnapshot is null
    if (querySnapshot5 != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot5.documents.length,
        padding: EdgeInsets.fromLTRB(0, 12, 12, 0),
        itemBuilder: (context, i) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
                    margin: const EdgeInsets.fromLTRB(20.0, 25.0, 10.0, 0),
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 6,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                
                                 Text(
                                      "Season Details",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                
                                 Text(
                                      "${querySnapshot5.documents[i].data['name']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                      "Crop Type : ${querySnapshot5.documents[i].data['crop']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                       "Create Date : ${querySnapshot5.documents[i].data['createDate']}",
                                       

                                      style: const TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                       " Total Expenditure : Rs ${querySnapshot5.documents[i].data['eMoney']}",
                                       

                                      style: const TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                       " Total Income : Rs ${querySnapshot5.documents[i].data['iMoney']}",
                                       

                                      style: const TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                      child: Text("Add Income Record"),
                                      onPressed: ()
                                      {
                                        print("${querySnapshot5.documents[i].documentID}");
                                        print('dfdfdfdfdfd<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => 
                                          InputIncomeRecord(docID : "${querySnapshot5.documents[i].documentID}")
                                          )
                                          ,
                                        );
                                      },
                                      color: Colors.redAccent,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(5, 9, 9, 5),
                                      splashColor: Colors.grey,
                                    ),
                                    SizedBox(width: 3),
                                    RaisedButton(
                                      
                                      child: Text("Add Expenditure Record"),
                                      onPressed: ()
                                      {
                                        print("${querySnapshot5.documents[i].documentID}");
                                        print('dfdfdfdfdfd<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => 
                                          InputExpenditureRecord(docID : "${querySnapshot5.documents[i].documentID}")
                                          )
                                          ,
                                        );
                                      },
                                      color: Colors.redAccent,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(5, 9, 9, 5),
                                      splashColor: Colors.grey,
                                    ),
                              ]
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                      child: Text("View All Records"),
                                      onPressed: ()
                                      {
                                        print("${querySnapshot5.documents[i].documentID}");
                                        print('dfdfdfdfdfd<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => 
                                          AllRecords(docID : "${querySnapshot5.documents[i].documentID}")
                                          )
                                          ,
                                        );
                                      },
                                      color: Colors.lightBlue,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                                      splashColor: Colors.grey,
                                    ),
                              ]
                            ),

                          ],
                        ),
                  ),
              ),
            ],
          );
        }
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
  }
}

}
