
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/fire_store_service.dart';
// import 'package:flutter_app/ui/views/auth/preCondition_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/authentifications/conditionnal_term.dart';
import 'package:flutter_app/ui/views/authentifications/pre_contionnal_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
class AuthentificationVM extends BaseModel{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
  UserChaliar? currentUser;
  String? phone;
  String? pin;
  var _verificationId;
  bool loading=false;
  bool? isGetOpt;
  String? uid;
  BuildContext? context;
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();


  void signInWithPhoneAuthCredentialD(
      PhoneAuthCredential phoneAuthCredential,BuildContext context){
    loading=true;
    notifyListeners();
    // try {
      _firebaseAuth.signInWithCredential(phoneAuthCredential).then((authCredential){
        if(authCredential.user != null){
          loading=false;
          notifyListeners();
          customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
          var user=_firebaseAuth.currentUser;
          goToNextSCreen(context,user!.uid);
        }
      });
    // } on FirebaseAuthException catch (e) {
    //   loading=false;
    //   notifyListeners();
    //   customShowSnackBar.initUserRequestAnimationError(context, '${e.message}');
    //   notifyListeners();
    // }
  }
  //function function qui recupere le numero du user
  void getUserData(String number)async{
    currentUser = await _storeService.getUser(number);
    print(currentUser?.name);
    notifyListeners();
  }

  //verifier le code pin
  sendSmsOpt(String phoneNumber,BuildContext context){
    loading=true;
    notifyListeners();
    phone=phoneNumber;
    var verificationAuth= _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async{
      var authCredential=  await _firebaseAuth.signInWithCredential(credential);
          if(authCredential.user != null){
            loading=false;
            notifyListeners();
            customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
            goToNextSCreen(context,uid!);
          }else{
            print('error');
            return;
          }
      },
      verificationFailed: (verificationFailed){
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, '${verificationFailed.message}');
        notifyListeners();
      },
      codeSent: (verificationId, resendingToken)async{
        bool isAddPhoneCred=await sharedPreferenceService.setPhoneCred(verificationId);
        if(isAddPhoneCred)print('dans code send ${_verificationId}');
        _verificationId = verificationId;

      },
      codeAutoRetrievalTimeout: (String verificationId){
        verificationId = verificationId;
        print(verificationId);
        print("Timout");
      },
    );
    verificationAuth.then((value){
      print('oki');
    });
  }

  confirmOPT(BuildContext context) async {
    print('vriId ici confirm opt: ${_verificationId}');
    String phoneCred= await sharedPreferenceService.getPhoneCred();
    PhoneAuthCredential phoneAuthCredential =
     PhoneAuthProvider.credential(verificationId: phoneCred, smsCode: pin!);
    signInWithPhoneAuthCredential(phoneAuthCredential,context);
  }

//function qui redirige vers la page OPT
  void goToNextSCreen(BuildContext context,String uid)async{
    bool isCommit= await sharedPreferenceService.setStartPreferencePage('/singin');
    if(isCommit){
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ConditionGeneraleScreen(userId:uid)));
    }
  }



  String? verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential,BuildContext context) async {
    loading=true;
    notifyListeners();
    try {
      final authCredential =
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);

      if(authCredential.user != null){
          loading=false;
          notifyListeners();
          customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
          var user=_firebaseAuth.currentUser;
          goToNextSCreen(context,uid!);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }

    } on FirebaseAuthException catch (e) {
      loading=false;
      notifyListeners();
      customShowSnackBar.initUserRequestAnimationError(context, '${e.message}');
    }
  }




}