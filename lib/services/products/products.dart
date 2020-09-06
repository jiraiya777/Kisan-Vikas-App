import 'package:flutter/material.dart';
import 'package:kisanVikasApp/services/products/input_Product.dart';
import 'package:kisanVikasApp/services/products/allProduct.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.lightGreen[600],
      title: const Text('Farming Product' ,
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
                title: Text('Add Product',
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
                                InputProduct()
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
                title: Text('View Products',
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
                                AllProducts())
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