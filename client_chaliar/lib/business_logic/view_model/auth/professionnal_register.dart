import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/services/auth.dart';
import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
import 'package:client_chaliar/services/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:client_chaliar/services/dialog_service.dart';
import 'package:client_chaliar/services/fire_store_service.dart';

class ProfessionalRegisterViewModel extends BaseModel {
  // initialisation global variable
  final FirebaseAuthService auth = FirebaseAuthService();
  FirestoreService _firestoreService = FirestoreService();
  final AuthenticationService _authenticationService = AuthenticationService();
  final NavigationService _navigationService = NavigationService();
  final DialogService _dialogService = DialogService();
  UserChaliar _currentUser;
  bool obscureText = true;
  String iconAsset = SvgIcons.eye_close;
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordBis = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController societe = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController facturationAdress = TextEditingController();
  TextEditingController codePostal = TextEditingController();
  TextEditingController city = TextEditingController();
  String phone;

  //function to show password
  void showPasswor(value) {
    obscureText = value ? false : true;
    changeFieldIcon(obscureText);
    notifyListeners();
  }
  //change field icon asset
  void changeFieldIcon(value) {
    iconAsset = value ? SvgIcons.eye_close : SvgIcons.apple;
    notifyListeners();
  }
  //function check password is similary
  bool isSamePassword() {
    return password.text == passwordBis.text &&
        (password.text != '' && passwordBis.text != '');
  }

  //singup funtion
  Future singUp(BuildContext context)async{
    bool isSingUp=false;
    var user=await auth.createUserWithEmailAndPassword(email.text, password.text);
    if(user != null){
      _currentUser = UserChaliar(
          id: user.uid,
          email: email.text,
          userRole: 'professionnel',
          name: name.text,
          surname: surname.text,
        city: city.text,
        codePostal: codePostal.text,
        street: street.text,
        phone: phoneNumber.text,
        facturationAdresse: facturationAdress.text
      );
      await _firestoreService.createUser(_currentUser);
      isSingUp=true;
    }else{
      print('user not registered');
    }
    if(isSingUp){
      Navigator.pushReplacementNamed(context, '/singin');
    }
  }


  Future registerUser(
      {@required String email,
        @required String password,
        @required String name,
        @required String surname}) async {
    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      name: name,
      surname: surname,
    );
    setBusy(false);
    if (result is bool) {
      if (result) {
        print('/singin');
      } else {
        print('Sign Up Failure');
        print('General sign up failure. Please try again later');
      }
    } else {
      print('Sign Up Failure');
    }
  }
}
