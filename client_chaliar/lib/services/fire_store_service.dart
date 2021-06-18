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
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return UserChaliar.fromData(userData.data());
    } catch (e) {
      return '404';
    }
  }
  // Future getUserByEmail(String email) async{
  //   await _usersCollectionReference.where('email', isEqualTo: email).get().then((users){
  //     return UserChaliar.fromData(users.data());
  //   }).catchError((onError)=>onError);
  //
  // }
}
