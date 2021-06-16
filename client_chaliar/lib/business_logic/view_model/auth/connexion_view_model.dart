import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:client_chaliar/ui/views/auth/inscription_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnexionViewModel extends BaseModel {
  var group = 'particulier';
  void pushPage(BuildContext context, String page) {
    Navigator.pushNamed(context, '/$page');
  }

  void setRadioGroup(String value) {
    group = value;
    print('new group value :$group');
    notifyListeners();
  }

  void pushUserRegisterPagePreference(BuildContext context, String page) {
    print(group);
    Navigator.push (context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new InscriptionHomeScreen()));
  }
}
