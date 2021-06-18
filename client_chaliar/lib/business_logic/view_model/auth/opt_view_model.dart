import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:client_chaliar/services/firebase_auth_service.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OPTValidationViewModel extends BaseModel{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuthService auth = FirebaseAuthService();
  FirestoreService _storeService = FirestoreService();
  UserChaliar currentUser;
  String phone;
  String pin;
  String _verificationId;
  bool showLoading=false;
  bool isGetOpt;
  BuildContext context;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        showLoading = false;
      if(authCredential?.user != null){
        goToNextSCreen(context);
      }

    } on FirebaseAuthException catch (e) {
        print(e.message);
    }
    notifyListeners();
  }
  //function function qui recupere le numero du user
  void getUserData(String number)async{
    currentUser = await _storeService.getUser(number);
    print(currentUser.name);
    notifyListeners();
  }
  //verifier le code pin
  void sendSmsOpt(String phoneNumber)async{

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {

        //signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {

          print(verificationFailed.message);
      },
      codeSent: (verificationId, resendingToken) async {

          _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
         isGetOpt=true;
  }
  void confirmOPT() async {
  PhoneAuthCredential phoneAuthCredential =
  PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: pin);
  signInWithPhoneAuthCredential(phoneAuthCredential);
}

//function qui redirige vers la page OPT
void goToNextSCreen(BuildContext context){
  Navigator.push(context,
      new MaterialPageRoute(
          builder: (BuildContext context) =>
          new ConditionGeneraleScreen()));
  // Navigator.of(context).pushNamedAndRemoveUntil('/condition_generale', (Route<dynamic> route) => false);

  }
}