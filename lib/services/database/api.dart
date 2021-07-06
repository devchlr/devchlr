

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseApi{

  FirebaseFirestore _db=FirebaseFirestore.instance;
  final String? path;
  CollectionReference? ref;

  //constructor
  DataBaseApi(this.path){
    ref=_db.collection(path!);
  }

  //get all data collection
  Future getDataCollection() async{
    var doc = await ref!.get();
    if(doc==null){
      return null;
    }else{
      return doc.docs.first.data();
    }
  }

  //stream data collection
  Stream<QuerySnapshot> streamDataCollection(){
    return ref!.snapshots();
  }

  //get document by id
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref!.doc(id).get();
  }

  Future getDocumentByFieldValue(String field,String value) async{
    var doc = await ref!.where(field,isEqualTo: value).limit(1).get();
    if(doc==null){
      return null;
    }else{
      return doc.docs.first.data();
    }
  }

  //delete document
  Future<void> removeDocument(String id){
    return ref!.doc(id).delete();
  }

  //add new document
  Future<DocumentReference> addDocument(Map data) {
    return ref!.add(data);
  }

  //update data
  Future<void> updateDocument(Map data , String id) {
    return ref!.doc(id).set(data) ;
  }
}