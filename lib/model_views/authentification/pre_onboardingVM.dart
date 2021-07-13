import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/fire_store_service.dart';

class ConditionnalTermViewModel extends BaseModel{
  FirestoreService firestoreService = FirestoreService();
  UserChaliar? currentUser;
  final _auth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
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
  Future<dynamic> getUserData(String number)async{
    var userResult;
    if(number!=null) userResult = await _storeService.getUser(number);
    userResult= await _storeService.getUser(number);
    print(userResult);
    return userResult;
  }

  getUserD(String userId){
    var user = _auth.currentUser;
    print(user!.uid);
    return firestoreService.getUserFuture(userId);
  }

  getHomePage(BuildContext context, String userEmail, String userPassword){

    var auth=_auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
    auth.then((value) {
      if(value!=null){
        Navigator.pushReplacementNamed(
            context, '/pre_commande');
      }
    });
  }
}