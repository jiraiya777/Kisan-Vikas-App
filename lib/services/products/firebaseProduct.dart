import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productID;
  String productName;
  String sellerName;
  String sellerAddress;
  String sellerMobile;
  int price;
  String description;


  Product(String productID , String productName , String sellerName , String sellerAddress  , String sellerMobile
   , int price, String description)
  {
    this.productID = productID;
    this.productName = productName;
    this.sellerName = sellerName;
    this.sellerAddress = sellerAddress;
    this.sellerMobile = sellerMobile;
    this.price = price;
   // this.seasonRecords = seasonRecords;
    this.description = description;
  }


}


class FirebaseProduct{
// collection reference
  final CollectionReference allProducts = Firestore.instance.collection('AllProductList');
  //final CollectionReference allRecords = Firestore.instance.collection('AllRecordList');
  



  Future<void> addProduct(Product p1) async {
    return await allProducts.document().setData({
      //'productID' = p1.productID,
      'productName': p1.productName,
      'price': p1.price,
      'description': p1.description,
      'sellerName': p1.sellerName,
      'sellerMobile': p1.sellerMobile,
      'sellerAddress': p1.sellerAddress,
      
    });
    
  }

}
