import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kisanVikasApp/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class UserDetails extends StatefulWidget {
  const UserDetails({Key key}) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

   final _formKey = GlobalKey<FormState>();
   final myControllerName = TextEditingController();
   final myControllerState = TextEditingController();
   String name,state;
   QuerySnapshot querySnapshot1 , querySnapshot7;
   int totalVideoes , totalUsers , cursor = 0;

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
                            await Firestore.instance.collection('users').getDocuments().then((results1) {
                              setState(() {
                                querySnapshot7 = results1;
                                totalUsers = querySnapshot7.documents.length;
                                print("********************************************************");
                                print(totalUsers);
                                for(int j=0;j<totalUsers;j++)
                                {
                                    if(userID == "${querySnapshot7.documents[j].documentID}")
                                    {
                                      cursor = 1;
                                      break; 
                                    }
                                }
                                  
                              });
                              
                            });


                            //final CollectionReference users555 = Firestore.instance.collection('users');
                            await Firestore.instance.collection('users').document(userID).setData({
                              'name': name,
                              'state': state,
                            });
                        
                          
                            print("????????????????????????????????????????????");
                            print("ghghghghghghghghghghghghghghghghghgh");
                            if( cursor == 0)
                            {
                                await Firestore.instance.collection('AllVideoList').getDocuments().then((results) {
                                setState(() {
                                  querySnapshot1 = results;
                                  totalVideoes = querySnapshot1.documents.length;
                                  print("********************************************************");
                                  print(totalVideoes);
                                  
                                  
                                });
                              });
                              print(totalVideoes);
                              print('###################################33');
                              final CollectionReference videoAndUser1 = Firestore.instance.collection('VideoAndUser');
                              for(int i=0;i<totalVideoes;i++)
                              {
                                await videoAndUser1.document().setData({
                                      'userID': userID,
                                      'video' : "${querySnapshot1.documents[i].documentID}",
                                      'state' : 0

                                });
                                //DatabaseService().addVideoAndUser(userID, "${querySnapshot1.documents[i].documentID}" , 0);
                                print('Bharat');
                              }

                            }
                            
                            print('Ankit');
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const HomePage()), (Route<dynamic> route) => false);
                            


                          
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerName.dispose();
    myControllerState.dispose();
  
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          title: const Text(
            'Farmer Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        
        body: SingleChildScrollView(
         child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 350,
          //height: 450,
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
                  
                  controller: myControllerName,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Your Name';
                    }
                    return null;
                  },
                ),
                ),
                
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child : TextFormField(
                  controller: myControllerState,
                 // maxLines: 4,
                  //keyboardType:TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your State',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Your State';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(height: 10),
     
                Padding(
                  
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        setState(() {
                                      name = myControllerName.text;
                                      state = myControllerState.text;
                                     // url = myControllerUrl.text;
                                    });
                      //print(title);
                            
                            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                            print(name);
                            print(state);
                            //print(url);
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
