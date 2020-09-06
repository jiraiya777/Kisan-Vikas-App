import 'package:flutter/material.dart';
import 'dart:io';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:image_form_field/image_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisanVikasApp/services/products/firebaseProduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kisanVikasApp/services/products/photo_taker.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class InputProduct extends StatefulWidget {
  @override
  _InputProductState createState() => _InputProductState();
}

class _InputProductState extends State<InputProduct> {

   final _formKey = GlobalKey<FormState>();
   final myControllerProductName = TextEditingController();
   final myControllerPrice = TextEditingController();
   final myControllerDescription = TextEditingController();
   final myControllerSellerName = TextEditingController();
   final myControllerSellerMobile = TextEditingController();
   final myControllerSellerAddress = TextEditingController();
   //final mycontroller = TextEditingController();
   String productName, sellerName  , sellerMobile ;
   String  description, sellerAddress , userID1 , currentVideoID , productID; 
   int price;
   QuerySnapshot querySnapshot6;
   int totalpp;
   
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
                            await Firestore.instance.collection('AllProductList').getDocuments().then((result){
                            print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
                            setState(() {
                              print ('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
                              querySnapshot6 = result;
                              totalpp = querySnapshot6.documents.length;
                              print(totalpp);
                              print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD');
                            });
                            print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
                          });
                          setState(() {
                                            productID = "product"+"${totalpp}";
                                            print(productID);
                                                    });
                            Product p1 = Product(productID , productName, sellerName, sellerAddress, sellerMobile, price, description);
                            //FirebaseProduct().addProduct(p1);
                             final docRef = await Firestore.instance.collection('AllProductList').add({
                               'productID': p1.productID,
                              'productName': p1.productName,
                              'price': p1.price,
                              'description': p1.description,
                              'sellerName': p1.sellerName,
                              'sellerMobile': p1.sellerMobile,
                              'sellerAddress': p1.sellerAddress,
                              
                            });
                            print(docRef.documentID);
                            print("????????????????????????????????????????????");
                            
                            myControllerProductName.clear();
                            myControllerPrice.clear();
                            myControllerDescription.clear();
                            myControllerSellerName.clear();
                            myControllerSellerAddress.clear();
                            myControllerSellerMobile.clear();

                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                ImageCapture(docID : "${docRef.documentID}")
                                )
                                ,
                              );
                            //Navigator.pop(context);
                               
  } 

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerProductName.dispose();
    myControllerSellerName.dispose();
    myControllerSellerAddress.dispose();
    myControllerSellerMobile.dispose();
    myControllerPrice.dispose();
    myControllerDescription.dispose();
    //mycontroller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          title: const Text(
            'Add Your Product',
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
                  
                  controller: myControllerProductName,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Product name';
                    }
                    return null;
                  },
                ),
                ),
                
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  controller: myControllerPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Price',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Product Price';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  
                  controller: myControllerDescription,
                  maxLines: 4,
                  keyboardType:TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Description',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Product details';
                    }
                    return null;
                  },
                ),
                ),

                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  
                  controller: myControllerSellerName,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Seller Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Seller Name';
                    }
                    return null;
                  },
                ),
                ),

                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  
                  controller: myControllerSellerMobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Seller Contact Number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Seller Mobile Number';
                    }
                    return null;
                  },
                ),
                ),

                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  
                  controller: myControllerSellerAddress,
                  maxLines: 3,
                  keyboardType:TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Seller Address',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Seller Address';
                    }
                    return null;
                  },
                ),
                ),

        
                Padding(
                  
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    
                    onPressed: () {
                      
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        setState(() {
                                      productName = myControllerProductName.text;
                                      price = int.parse(myControllerPrice.text);
                                      description = myControllerDescription.text;
                                      sellerName = myControllerSellerName.text;
                                      sellerMobile = myControllerSellerMobile.text;
                                      sellerAddress = myControllerSellerAddress.text;
                                      //date = selectedDate;
                                    });
                      //print(name);
                            
                            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                            print(productName);
                            print(price);
                            print(description);
                            print(productName);
                            print(price);
                            print(description);
                            //print(userID);
                            getCurrentUser();
                            
                            

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

class ImageInputAdapter {
  /// Initialize from either a URL or a file, but not both.
  ImageInputAdapter({
    this.file,
    this.url
  }) : assert(file != null || url != null), assert(file != null && url == null), assert(file == null && url != null);

  /// An image file
  final File file;
  /// A direct link to the remote image
  final String url;

  /// Render the image from a file or from a remote source.
  Widget widgetize() {
    if (file != null) {
      return Image.file(file);
    } else {
      return FadeInImage(
        image: NetworkImage(url),
        placeholder: AssetImage("assets/img/placeholder.png"),
        fit: BoxFit.contain,
      );
    }
  }
}