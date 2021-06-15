import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:flutter/cupertino.dart';

class ConnexionViewModel extends BaseModel {
  var group = 'professionnel';
  void pushPage(BuildContext context, String page) {
    Navigator.pushReplacementNamed(context, '/$page');
  }

  void setRadioGroup(String value) {
    group = value;
    notifyListeners();
  }

  void pushUserRegisterPagePreference(BuildContext context, String page) {}
}
