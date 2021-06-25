import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';

class TailleScreeenViewmodel extends BaseModel{
  String? package_size;
  TextEditingController package_nature=TextEditingController();
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;

  bool validator(){
    if(package_nature.text.isEmpty){
      return false;
    }
    return true;
  }

  void selectedCard(bool val){
    if(val){
      val=false;
    }else{
      val=true;
    }
  }

  void formEditingController(BuildContext context){
    if(validator()){
      OrderPackageInformation packageInformation=new OrderPackageInformation(package_nature:package_nature.text,package_size: package_size);
      // Navigator.push(context,
      //     new MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         new AddPhotoScreen()));
    }else{
      print('donne du formulaire non conforme');
    }
  }


}