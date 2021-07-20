
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/orders/form/resume_order_screen.dart';

class DisplayPictureMV extends BaseModel{

  OrderPackageInformation?packageInformation;
  OrderRecipientInformation?recipientInformation;
  OrderDeliveryInformation?deliveryInformation;
  double? order_km;
  double?order_price;
  String? imagePath;

    getResumeOrderScreen(BuildContext context){
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (context) =>
              new ResumeOrderScreen(order_price:order_price,
                order_km:order_km,
                packageInformation: packageInformation,
                recipientInformation: recipientInformation,
                deliveryInformation: deliveryInformation,
                imagePath: imagePath,
              ),
          ),
      );
    }



}