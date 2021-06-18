// import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
// import 'package:client_chaliar/services/auth.dart';
// import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
// import 'package:client_chaliar/services/navigation_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:client_chaliar/constants/iconList.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:client_chaliar/services/dialog_service.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:session/session.dart';

class ConditionnalTermViewModel extends BaseModel{
  UserChaliar user;
  final _auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuthService auth = FirebaseAuthService();
  String surname;
  bool isOkay=false;
  //function to show password
   Future<bool> isSingInUser()async{
    var result = await auth.currentUser();
    var user= await _firestoreService.getUser(result.uid);
   print(user);
    if(result != null){
      surname = user.surname;
    }
    return true;
  }

  //function qui retourne les information du users;
void getUser()async{
  // _firebaseAuth.authStateChanges()
  //     .listen((User user) {
  // if (user == null) {
  // print('User is currently signed out!');
  // } else {
  // print('User is signed in!');
  // }
  // });
  // print('userResult');
  //    var userResult = await _firebaseAuth.idTokenChanges()
  //        .listen((User user) {
  //      if (user == null) {
  //        print('User is currently signed out!');
  //      } else {
  //        print('User is signed in!');
  //      }
  //    });
  //    print(userResult);
  //    notifyListeners();
     isOkay=true;
     notifyListeners();
}


}