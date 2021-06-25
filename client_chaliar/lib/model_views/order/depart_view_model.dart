// import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/taille_colli_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DepartFormViewModel extends BaseModel{
  TextEditingController departure_address=TextEditingController();
  DateRangePickerController delivery_date=DateRangePickerController();
  TextEditingController delivery_schedule=TextEditingController();
  TextEditingController delivery_firt_name=TextEditingController();
  TextEditingController delivery_email=TextEditingController();
  TextEditingController delivery_group=TextEditingController();
  TextEditingController delivery_name=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController delivery_type=TextEditingController();

  bool validatorForm(){
    if(departure_address.text.isEmpty){
      return false;
    }
    // if(delivery_schedule.text.isEmpty){
    //   return false;
    // }
    if(delivery_firt_name.text.isEmpty){
      return false;
    }
    if(delivery_email.text.isEmpty){
      return false;
    }

    if(phone_number.text.isEmpty){
      return false;
    }
    if(delivery_name.text.isEmpty){
      return false;
    }
    return true;
  }

  void formEditingController(BuildContext context){
    if(validatorForm()){
      OrderDeliveryInformation deliveryInformation = new OrderDeliveryInformation(
          delivery_schedule: delivery_schedule.text,
          departure_address: departure_address.text,
          delivery_date: delivery_date.selectedDate,
          delivery_firt_name: delivery_firt_name.text,
          delivery_group: delivery_group.text,
          delivery_email: delivery_email.text,
          delivery_name: delivery_name.text,
          delivery_type: delivery_type.text,
          phone_number: phone_number.text
      );

      print(deliveryInformation.toJson());

      // Navigator.push(context,
      //     new MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         new ArriveeFormScreen(deliveryInformation:deliveryInformation)));
    }else{
     print('form falidator fails');
    }
  }
}