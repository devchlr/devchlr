import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/constants/type_user.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
// import 'package:flutter_app/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:uuid/uuid.dart';

class RegisterScreenVM extends BaseModel{
  var uuid = Uuid();
  // final FirebaseAuthService auth = FirebaseAuthService();
  FirestoreService _firestoreService = FirestoreService();
  // final AuthenticationService _authenticationService = AuthenticationService();
  // final NavigationService _navigationService = NavigationService();
  // final DialogService _dialogService = DialogService();

  UserChaliar? _currentUser;
  bool obscureText = true;
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



  Future<String> validatorPartInformation() async {
    if (email.text == null || email.text.isEmpty) {
      return '404';
    } else {
      var user = await _firestoreService.getUser(phoneNumber.text);
      if (user == null) {
        return '200';
      }
    }
    if (surname.text == null || surname.text.isEmpty) {
      return '404';
    }
    if (name.text == null || name.text.isEmpty) {
      return '404';
    }
    if (codePostal.text == null || codePostal.text.isEmpty) {
      return '404';
    }
    if (city.text == null || city.text.isEmpty) {
      return '404';
    }
    if (facturationAdress.text == null || facturationAdress.text.isEmpty) {
      return '404';
    }
    return '200';
  }
  Future<String> validatorProInformation() async {
    if (email.text == null || email.text.isEmpty) {
      return '404';
    } else {
      var user = await _firestoreService.getUser(phoneNumber.text);
      if (user == null) {
        return '200';
      }
    }
    if (surname.text == null || surname.text.isEmpty) {
      return '404';
    }
    if (name.text == null || name.text.isEmpty) {
      return '404';
    }
    if (codePostal.text == null || codePostal.text.isEmpty) {
      return '404';
    }
    if (city.text == null || city.text.isEmpty) {
      return '404';
    }
    if (facturationAdress.text == null || facturationAdress.text.isEmpty) {
      return '404';
    }
    if (societe.text == null || societe.text.isEmpty) {
      return '404';
    }
    return '200';
  }
  void createUser(BuildContext context, String typeUser) async {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 50,
    //     content:  Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text('Creation de l\'utilisateur en cours...',style: AppTextStyle.appBarHeader(
    //           color: ChaliarColors.whiteColor,
    //         ),),
    //         SizedBox(height: 20,),
    //         CircularProgressIndicator(
    //           backgroundColor: ChaliarColors.primaryColors,
    //           color: ChaliarColors.whiteColor,
    //         )
    //       ],
    //     ),
    //   ),
    // );

    initUserRequestAnimation(context);
    if (typeUser == TypeUser.particulier) {
      if (await validatorPartInformation() == '404') {
        initUserRequestAnimationError(context, 'Tous les champs doivent être renseignés');
      } else if (await validatorPartInformation() == '200') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 50,
            content:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Création du compte en cours...',style: AppTextStyle.appBarHeader(
                  color: ChaliarColors.whiteColor,
                ),),
                SpinKitCubeGrid(
                  color: Colors.blueAccent,
                  size: 50.0,
                )
              ],
            ),
          ),
        );
        _currentUser =  UserChaliar(
          id: phoneNumber.text,
          email: email.text,
          userRole: TypeUser.particulier,
          name: name.text,
          surname: surname.text,
          phone: phoneNumber.text,
          facturationAdresse: facturationAdress.text,
          codePostal: codePostal.text,
          city: city.text,
        );
        await _firestoreService.createUser(_currentUser!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.transparent,
              elevation: 50,
              content:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check,size: 40,color: Colors.green,),
                  Text('Utilisateur crée avec sucess',style: AppTextStyle.appBarHeader(
                      color: Colors.white,
                      size: 14.0
                  ),),
                ],
              )
          ),
        );
        getOPTScreen(context,phoneNumber.text);
      }
    } else if (typeUser == TypeUser.professionnel) {
      if (await validatorPartInformation() == '404') {
        initUserRequestAnimationError(context, 'Tous les champs doivent être renseignés');
      } else if (await validatorPartInformation() == '200') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 50,
            content:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Création du compte en cours...',style: AppTextStyle.appBarHeader(
                  color: ChaliarColors.whiteColor,
                ),),
                SpinKitCubeGrid(
                  color: Colors.blueAccent,
                  size: 50.0,
                )
              ],
            ),
          ),
        );
        _currentUser = UserChaliar(
            id: phoneNumber.text,
            email: email.text,
            userRole: TypeUser.professionnel,
            name: name.text,
            surname: surname.text,
            phone: phoneNumber.text,
            facturationAdresse: facturationAdress.text,
            codePostal: codePostal.text,
            city: city.text,
            siret: siret.text,
            societe: societe.text
        );
        await _firestoreService.createUser(_currentUser!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.transparent,
              elevation: 50,
              content:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check,size: 40,color: Colors.green,),
                  Text('Utilisateur crée avec sucess',style: AppTextStyle.appBarHeader(
                      color: Colors.white,
                      size: 14.0
                  ),),
                ],
              )
          ),
        );
        getOPTScreen(context,phoneNumber.text);
      }
    }

  }
  void getOPTScreen(context,String? phoneNumber) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PhoneOptValidateScreen(phone: phoneNumber)));
  }

  void googleRegister(BuildContext context){
    initUserRequestAnimation(context);
    initUserRequestAnimationError(context, 'connexion google server lost');
  }

  void facebookRegister(BuildContext context){
    initUserRequestAnimation(context);
    initUserRequestAnimationError(context, 'connexion facebook server lost');
  }
  void appleRegister(BuildContext context){
    initUserRequestAnimation(context);
    initUserRequestAnimationError(context, 'connexion apple server lost');
  }

  void initUserRequestAnimationError(BuildContext context, String errorLabel){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 50,
          content:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.cancel,size: 40,color: Colors.red,),
              SizedBox(height: 20,),
              Text(errorLabel,style: AppTextStyle.appBarHeader(
                  color: Colors.white,
                  size: 14.0
              ),),
            ],
          )
      ),
    );
  }

  void initUserRequestAnimation(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 50,
        content:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Patienter...',style: AppTextStyle.appBarHeader(
              color: ChaliarColors.whiteColor,
            ),),
            SizedBox(height: 20,),
            SpinKitCubeGrid(
              color: Colors.blueAccent,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

}