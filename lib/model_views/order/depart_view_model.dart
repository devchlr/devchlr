// import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/taille_colli_screen.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/type_livraison.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/services/database/api.dart';
import 'package:flutter_app/services/database/order_store_service.dart';
import 'package:flutter_app/services/google_place/place_service.dart';
import 'package:flutter_app/ui/views/orders/form/arrive_order_form.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:google_place/google_place.dart';

class DepartFormViewModel extends BaseModel{
  GooglePlaceService googlePlaceService=GooglePlaceService();
  TextEditingController departure_address=TextEditingController();
  DateRangePickerController delivery_date=DateRangePickerController();
  TextEditingController delivery_schedule=TextEditingController();
  TextEditingController delivery_firt_name=TextEditingController();
  TextEditingController delivery_email=TextEditingController();
  TextEditingController delivery_group=TextEditingController();
  TextEditingController delivery_name=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController delivery_type=TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  String? group=TypeLivraison.express;
  OrderStoreService orderStoreService=OrderStoreService();
  DataBaseApi dataBaseApi=DataBaseApi('orders');
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

  Future getPlaceSugestion(String value)async{
    var result= await googlePlaceService.getPlaceSugestion(value);
    return result;
  }


  void selectTypeLivraison(String value){
    group=value;
    notifyListeners();
  }

  void formEditingController(BuildContext context)async{
    // customShowSnackBar.initUserRequestAnimation(context);
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
      dataBaseApi.addDocument(deliveryInformation.toJson());
      var order =dataBaseApi.getDataCollection();
      order.then((value){
       var users=value.docs.first.data();
        print(users);
      });
      // orderStoreService.addOrder(new Order(
      //   deliveryInformation: deliveryInformation.toJson()
      // ));
      // orderStoreService.getAllOrders().then((value) {
      //   print(value);
      // });



      // Navigator.push(context,
      //     new MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //         new ArriveeFormScreen(deliveryInformation:deliveryInformation)));
    }else{
      customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent etres renseignes');
     print('form falidator fails');
    }
  }
}