import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/services/fire_auth_service.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/orders/home_order_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';

class AuthentificationConnexionVM extends BaseModel{
  FirestoreService _storeService = FirestoreService();
  FireAuthService _fireAuthService = FireAuthService();
  BuildContext? context;
  var user;
  bool password_obscure=true;
  String? phone;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  bool loading=false;
  bool inputVerification(){
    if(phoneNumber.text==null || phoneNumber.text.isEmpty){
      return false;
    }
    if(password.text==null || password.text.isEmpty){
      return false;
    }
    return true;
  }

  void singIn(BuildContext context)async{
    loading=true;
    notifyListeners();
    if(inputVerification()){
      var userResult=await _storeService.getUserByFieldValue('phone',phone!);
      print('resulta $userResult');
      if(userResult==null){
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, 'user not exist create user account please');
        print('erro 1');
      }else{
           // customShowSnackBar.initUserRequestAnimation(context);
          _fireAuthService.signInWithEmailAndPassword(userResult['email'], password.text);
          loading=false;
          notifyListeners();
          getOPTScreen(context);
        }
    }else{
      loading=false;
      notifyListeners();
      customShowSnackBar.initUserRequestAnimationError(context, 'tous les champs doivent etres renseigne');
    }
  }

  verifyUserAccount(BuildContext context)async{
  }
  void getOPTScreen(context) async{
    await sharedPreferenceService.setStartPreferencePage('/singin').then((value){
      if(value){
        Navigator.push(context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                new PreCommandeScreen()));
      }
    }
    );
  }

  void updatePasswordIcon(bool val){
    password_obscure=password_obscure?false:true;
    notifyListeners();
  }
}