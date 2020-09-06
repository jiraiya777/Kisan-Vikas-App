import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kisanVikasApp/stores/login_store.dart';

import 'package:kisanVikasApp/widgets/sidebar.dart';
import 'package:kisanVikasApp/services/vidoes/videos.dart';
import 'package:kisanVikasApp/services/vidoes/show-video.dart';
import 'package:kisanVikasApp/services/products/products.dart';
import 'package:kisanVikasApp/services/weather/weather.dart';
import 'package:kisanVikasApp/services/expenditureRecord/expenditure.dart';
import 'package:kisanVikasApp/services/cropdetails/crop_home.dart';

List<String> serviceImage = [
  'assets/img/buy.jpeg',
  'assets/img/wheather.jpeg',
  'assets/img/images.jpeg',
  'assets/img/crop123.jpg',
  'assets/img/calender.png',
  'assets/img/setting.jpeg'
];

List<String> serviceLabel = [
  'Buy Product',
  'Weather Report',
  'Videos',
  'Crop Query',
  'Season Calender',
  'Setting'
];

List<String> serviceLocation = [
  'Videos()',
  'Videos()',
  'Videos()',
  'Videos()',
  'Videos()',
  'Videos()',
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 
  Widget cardsWidget(itemIndex) => Container(
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Colors.white,
        ), 
        child : GestureDetector(
                           
                            onTap: (){
                              if(itemIndex == 0){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Products())
                                ,
                              );
                              }
                              else if(itemIndex == 1){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Weather())
                                ,
                              );
                              }
                              else if(itemIndex == 2){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                Video12())
                                ,
                              );
                              }
                              else if(itemIndex == 3){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                CropQuery()
                                )
                                ,
                              );
                              }
                              else if(itemIndex == 4){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => 
                                CreateAndViewSeason()
                                )
                                ,
                              );
                              }
                              
                              
                            },
                           
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage(serviceImage[itemIndex]),
                radius: 30,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                serviceLabel[itemIndex],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          
          ],
        ),
        ),
  );
      

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __){
      return Scaffold(
          drawer: NavDrawer(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightGreen[600],
            title: const Text('Kisan Vikas App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  loginStore.signOut(context);
                },
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/background.jpg'),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.6,
                  minChildSize: 0.6,
                  maxChildSize: 0.8,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(        
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.deepOrangeAccent,
                        //color: Colors.white
                      ),
                      
                          
                            child: GridView.builder(
                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2),
                             controller: scrollController,
                             itemCount: 6,
                             itemBuilder: (BuildContext context, int index) {
                             return cardsWidget(index);
                             }
                            ),
                           
                        
                      );
                      },
                  
              
           ) ,
                  
            ],
          )
          );
     }
    );
  }
}
