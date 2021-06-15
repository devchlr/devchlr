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

class RegisterViewModel extends BaseModel {
  // Firebase.initializeApp();
  final FirebaseAuthService auth = FirebaseAuthService();
  final AuthenticationService _authenticationService = AuthenticationService();
  final NavigationService _navigationService = NavigationService();
  final DialogService _dialogService = DialogService();
  bool obscureText = true;
  String iconAsset = SvgIcons.eye_close;
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordBis = TextEditingController();
  String phone;

  void showPasswor(value) {
    obscureText = value ? false : true;
    changeFieldIcon(obscureText);
    notifyListeners();
  }

  void changeFieldIcon(value) {
    iconAsset = value ? SvgIcons.eye_close : SvgIcons.apple;
    notifyListeners();
  }

  bool isSamePassword() {
    return password.text == passwordBis.text &&
        (password.text != '' && passwordBis.text != '');
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
        // await _dialogService.showDialog(
        //   title: 'Sign Up Failure',
        //   description: 'General sign up failure. Please try again later',
        // );
      }
    } else {
      print('Sign Up Failure');
      // print('General sign up failure. Please try again later');
      // await _dialogService.showDialog(
      //   title: 'Sign Up Failure',
      //   description: result,
      // );
    }
  }
  // print(email.text);
  // print(password.text);
}
