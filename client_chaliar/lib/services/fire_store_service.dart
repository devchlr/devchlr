import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(UserChaliar user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future getUser(String uid) async {
      // var userData = await _usersCollectionReference.doc(uid).get();
      // var  docSnap =userData;
      // // var user= UserChaliar.fromData(docSnap.data());
      // print('user : ${docSnap.data()}');
      // return docSnap.data();
      DocumentSnapshot doc = await _usersCollectionReference.doc(uid).get();
      if(doc.exists) { // this will check availability of document
       return doc.data();
      }else{
        return null;
      }
  }
}
