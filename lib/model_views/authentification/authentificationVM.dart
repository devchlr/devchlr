
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/auth_service/register_service.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/authentifications/conditionnal_term.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
class AuthentificationVM extends BaseModel{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
  RegisterService registerService=RegisterService();
  UserChaliar? currentUser;
  UserChaliar? user;
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
  // void getUserData(String number)async{
  //   currentUser = await _storeService.getUser(number);
  //   print(currentUser?.name);
  //   notifyListeners();
  // }

  //verifier le code pin
  sendSmsOpt(String phoneNumber,BuildContext context){
    loading=true;
    notifyListeners();
    phone=phoneNumber;
    var verificationAuth= _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async{
        signInWithPhoneAuthCredential(credential, context);
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
      },
    );
    verificationAuth.then((value){

    });
  }

  confirmOPT(BuildContext context) async {
    String phoneCred= await sharedPreferenceService.getPhoneCred();
    PhoneAuthCredential phoneAuthCredential =
     PhoneAuthProvider.credential(verificationId: phoneCred, smsCode: pin!);
    signInWithPhoneAuthCredential(phoneAuthCredential,context);
  }

//function qui redirige vers la page OPT
  void goToNextSCreen(BuildContext context,String uid)async{
    bool isCommit= await sharedPreferenceService.setStartPreferencePage('/connexion');
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
        authCredential.user!.updateEmail(currentUser!.email!);
        authCredential.user!.updatePassword(currentUser!.password!);
        savedUser(context,authCredential);
      }

    } on FirebaseAuthException catch (e) {
      loading=false;
      notifyListeners();
      customShowSnackBar.initUserRequestAnimationError(context, '${e.message}');
    }
  }
  savedUser(BuildContext context,UserCredential authCredential){
    currentUser!.setUserId(authCredential.user!.uid);
    var checkifRegister= registerService.registerUser(currentUser!);
    checkifRegister.then((result){
      if(result!=null){
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
        goToNextSCreen(context,currentUser!.id!);
      }else{
        customShowSnackBar.showDialogError(context:context,titleDialog:'Erreur formulaire',errorDescription: 'Erreur lors de l\'enregistrement recommencer svp');
      }
    });

  }
}

