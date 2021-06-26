import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';

class ArriveScreenViewModel extends BaseModel{
  TextEditingController arrival_address =TextEditingController();
  TextEditingController recipient_phone_number=TextEditingController();
  TextEditingController firt_name_recipient=TextEditingController();
  TextEditingController name_recipient=TextEditingController();
  TextEditingController recipient_email=TextEditingController();
  TextEditingController recipient_group=TextEditingController();
  TextEditingController recipient_note=TextEditingController();
  OrderDeliveryInformation? orderDeliveryInformation;

  bool validatorForm(){
    if(arrival_address.text.isEmpty){
      return false;
    }
    if(recipient_phone_number.text.isEmpty){
      return false;
    }
    if(firt_name_recipient.text.isEmpty){
      return false;
    }
    if(name_recipient.text.isEmpty){
      return false;
    }
    if(recipient_email.text.isEmpty){
      return false;
    }
    if(recipient_group.text.isEmpty){
      return false;
    }
    return true;
  }

  formEditingController(BuildContext context){
  if(validatorForm()){
    OrderRecipientInformation recipientInformation = OrderRecipientInformation(
        arrival_address: arrival_address.text,
        recipient_phone_number: recipient_phone_number.text,
        firt_name_recipient: firt_name_recipient.text,
        name_recipient: name_recipient.text,
        recipient_email: recipient_email.text,
        recipient_note: recipient_note.text,
        recipient_group: recipient_group.text
    );
    print(recipientInformation.toJson());
  }else{
    print('donne du formulaire non conforme');
  }

  }


}