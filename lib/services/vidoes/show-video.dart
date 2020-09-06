import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:kisanVikasApp/services/vidoes/add-video.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadDataFromFirestore extends StatefulWidget {
  @override
  _LoadDataFromFirestoreState createState() => _LoadDataFromFirestoreState();
}

class _LoadDataFromFirestoreState extends State<LoadDataFromFirestore> {


  List<bool> isLikes = [];
  List<bool> isDislikes = [];
  int like, dislike, report;
  bool mystate1;
  int totalVideo, totalVideo3, videoUserList;
  String userID1, currentUserID;
  String currentDocumentID;
  QuerySnapshot querySnapshot,querySnapshot3, querySnapshot2;

  Future getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();

    setState(() {
      currentUserID = user.uid;
    });
     print('pppppppppppppppppppppppppp $currentUserID');
  }

  Future getVideoList() async {
    return await Firestore.instance.collection('AllVideoList').getDocuments();
  }

  Future getUserVideoList() async {
    return await Firestore.instance.collection('VideoAndUser').getDocuments();
  }

  Future<void> doAllTask() async {
    await Firestore.instance.collection('VideoAndUser').getDocuments().then((rrr){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
      setState(() {
        print('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
        querySnapshot2 = rrr;
        videoUserList = querySnapshot2.documents.length;
        print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD');
      });
      print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    });
    print("#######################################");
    print(videoUserList);

    print('ggggggggggggggggggggggggggggggggggggggggggg');
    await getCurrentUser();
    print('llllllllllllllllllllllllllllllllllllllllll');

    /*
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();

    setState(() {
      currentUserID = user.uid;   
    });
    print('pppppppppppppppppppppppppp $currentUserID');
    */
    await Firestore.instance.collection('AllVideoList').getDocuments().then((finalResult){
        setState(() {
                  querySnapshot = finalResult;
                  totalVideo = querySnapshot.documents.length;
        
                });
    });
    print("********************************************************");
    print(totalVideo);
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

    
    print('22222222222222222222222222222222 $currentUserID');

    for (int j = 0; j < totalVideo; j++) {
          print('ffffffffffffffffffffffffffffffffffffffffffffffffffff');
          String currentVideoIDD = "${querySnapshot.documents[j].documentID}";
          print('%%%%%%%%%%%%%%%%%%%%%%%%% $currentVideoIDD ');

          for (int p = 0; p < videoUserList; p++) {
            if ("${querySnapshot2.documents[p].data['userID']}" ==
                    currentUserID &&
                "${querySnapshot2.documents[p].data['video']}" ==
                    currentVideoIDD) {
              if (querySnapshot2.documents[p].data['state'] == 0) {
                setState(() {
                  isLikes.add(false);
                  isDislikes.add(false);          
                });
                
              } else if (querySnapshot2.documents[p].data['state'] == 1) {
                setState(() {
                  isLikes.add(true);
                  isDislikes.add(false);
                });
              } else if (querySnapshot2.documents[p].data['state'] == 2) {
                setState(() {
                  isLikes.add(false);
                  isDislikes.add(true);
                });
              }

              break;
            }
          }
        }

      print(isLikes.length);
      print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
      for (int k = 0; k < isLikes.length; k++) {
        print(k);
        print(isLikes[k]);
      }
      print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');

  }

  @override
  void initState() {
      super.initState();
      doAllTask();
  }

  Future<void> checkFocChanges() async {
    CollectionReference reference =
        Firestore.instance.collection('AllVideoList');
    reference.snapshots().listen((updatedData) {
      setState(() {
        querySnapshot = updatedData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Farming Video List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _showVideoes(),
    );
  }

  Widget _showVideoes() {
    //check if querysnapshot is null
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.fromLTRB(0, 12, 12, 0),
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Card(
                  margin: const EdgeInsets.fromLTRB(13.0, 13.0, 13.0, 0),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "${querySnapshot.documents[i].data['title']}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${querySnapshot.documents[i].data['description']}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: YoutubePlayer(
                                    width: 335,
                                    controller: YoutubePlayerController(
                                      initialVideoId: YoutubePlayer.convertUrlToId(
                                          "${querySnapshot.documents[i].data['url']}"),
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                //correctLike(isLikes),
                                //colordecider("${querySnapshot.documents[i].documentID}" , 0),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    color: (isLikes[i]
                                        ? Colors.yellow[500]
                                        : Colors.grey),
                                    onPressed: () {
                                      DatabaseService().updatestate("${querySnapshot.documents[i].documentID}" , currentUserID , 1);
                                      setState(() {
                                        if (isLikes[i] == true &&
                                            isDislikes[i] == false) {
                                          isLikes[i] = false;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['likes'] -
                                                      1);
                                          checkFocChanges();
                                        } else if (isLikes[i] == false &&
                                            isDislikes[i] == true) {
                                          //_favoriteCount += 1;
                                          isDislikes[i] = false;
                                          isLikes[i] = true;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['likes'] +
                                                      1);
                                          DatabaseService(uid: userID1)
                                              .updateData1(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['dislikes'] -
                                                      1);
                                          checkFocChanges();
                                        } else if (isLikes[i] == false &&
                                            isDislikes[i] == false) {
                                          isLikes[i] = true;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['likes'] +
                                                      1);
                                          checkFocChanges();
                                        }
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${querySnapshot.documents[i].data['likes']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: Icon(Icons.thumb_down),
                                    color: (isDislikes[i]
                                        ? Colors.yellow[500]
                                        : Colors.grey),
                                    onPressed: () {
                                      DatabaseService().updatestate("${querySnapshot.documents[i].documentID}" , currentUserID , 2);
                                      setState(() {
                                        if (isLikes[i] == true &&
                                            isDislikes[i] == false) {
                                          //_favoriteCount -= 1;
                                          isLikes[i] = false;
                                          isDislikes[i] = true;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['likes'] -
                                                      1);
                                          DatabaseService(uid: userID1)
                                              .updateData1(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['dislikes'] +
                                                      1);
                                          checkFocChanges();
                                        } else if (isLikes[i] == false &&
                                            isDislikes[i] == true) {
                                          //_favoriteCount += 1;
                                          isDislikes[i] = false;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData1(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['dislikes'] -
                                                      1);
                                          checkFocChanges();
                                        } else if (isLikes[i] == false &&
                                            isDislikes[i] == false) {
                                          isDislikes[i] = true;
                                          currentDocumentID =
                                              "${querySnapshot.documents[i].documentID}";
                                          print(currentDocumentID);
                                          DatabaseService(uid: userID1)
                                              .updateData1(
                                                  currentDocumentID,
                                                  querySnapshot.documents[i]
                                                          .data['dislikes'] +
                                                      1);
                                          checkFocChanges();
                                        }
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${querySnapshot.documents[i].data['dislikes']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ]
                        )
                      )
                    )
            ],
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
