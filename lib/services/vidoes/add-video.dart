

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
   String uid;
   DatabaseService({this.uid});
  

  // collection reference
  final CollectionReference videoCollection = Firestore.instance.collection('AllVideoList');
  final CollectionReference videoAndUser = Firestore.instance.collection('VideoAndUser');
  
 getUserList() async {
    return await Firestore.instance.collection('users').getDocuments();
 }

 getAllVideoList() async {
    return await Firestore.instance.collection('AllVideoList').getDocuments();
 }


  Future<void> addVideo(String title, String description, String url , int likes , int dislikes , int reports , String userID) async {
    return await videoCollection.document().setData({
      'title': title,
      'description': description,
      'url': url,
      'likes': likes,
      'dislikes': dislikes,
      'reports': reports,
       'userID': userID,
      
    });
    
  }

 

  Future<void> addVideoAndUser(String userID , String videoID , int state) async{
    return await videoAndUser.document().setData({
          'userID': userID,
           'video' : videoID,
           'state' : state

    });
  }
Future<void> updatestate(String videoID , String userID , int state) async{

  String currentDocID;
  QuerySnapshot querySnapshot;
  int totalUandV;
  await videoAndUser.getDocuments().then((result){
    querySnapshot = result;
    totalUandV = querySnapshot.documents.length;

   for(int i=0;i<totalUandV;i++)
   {
     if("${querySnapshot.documents[i].data['userID']}" == userID &&
       "${querySnapshot.documents[i].data['video']}" == videoID )
       {
         currentDocID = "${querySnapshot.documents[i].documentID}";
         break;
       }
   }

  });
  return await videoAndUser.document(currentDocID)
              .updateData({'state' : state});
  
}

Future<void> updateData(String currentDocumentID ,int value) async {
    return await videoCollection.document(currentDocumentID)
              .updateData({'likes' : value});
}
Future<void> updateData1(String currentDocumentID ,int value) async {
    return await videoCollection.document(currentDocumentID)
              .updateData({'dislikes' : value});
}
}