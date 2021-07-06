import 'dart:async';

import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/constants/type_user.dart';
import 'package:flutter_app/models/user.dart';
// import 'package:flutter_app/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/fire_auth_service.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
import 'package:uuid/uuid.dart';

class RegisterScreenVM extends BaseModel{
   final FirebaseAuth auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  FireAuthService _fireAuthService=FireAuthService();
  // final AuthenticationService _authenticationService = AuthenticationService();
  // final NavigationService _navigationService = NavigationService();
  // final DialogService _dialogService = DialogService();

  UserChaliar? _currentUser;
  bool obscureText = true;
  String? phone;
  String iconAsset = SvgIcons.eye_close;
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordBis = TextEditingController();
  TextEditingController siret = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController societe = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController facturationAdress = TextEditingController();
  TextEditingController codePostal = TextEditingController();
  TextEditingController city = TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  TextEditingController password_confirm = TextEditingController();
  bool password_obscure=true;
  bool confirm_password_obscure=true;

  bool validate_surname=false;
   bool validate_name=false;
   bool validate_email=false;
   bool validate_password=false;
   bool validate_passwordBis=false;
   bool validate_phoneNumber=false;
   bool validate_facturationAdress=false;
   bool validate_codePostal=false;
   bool validate_city=false;
   bool validate_societe=false;
   bool validate_street=false;

   bool loading=false;

  void updatePasswordIcon(bool val){
    password_obscure=password_obscure?false:true;
    notifyListeners();
  }
  void updateConfirmPasswordIcon(bool val){
    confirm_password_obscure=confirm_password_obscure?false:true;
    notifyListeners();
  }

  void validateSurname(){
    if (surname.text == null || surname.text.isEmpty||surname.text.length<2) {
       validate_surname=true;
    }else{
      validate_surname=false;
    }
    notifyListeners();
  }
   void validateName(){
     if (name.text == null || name.text.isEmpty||name.text.length<2) {
       validate_name=true;
     }else{
       validate_name=false;
     }
     notifyListeners();
   }
   void validateEmail(){
     validate_email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)?false:true;
     notifyListeners();
   }

   void validatePassord(){
     validate_password=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password.text)?false:true;
     notifyListeners();
   }

   void validatePasswordBis(){
     validate_passwordBis=(password.text==password_confirm.text)?false:true;
     notifyListeners();
   }

   void validatePhoneNumber(){
     if (phone == null || phone!.isEmpty||phone!.length<9) {
       validate_phoneNumber=true;
     }else{
       validate_phoneNumber=false;
     }
     notifyListeners();
   }
   void validateAdresseFacturation(){
     if (facturationAdress.text == null || facturationAdress.text.isEmpty||facturationAdress.text.length<2) {
       validate_facturationAdress=true;
     }else{
       validate_facturationAdress=false;
     }
     notifyListeners();
   }
   void validateCodePostal(){
     if (codePostal.text == null || codePostal.text.isEmpty||codePostal.text.length<2) {
       validate_codePostal=true;
     }else{
       validate_codePostal=false;
     }
     notifyListeners();
   }

   void validateCity(){
     if (city.text == null || city.text.isEmpty||city.text.length<2) {
       validate_city=true;
     }else{
       validate_city=false;
     }
     notifyListeners();
   }

   void validateStreet(){
     if (street.text == null || street.text.isEmpty||street.text.length<2) {
       validate_street=true;
     }else{
       validate_street=false;
     }
     notifyListeners();
   }

   void validateSociete(){
     if (societe.text == null || societe.text.isEmpty||societe.text.length<2) {
       validate_societe=true;
     }else{
       validate_societe=false;
     }
     notifyListeners();
   }


  Future<String> validatorPartInformation() async {
    if (validate_email) {
      var user = await _firestoreService.getUserByFieldValue('email',email.text);

      if (user == null) {
        print('ICI');
        if (!validate_surname&&!validate_name&&!validate_codePostal&&!validate_city&&!validate_facturationAdress) {
          return '200';
        }else{
          return '404';
        }
      }else{
        return '404';
      }
    } else {
      return '404';
    }
  }
  Future<String> validatorProInformation() async {
    if (validate_email) {
       var user = await _firestoreService.getUserByFieldValue('email',email.text);
      if (user == null) {
        if (!validate_societe&&!validate_street&&!validate_surname&&!validate_name&&!validate_codePostal&&!validate_city&&!validate_facturationAdress) {
          return '200';
        }else{
          return '400';
        }
      }else {
        return '404';
      }
    } else {
      return '404';
    }
  }
  void createUser(BuildContext context, String typeUser) async {
      loading=true;
      notifyListeners();
    if (typeUser == TypeUser.particulier) {
      if (await validatorPartInformation() == '404') {
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent être correctement renseignés');
      } else if (await validatorPartInformation() == '200') {
       await _fireAuthService.registerByEmailandPassword(email.text, password.text);
       var userCredential =await auth.currentUser;
        _currentUser =  UserChaliar(
          id: userCredential?.uid,
          email: email.text,
          userRole: TypeUser.particulier,
          name: name.text,
          surname: surname.text,
          phone: phone,
          facturationAdresse: facturationAdress.text,
          codePostal: codePostal.text,
          city: city.text,
          password: password.text
        );
        await _firestoreService.createUser(_currentUser!);
       loading=false;
       notifyListeners();
       getOPTScreen(context,phone,_currentUser?.id);
      }
    } else if (typeUser == TypeUser.professionnel) {
      if (await validatorPartInformation() == '404') {
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent être correctement renseignés');
      } else if (await validatorPartInformation() == '200') {
        await _fireAuthService.registerByEmailandPassword(email.text, password.text);
        var userCredential =await auth.currentUser;
        print('uid:${userCredential?.uid}');
        _currentUser =  UserChaliar(
            id: userCredential?.uid,
            email: email.text,
            userRole: TypeUser.professionnel,
            name: name.text,
            surname: surname.text,
            phone: phone,
            facturationAdresse: facturationAdress.text,
            codePostal: codePostal.text,
            city: city.text,
            siret: siret.text,
            societe: societe.text,
            password: password.text
        );
        await _firestoreService.createUser(_currentUser!);
        loading=false;
        notifyListeners();
        getOPTScreen(context,phone,_currentUser?.id);
      }
    }
  }

  void getOPTScreen(context,String? phoneNumber,String? uid) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PhoneOptValidateScreen(phone: phoneNumber,uid:uid ,)));
  }

  void googleRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion google server lost');
  }

  void facebookRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion facebook server lost');
  }

  void appleRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion apple server lost');
  }
}