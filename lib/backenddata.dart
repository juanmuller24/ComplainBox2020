
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complainbox/uid.dart';

class BackendData{
final String uid ;
 BackendData({this.uid});

  final CollectionReference detail = Firestore.instance.collection('detial');


  Future updateUserData(String complain)async{
    return await detail.document(uid).setData({

            'complain':complain,

    });
  }


//  List<detail> _listFromSnapshot(QuerySnapshot snapshot){
//    return snapshot.documents.map((doc){
//      return Uid(
//        complain: doc.data['complain']??0,
//      );
//    }).toList();
//  }
//
//
//  Stream<List<detail>> get  details {
//    return detail.snapshots()
//        .map(_listFromSnapshot);

}