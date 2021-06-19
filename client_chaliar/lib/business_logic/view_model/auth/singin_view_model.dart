import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:client_chaliar/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingInViewModel extends BaseModel{
  FirestoreService _storeService = FirestoreService();
  BuildContext context;
  UserChaliar user;
  String phone;
  void verifyUserAccount()async{
    var userResult;
    if(phone!=null) userResult = await _storeService.getUser(phone);
    if(userResult==null){


      print('user not exist create user account please');
    }else{
      if(userResult=='404'){
        print('user not exist create user account please');
      }else{
        user=userResult;
        getOPTScreen(context);
      }
    }
  }
  void getOPTScreen(context) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PhoneOptValidateScreen(phone:user.phone)));
  }

  void showDialog(BuildContext context,String title,Widget description){
    AlertDialog(
      title:  Text(title),
      content: description,
    );
  }
}