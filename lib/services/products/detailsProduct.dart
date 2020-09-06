import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/products/firebaseProduct.dart';
import 'package:kisanVikasApp/services/expenditureRecord/input_Ex_Record.dart';

import 'package:intl/intl.dart';

import 'dart:async';


class Product12 extends StatefulWidget {
  final Product docID;
  Product12({this.docID});

  @override
  _Product12State createState() => _Product12State(docID: docID);
}

class _Product12State extends State<Product12> {

  final Product docID;
   _Product12State({this.docID});

  int totalrecords;
  //List<Season> allseasons;
  String currentUserID , s1;
  //List<String> dateList;
  DateTime currentDate;
  QuerySnapshot querySnapshot5;
  //final formatter = new DateFormat('dd-MM-yyyy');



  Future getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();

    setState(() {
      currentUserID = user.uid;
    });
     print('pppppppppppppppppppppppppp $currentUserID');
  }

  

  @override
  void initState() {
      super.initState();
      //getRecordList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:_showProductDetails(),
      )
      
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

Widget _showProductDetails() {

      return Container(
               // height:1200,
                width: 360,
              child: Card(
                  margin: const EdgeInsets.fromLTRB(8.0, 13.0, 13.0, 0),
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                         height: 300,
                                         width: 300,
                                         child:Image(
                                           image: AssetImage('assets/img/${docID.productID}.jpg'),
                                           fit: BoxFit.fill,
                                           )
                                       )
                                  ],
                                ),
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                     Text(
                                       "${docID.productName}",
                                       style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                     ),
                                  ]
                                ),
                                
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                       "Price : ",
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                       "Rs${docID.price}",
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                         "Description : ",
                                        maxLines: 50,
                                        overflow: TextOverflow.ellipsis,
                                        
                                        textAlign: TextAlign.justify,

                                      style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                         "${docID.description}",
                                        maxLines: 50,
                                        overflow: TextOverflow.ellipsis,
                                        
                                        textAlign: TextAlign.justify,

                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                      Text(
                                         "Seller Details",
                                       

                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                      Text(
                                       '''Seller Name : ''',
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                       '''${docID.sellerName}''',
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                    
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                       '''Seller Address : ''',
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                      
                                        color: Colors.black,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Text(
                                       '''${docID.sellerAddress}''',
                                       

                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                       '''Seller Mobile No. : ''',
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                       '''${docID.sellerMobile}''',
                                       

                                      style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),   
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //SizedBox(width: 10,),
                                      FlatButton(
                                      onPressed: () => {},
                                      color: Colors.lightGreenAccent,
                                      padding: EdgeInsets.all(10.0),
                                      child: Row( // Replace with a Row for horizontal icon + text
                                        children: <Widget>[
                                          SizedBox(width: 30),
                                          Icon(Icons.call),
                                           SizedBox(width: 12),
                                          //Expanded(
                                            Text("Call Now" ,
                                            style: const TextStyle(
                                        fontSize: 20,
                                        
                                        color: Colors.black,
                                      ),
                                            ),
                                            SizedBox(width: 30),
                                            
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                   
                                  ],
                                ),
                                
                                
                              
                            ),   
                        ),
                      
          );
        
  
    }

}
