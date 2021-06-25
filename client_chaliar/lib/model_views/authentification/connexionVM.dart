import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/services/fire_store_service.dart';
// import 'package:flutter_app/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';

class AuthentificationConnexionVM extends BaseModel{
  FirestoreService _storeService = FirestoreService();
  BuildContext? context;
  var user;
  String? phone;

  verifyUserAccount()async{
    var userResult;
    if(phone!=null) userResult = await _storeService.getUser(phone!);
    if(userResult==null){
      print('user not exist create user account please');
    }else{
      if(userResult=='404'){
        print('user not exist create user account please');
      }else{
        user=userResult;
        print(userResult['phone']);
        getOPTScreen(context);
      }
    }
  }
  void getOPTScreen(context) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PhoneOptValidateScreen(phone:user['phone'])));
  }

  void showDialog(BuildContext context,String title,Widget description){
    AlertDialog(
      title:  Text(title),
      content: description,
    );
  }
}