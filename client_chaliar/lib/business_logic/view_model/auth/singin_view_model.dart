import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/services/auth.dart';
import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
import 'package:client_chaliar/services/navigation_service.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:client_chaliar/services/dialog_service.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:session/session.dart';

class SingInViewModel extends BaseModel{
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;
  String iconAsset = SvgIcons.eye_close;
  //function to show password
  void showPasswor(value) {
    obscureText = value ? false : true;
    changeFieldIcon(obscureText);
    notifyListeners();
  }
  void changeFieldIcon(value) {
    iconAsset = value ? SvgIcons.eye_close : SvgIcons.apple;
    notifyListeners();
  }

  void singInUser(BuildContext context)async{
    var result = await auth.signInWithEmailAndPassword(email.text, password.text);
    if(result != null){
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ConditionGeneraleScreen(user: result)));
      // Navigator.of(context).pushNamedAndRemoveUntil('/condition_generale', (Route<dynamic> route) => false);
  }else{
      print('user not registered');
    }
  }

}