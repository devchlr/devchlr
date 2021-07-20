import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenMV extends BaseModel{
  FirebaseAuth _auth=FirebaseAuth.instance;
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();

   nextScreen(BuildContext context)async{
    var user=_auth.currentUser;
    if(user==null){
      String nextPage= await sharedPreferenceService.getStartPreferencePage();
      print(nextPage=='');
      Timer(Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, nextPage==''?'/tuto':nextPage));
    }else{
      Timer(Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, '/pre_commande'));
    }
  }
}