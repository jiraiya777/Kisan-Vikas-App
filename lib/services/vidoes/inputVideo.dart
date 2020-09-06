import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/vidoes/add-video.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class InputVideo extends StatefulWidget {
  @override
  _InputVideoState createState() => _InputVideoState();
}

class _InputVideoState extends State<InputVideo> {
   final _formKey = GlobalKey<FormState>();
   final myControllerTitle = TextEditingController();
   final myControllerDescription = TextEditingController();
   final myControllerUrl = TextEditingController();
   final mycontroller = TextEditingController();
   String title  , description , url , userID1 , currentVideoID; 
   List<String> allUserID = [];
   int totalUsers=0 , totalVideoes;
   QuerySnapshot querySnapshot1 , querySnapshot2;

  
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
                            
                            final docRef = await Firestore.instance.collection('AllVideoList').add({
                              'title': title,
                              'description': description,
                              'url': url,
                              'likes': 0,
                              'dislikes': 0,
                              'reports': 0,
                              'userID': userID,
                              
                            });
                            print(docRef.documentID);
                            setState(() {
                                              currentVideoID = docRef.documentID;            
                                                        });
                            print("????????????????????????????????????????????");
                            print("ghghghghghghghghghghghghghghghghghgh");
                            await Firestore.instance.collection('users').getDocuments().then((results) {
                              setState(() {
                                querySnapshot1 = results;
                                totalUsers = querySnapshot1.documents.length;
                                print("********************************************************");
                                print(totalUsers);
                                
                                
                              });
                            });
                            print(totalUsers);
                            print('###################################33');
                            setState(() {
                                for(int i=0;i<totalUsers;i++)
                                {
                                  allUserID.add("${querySnapshot1.documents[i].documentID}");
                                  print(allUserID[i]);
                                }                     
                                                        });
                             
                                 print('chuuuuutttaaaaaa');
                                 print('gggggggggggggggggggggggggggggggggggggggg $totalUsers');
                                for(int i=0;i<totalUsers;i++)
                                {
                                 DatabaseService().addVideoAndUser(allUserID[i], currentVideoID , 0);
                                 print('Bharat');
                                }
                            


                            Navigator.pop(context );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerTitle.dispose();
    myControllerDescription.dispose();
    myControllerUrl.dispose();
    mycontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[600],
          title: const Text(
            'Add Your Video',
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
                  
                  controller: myControllerTitle,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Video Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter video Title';
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
                    labelText: 'Video Description',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Video Description';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.all(16.0),
                child :
                TextFormField(
                  controller: myControllerUrl,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Youtube Url',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Youtube Url';
                    }
                    return null;
                  },
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
                                      title = myControllerTitle.text;
                                      description = myControllerDescription.text;
                                      url = myControllerUrl.text;
                                    });
                      print(title);
                            
                            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                            print(title);
                            print(description);
                            print(url);
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


      /*
      body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: mycontroller,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  setState(() {
                                      title = mycontroller.text;
                                    });
                      print(title);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    )  */
    );
  }
}
