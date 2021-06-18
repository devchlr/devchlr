import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:flutter/material.dart';

class SingInViewModel extends BaseModel{
  FirestoreService _firestoreService = FirestoreService();
  UserChaliar user;
  String phone;
  void verifyUserAccount()async{
    var userResult = await _firestoreService.getUser(phone);
    if(userResult==null){
      print('user not exist create user account please');
    }else{
      print('user : $userResult');
    }

  }




  //
  // List<TextEditingController> controllers = <TextEditingController>[
  //   new TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController()
  // ];
  //
  //
  //
  // //function to show password
  // void showPasswor(value) {
  //   obscureText = value ? false : true;
  //   changeFieldIcon(obscureText);
  //   notifyListeners();
  // }
  // void changeFieldIcon(value) {
  //   iconAsset = value ? SvgIcons.eye_close : SvgIcons.apple;
  //   notifyListeners();
  // }
  //
  // void singInUser(BuildContext context)async{
  //   var result = await auth.signInWithEmailAndPassword(email.text, password.text);
  //   if(result != null){
  //     Navigator.push(
  //         context,
  //         new MaterialPageRoute(
  //             builder: (BuildContext context) =>
  //             new ConditionGeneraleScreen()));
  //     // Navigator.of(context).pushNamedAndRemoveUntil('/condition_generale', (Route<dynamic> route) => false);
  // }else{
  //     print('user not registered');
  //   }
  // }

}