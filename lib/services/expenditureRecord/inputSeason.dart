import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/expenditureRecord/firebase_season.dart';
import 'package:intl/intl.dart';

import 'dart:async';

class InputSeason extends StatefulWidget {
  @override
  _InputSeasonState createState() => _InputSeasonState();
}

class _InputSeasonState extends State<InputSeason> {

   final _formKey = GlobalKey<FormState>();
   final myControllerSeasonName = TextEditingController();
   final myControllerCrop = TextEditingController();
   final myControllerDate = TextEditingController();
   //final mycontroller = TextEditingController();
   String name  , crop , userID1 , currentVideoID; 
   DateTime date;
   SeasonRecord ss1;
   List<SeasonRecord> seasonRecords1 = [];
  // List<String> allUserID = [];

  // int totalUsers , totalVideoes;
  // QuerySnapshot querySnapshot1 , querySnapshot2;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1999, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

Future getCurrentUser() async {

  dynamic userID;
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseUser user = await _auth.currentUser();
   
   setState(() {
        userID = user.uid;
      });
    print('function complete $userID');
    //print(uemail);
    print('AAAAAAAAAAAAAAAAAA');
                            
                            print(userID);
                            
                            
                            
                            String s2 = "${selectedDate.toLocal()}".split(' ')[0];
                            print(s2);
                            print("????????????????????????????????????????????");
                            Season s1 = Season(name , crop , s2 , 0 , 0 ,userID );        
                            FirebaseSeason().addSeason(s1);
                            /*
                            DatabaseService().getAllVideoList().then((finaldata){
                                setState(() {
                                querySnapshot2 = finaldata;
                                totalVideoes = querySnapshot2.documents.length;
                                print("********************************************************");
                                print(totalVideoes);
                                
                                for(int i=0;i<totalVideoes;i++)
                                {
                                  if("${querySnapshot2.documents[i].data['title']}" == title &&
                                     "${querySnapshot2.documents[i].data['description']}" == description &&
                                     "${querySnapshot2.documents[i].data['url']}" == url &&
                                      querySnapshot2.documents[i].data['likes'] == 0 &&
                                      querySnapshot2.documents[i].data['dislikes']== 0 &&
                                      querySnapshot2.documents[i].data['reports'] == 0 &&
                                     "${querySnapshot2.documents[i].data['userID']}" == userID )
                                     {
                                        print("${querySnapshot2.documents[i].documentID}");
                                        currentVideoID = "${querySnapshot2.documents[i].documentID}";
                                        print('#########################################################');
                                     }
                                 
                                } 

                              });
                            });
                            
                            DatabaseService().getUserList().then((results) {
                              setState(() {
                                querySnapshot1 = results;
                                totalUsers = querySnapshot1.documents.length;
                                print("********************************************************");
                                print(totalUsers);
                                
                                for(int i=0;i<totalUsers;i++)
                                {
                                  allUserID.add("${querySnapshot1.documents[i].documentID}");
                                  print(allUserID[i]);
                                } 
                                 print('chuuuuutttaaaaaa');
                                 print('gggggggggggggggggggggggggggggggggggggggg $totalUsers');
                                for(int i=0;i<totalUsers;i++)
                                {
                                 DatabaseService().addVideoAndUser(allUserID[i], currentVideoID , 0);
                                 print('Bharat');
                                }
                              });
                            });
                            
                              */

                            Navigator.pop(context);
                               
  } 

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerSeasonName.dispose();
    myControllerCrop.dispose();
    myControllerDate.dispose();
    //mycontroller.dispose();
    super.dispose();
  }
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          title: const Text(
            'Create Season',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        
        body: SingleChildScrollView(
         child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 340,
          height: 400,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
        
            child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
               
              children: <Widget>[
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  
                  controller: myControllerSeasonName,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Season Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter season name';
                    }
                    return null;
                  },
                ),
                ),
                
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  controller: myControllerCrop,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Crop Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter crop name';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child :
                   RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () => _selectDate(context),
             
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
                ),
                   /*
                   DateTimeFormField(
                    format: format,
                    
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                    selectedDate: selectedDate,
                onDateSelected: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                lastDate: DateTime(2030),
                  ),
                ),
                
                TextFormField(
                  controller: myControllerDate,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'season create date',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter season date';
                    }
                    return null;
                  },
                ),
                */
                
                Padding(
                  
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        setState(() {
                                      name = myControllerSeasonName.text;
                                      crop = myControllerCrop.text;
                                      //date = selectedDate;
                                    });
                      print(name);
                            
                            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                            print(name);
                            print(crop);
                            print(date);
                            //print(userID);
                            getCurrentUser();
                            
                            

                      }
                      print('ccccccccccccccccccccccccccccccccccccc');
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
      )  
    );
  }
}
