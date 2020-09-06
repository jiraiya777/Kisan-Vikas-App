import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisanVikasApp/services/vidoes/videos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/expenditureRecord/firebase_season.dart';
import 'package:kisanVikasApp/services/expenditureRecord/allSeasons.dart';
import 'package:intl/intl.dart';

import 'dart:async';

class InputIncomeRecord extends StatefulWidget {
  final String docID;
  InputIncomeRecord({this.docID});
  //InputExpenditureRecord({Key key, @required this.docID}) : super(key: key);

  @override
  _InputIncomeRecordState createState() => _InputIncomeRecordState(docID: docID);
}

class _InputIncomeRecordState extends State<InputIncomeRecord> {
   //final String docID;
   final String docID;
   _InputIncomeRecordState({this.docID});

   final _formKey = GlobalKey<FormState>();
   final myControllerMoney = TextEditingController();
   final myControllerDiscription = TextEditingController();
  
   String discription ,stringDate, userID1 , currentVideoID , s2; 
   int money, totalIncome;
   String seasonName , currentUserID;
   SeasonRecord newExRecord;
   List<SeasonRecord> srList;
   QuerySnapshot querySnapshot6;

   

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
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();

    setState(() {
      currentUserID = user.uid;
    });
     print('pppppppppppppppppppppppppp $currentUserID');
  }

Future<void> modifyRecords() async {
  print('sssssssssssssssssssssssssssssssssssssssssssssss');
    print(docID);
    await getCurrentUser();    
    setState(() {
          s2 = "${selectedDate.toLocal()}".split(' ')[0];
          newExRecord = SeasonRecord( currentUserID, docID , discription, money, 1 , s2);
        });
    await FirebaseSeason().addRecord(newExRecord);    

    await Firestore.instance.collection('AllSeasonList').document(docID)
    .get().then((result1){
       setState(() {
              seasonName = result1.data['name'];
              totalIncome = result1.data['iMoney'];
              print(seasonName);
              print(totalIncome);
              print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              });   
    });
     setState(() {
                totalIncome = totalIncome+money;
                }); 
      print('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKkkkkkkkkk');
      FirebaseSeason().updateIncome(docID , totalIncome)  ;
          
         
    
      

    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQqqqqqqq");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                AllSeasons()
                                ));
  } 

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerDiscription.dispose();
    myControllerMoney.dispose();
    //myControllerDate.dispose();
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
            'Create Income Record',
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
          //height: 400,
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
                  
                  controller: myControllerMoney,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Income Amount',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Income Amount';
                    }
                    return null;
                  },
                ),
                ),
                
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  controller: myControllerDiscription,
                  maxLines: 4,
                  keyboardType:TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter details for Income Earned';
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
                
                Padding(
                  
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        setState(() {
                                      money = int.parse(myControllerMoney.text);
                                      discription = myControllerDiscription.text;
                                      //date = selectedDate;
                                    });
                      
                            
                            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                            print(money);
                            print(discription);
                            //print(date);
                            //print(userID);
                            modifyRecords();
                            
                            

                      }
                      print('ccccccccccccccccccccccccccccccccccccc');
                    },
                    child: Text('Submit'),
                    color: Colors.lightGreen[600],
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(5, 9, 9, 5),
                    splashColor: Colors.grey,
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
