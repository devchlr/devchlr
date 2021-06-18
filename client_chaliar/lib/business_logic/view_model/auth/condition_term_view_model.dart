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
// import 'package:session/session.dart';

class ConditionnalTermViewModel extends BaseModel{
  UserChaliar user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuthService auth = FirebaseAuthService();
  String surname;
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
     var user = await _firebaseAuth.currentUser;
     print(user);
}


}