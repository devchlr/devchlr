import 'package:client_chaliar/business_logic/view_model/base_model.dart';
import 'package:flutter/material.dart';

class TutoViewModel extends BaseModel {
  void PushPage(BuildContext context) {
    Navigator.pushNamed(context, '/connexion');
  }
}
