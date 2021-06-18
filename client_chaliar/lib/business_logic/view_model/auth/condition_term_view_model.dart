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
  UserChaliar currentUser;
  final _auth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
  final FirebaseAuthService auth = FirebaseAuthService();
  //function to show password
   Future<bool> isSingInUser()async{
     bool result=false;
    var user = await FirebaseAuth.instance.currentUser;
   print(user);
    if(result != null){
      result= true;
    }
    return result;
  }

  //function qui retourne les information du users;
  void getUserData(String number)async{
    currentUser = await _storeService.getUser(number);
    print(currentUser.name);
    notifyListeners();
  }


}