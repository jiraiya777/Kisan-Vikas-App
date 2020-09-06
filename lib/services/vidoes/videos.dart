import 'package:flutter/material.dart';
//import 'package:kisanVikasApp/services/products/input_Product.dart';
//import 'package:kisanVikasApp/services/products/allProduct.dart';
import 'package:kisanVikasApp/services/vidoes/inputVideo.dart';
import 'package:kisanVikasApp/services/vidoes/show-video.dart';

class Video12 extends StatefulWidget {
  @override
  _Video12State createState() => _Video12State();
}

class _Video12State extends State<Video12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightGreen[600],
      title: const Text('Farming Video' ,
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
              color: Colors.lightBlueAccent,
              child: ListTile(
               //leading: FlutterLogo(),
                title: Text('Add Your Video',
                style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
                ),
                onTap: ()
                {
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                InputVideo()
                                )
                                ,
                              );
                } ,
                 
              ),
            ),
            Card(
              color: Colors.lightBlueAccent,
              child: ListTile(
                //leading: FlutterLogo(),
                title: Text('View Videoes',
                style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
                
                ),
                onTap: ()
                {
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                LoadDataFromFirestore())
                                ,
                              );
                },
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}