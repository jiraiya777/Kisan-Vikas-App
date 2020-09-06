import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/expenditureRecord/firebase_season.dart';
import 'package:kisanVikasApp/services/expenditureRecord/input_Ex_Record.dart';

import 'package:intl/intl.dart';

import 'dart:async';


class AllRecords extends StatefulWidget {
  final String docID;
  AllRecords({this.docID});

  @override
  _AllRecordsState createState() => _AllRecordsState(docID: docID);
}

class _AllRecordsState extends State<AllRecords> {

  final String docID;
   _AllRecordsState({this.docID});

  int totalrecords;
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

  Future<void> getRecordList() async {

    await getCurrentUser();
    print(docID);
    await Firestore.instance.collection('AllRecordList').where("sectionId", isEqualTo: docID ).getDocuments().then((result){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
      setState(() {
        print('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
        querySnapshot5 = result;
        totalrecords = querySnapshot5.documents.length;
        print(totalrecords);
        print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD');
      });
      print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    });

    
    
    
    
  }

  @override
  void initState() {
      super.initState();
      getRecordList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Record List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _showRecordList(),
    );
  }

Widget writeMoney(int i)
{ 
  if(querySnapshot5.documents[i].data['type'] == 0)
  {
    return Text("Expenditure Amount : Rs ${querySnapshot5.documents[i].data['money']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      );
  }
  else
  {
    return Text("Income Amount : Rs ${querySnapshot5.documents[i].data['money']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      );
  }
  
}

Widget _showRecordList() {
    //check if querysnapshot is null
    if (querySnapshot5 != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot5.documents.length,
        padding: EdgeInsets.fromLTRB(0, 12, 12, 0),
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Card(
                  margin: const EdgeInsets.fromLTRB(8.0, 13.0, 13.0, 8),
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                     writeMoney(i),
                                  ]
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Description : ",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      " ${querySnapshot5.documents[i].data['description']}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                       "Date : ${querySnapshot5.documents[i].data['date']}",
                                       

                                      style: const TextStyle(
                                        fontSize: 14,
                                        
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                              ],
                            ),   
                        ),
                      )
            ]
            
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
  }
}

}
