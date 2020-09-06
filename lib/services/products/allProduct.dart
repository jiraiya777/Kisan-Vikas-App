import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/products/firebaseProduct.dart';
import 'package:kisanVikasApp/services/expenditureRecord/input_Ex_Record.dart';
import 'package:kisanVikasApp/services/products/detailsProduct.dart';

import 'package:intl/intl.dart';

import 'dart:async';


class AllProducts extends StatefulWidget {
  //final String docID;
  //AllProducts({this.docID});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  //final String docID;
  // _AllRecordsState({this.docID});

  int totalproducts;
  List<AllProducts> allProducts;
  Product pp;
  final List<String> allimage = new List();
  String currentUserID , s1;
  var url;
  //List<String> dateList;
  //DateTime currentDate;
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

  Future<void> getProductList() async {
   
    
    await Firestore.instance.collection('AllProductList').getDocuments().then((result){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
      setState(() {
        print ('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
        querySnapshot5 = result;
        totalproducts = querySnapshot5.documents.length;
        print(totalproducts);
        print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD');
      });
      print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    });
    for(int i=0;i<totalproducts;i++)
    {
      setState(() {
              allimage.add("${querySnapshot5.documents[i].data['productID']}");
            });
    }

    
    
    
    
  }

  @override
  void initState() {
      super.initState();
      getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Product List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _showProductList(),
    );
  }



/*

 Future<void> getUrl(var ss1) async {
    final ref = FirebaseStorage.instance.ref().child(ss1);
    // no need of the file extension, the name will do fine.
  
    var url1 =  await ref.getDownloadURL() ;
        
    
    print(url1);
    print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
    setState(() {
          url = url1;
        });
    
 }
 
 Widget getImage(var imageName){
  var s3 = "images/" + imageName + ".png";
  getUrl(s3);
    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(url),
      fit: BoxFit.cover)
    ),
    );
  }
  
*/


Widget _showProductList() {
    //check if querysnapshot is null
    if (querySnapshot5 != null) {
      return GridView.builder(
        primary: false,
        itemCount: querySnapshot5.documents.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  2,
          childAspectRatio: 1,
          crossAxisSpacing: 0),
          
        padding: EdgeInsets.fromLTRB(0, 12, 12, 0),
        itemBuilder: (context, i) {
          return Container(
                  height: 300,
                  child: Column(
            children: <Widget>[
                   Card(
                    margin: const EdgeInsets.fromLTRB(8.0, 13.0, 13.0, 0),
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                     Text(
                                       "${querySnapshot5.documents[i].data['productName']}",
                                       style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                     ),
                                  ]
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    
                                       Container(
                                         height: 65,
                                         child:Image(
                                           image: AssetImage('assets/img/${querySnapshot5.documents[i].data['productID']}.jpg'),
                                           fit: BoxFit.fill,
                                           )
                                       )
                                      
                                      
                                      
                                      
                                    
                                  
                                  ]
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Rs ${querySnapshot5.documents[i].data['price']}",
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
                                    Expanded(
                                      child : RaisedButton(
                                      child: Text("View product"),
                                      onPressed: ()
                                      {
                                        setState(() {
                                                       pp = Product("${querySnapshot5.documents[i].data['productID']}",
                                                                   "${querySnapshot5.documents[i].data['productName']}",
                                                                    "${querySnapshot5.documents[i].data['sellerName']}",
                                                                     "${querySnapshot5.documents[i].data['sellerAddress']}",
                                                                     "${querySnapshot5.documents[i].data['sellerMobile']}",
                                                                     querySnapshot5.documents[i].data['price'],
                                                                    "${querySnapshot5.documents[i].data['description']}");                           
                                                        });
                                        print("${querySnapshot5.documents[i].documentID}");
                                        print('dfdfdfdfdfd<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => 
                                          Product12(docID : pp)
                                          )
                                          ,
                                        );
                                        
                                      },
                                      
                                      color: Colors.lightGreen[600],
                                      textColor: Colors.white,
                                      padding: EdgeInsets.fromLTRB(4, 9, 9, 4),
                                      splashColor: Colors.grey,
                                    ),
                                    )
                                    
                                  ],
                                )
                                
                              ],
                            ),   
                        ),
                ),
            ],
              ),
                      
          
            
          );
        },
      );
    } else {
      return Center(
        child: Container(
          child: Text('Content Loading......',
                  style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                 ),
        ),
      );

  }
}

}
