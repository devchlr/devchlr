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
    if (typeUser == TypeUser.particulier) {
      if (await validatorPartInformation() == '404') {
        showDialog(context: context,
            builder: (_) =>
            new AlertDialog(
              title: Text('Error validate Form ',
                textAlign: TextAlign.center,
                style: AppTextStyle.header3(color: Colors.red),),
              content: Text('Tous les champs doivent être renseignés',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyApp1(color: Colors.red),),
            )
        );
      } else if (await validatorPartInformation() == '200') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: ChaliarColors.primaryColors,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetCircularAnimator(
                    child:
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.deepOrange[200],
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Creation de l\'utilisateur...',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headerApp1(
                        color: ChaliarColors.whiteColor),)
                ],
              )
          ),
        );
        bool isSingUp = false;
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
        getOPTScreen(context,phoneNumber.text);}
    } else if (typeUser == TypeUser.professionnel) {
      if (await validatorPartInformation() == '404') {
        showDialog(context: context,
            builder: (_) =>
            new AlertDialog(
              title: Text(
                'Error validate Form ',
                textAlign: TextAlign.center,
                style: AppTextStyle.header3(color: Colors.red),
              ),
              content: Text(
                'Tous les champs doivent être renseignés',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyApp1(color: Colors.red),
              ),
            )
        );
      } else if (await validatorPartInformation() == '200') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: ChaliarColors.primaryColors,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetCircularAnimator(
                    child:
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.deepOrange[200],
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Creation de l\'utilisateur...',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headerApp1(
                        color: ChaliarColors.whiteColor),)
                ],
              )
          ),
        );
        bool isSingUp = false;
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

}