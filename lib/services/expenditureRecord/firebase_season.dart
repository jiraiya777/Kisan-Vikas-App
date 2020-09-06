import 'package:cloud_firestore/cloud_firestore.dart';

class SeasonRecord {
  
   String userId;
   String seasonId;
   String description;
   int money;
   int type;
   String date; 
   
   SeasonRecord(String userId ,String seasonId , String description ,int money ,int type ,String date )
   {
     this.userId = userId;
     this.seasonId = seasonId;
     this.date = date;
     this.description = description;
     this.money = money;
     this.type = type;
   }



}

class Season {
  String name;
  String userid;
  String createDate;
  String crop;
  int eMoney;
  int iMoney;
  //List<SeasonRecord> seasonRecords = new List<SeasonRecord>();

  Season(String name , String crop , String createDate  ,int iMoney , int eMoney, String userid)
  {
    this.name = name;
    this.crop = crop;
    this.createDate = createDate;
    this.iMoney = iMoney;
    this.eMoney = eMoney;
   // this.seasonRecords = seasonRecords;
    this.userid = userid;
  }


}


class FirebaseSeason{
// collection reference
  final CollectionReference allSeasons = Firestore.instance.collection('AllSeasonList');
  final CollectionReference allRecords = Firestore.instance.collection('AllRecordList');
  



  Future<void> addSeason(Season s1) async {
    return await allSeasons.document().setData({
      'name': s1.name,
      'crop': s1.crop,
      'createDate': s1.createDate,
      'iMoney': s1.iMoney,
      'eMoney': s1.eMoney,
      'userid': s1.userid,
      
    });
    
  }

  Future<void> addRecord(SeasonRecord r1) async {
    return await allRecords.document().setData({
      'description': r1.description,
      'money': r1.money,
      'date': r1.date,
      'type': r1.type,
      'sectionId': r1.seasonId,
      'userId': r1.userId,
      
    });
    
  }
  Future<void> updateExpenditure(String currentDocumentID ,int emoney) async {
    return await allSeasons.document(currentDocumentID)
              .updateData({
                'eMoney' : emoney
                 
              });
  }
  Future<void> updateIncome(String currentDocumentID ,int imoney) async {
    return await allSeasons.document(currentDocumentID)
      .updateData({
      'iMoney' : imoney
    
    });
}  
}



