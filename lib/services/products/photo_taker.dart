import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


/*class Phototaker extends StatelessWidget {
  final String docID;
  Phototaker({this.docID});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: ImageCapture(docID: docID),
    );
  }
}
*/
/// Widget to capture and crop the image
class ImageCapture extends StatefulWidget {
  final String docID;
  ImageCapture({this.docID});
  createState() => _ImageCaptureState(docID: docID);
}

class _ImageCaptureState extends State<ImageCapture> {
  final String docID;
  _ImageCaptureState({this.docID});
  /// Active image file
  File _imageFile;

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    print(docID);
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: const Text(
          'Give Product Image',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.camera),
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(
                Icons.photo_library,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
              color: Colors.pink,
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Container(
                padding: EdgeInsets.all(32),
                 child: Image.file(_imageFile)
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.black,
                  child: Icon(Icons.crop),
                  onPressed: null,
                ),
                FlatButton(
                  color: Colors.white,
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Uploader(
                file: _imageFile,
                docID: docID,
              ),
            )
          ]
        ],
      ),
    );
  }
}

/// Widget used to handle the management of
class Uploader extends StatefulWidget {
  final File file;
  final String docID;
  Uploader({Key key, this.file , this.docID}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://kisanvikas-2020.appspot.com');

  StorageUploadTask _uploadTask;
  StorageTaskSnapshot snapshot;

   _startUpload() async{
    print(widget.docID);
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    String filePath = 'images/${widget.docID}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      
    });
  
    } 

    //Future<String> uploadImage(var imageFile ) async {
      //final FirebaseStorage storage = ;
    //StorageReference ref = storage.ref().child("/photo.jpg");
    //StorageUploadTask uploadTask = ref.putFile(imageFile);

    //var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    //url = dowurl.toString();

    //return url; }

  

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_uploadTask.isComplete)
                    Text('🎉🎉🎉completed',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            height: 2,
                            fontSize: 30)),
                  if (_uploadTask.isPaused)
                    FlatButton(
                      child: Icon(Icons.play_arrow, size: 50),
                      onPressed: _uploadTask.resume,
                    ),
                  if (_uploadTask.isInProgress)
                    FlatButton(
                      child: Icon(Icons.pause, size: 50),
                      onPressed: _uploadTask.pause,
                    ),

                    
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % ',
                    style: TextStyle(fontSize: 50),
                  ),
                ]);
          });
    } else {
      return FlatButton.icon(
          color: Colors.blue,
          label: Text('Upload to Firebase'),
          icon: Icon(Icons.cloud_upload),
          onPressed: _startUpload);
    }
  }
}
