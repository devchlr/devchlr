
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/package_size.dart';
import 'package:flutter_app/constants/price.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/services/database/api.dart';
import 'package:flutter_app/services/google_place/place_service.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/orders/order_scanning.dart';
import 'package:flutter_app/services/storage/image_storage.dart';
import 'dart:io';

class ResumeOrderVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  GooglePlaceService placeService=GooglePlaceService();
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  OrderPackageInformation? orderPackageInformation;
  String?imagePath;
  DataBaseApi orderDataBase=DataBaseApi('orders');
  DataBaseApi messageDataBase=DataBaseApi('messages');
  FirebaseAuth auth=FirebaseAuth.instance;
  bool isLoading=false;
  GooglePlaceService googlePlaceService=GooglePlaceService();
  ImageStorageService imageStorageService =ImageStorageService();

  double getDistance(){
    var depart=orderDeliveryInformation!.departure_address;
    var arrival=orderRecipientInformation!.arrival_address;
    var km_distance=googlePlaceService.getDistance(depart!, arrival!);
    return km_distance;
  }

  double getPriceByDistance(String value){
    double distance =getDistance();
    switch(value){
      case PackageSize.small:return distance*TypePrice.ps;
      case PackageSize.medium:return distance*TypePrice.pm;
      case PackageSize.large:return distance*TypePrice.pl;
      case PackageSize.extralarge:return distance*TypePrice.pxl;
      default:return -1;
    }
  }


   savedOrderImage(String? imagePath){
    if(imagePath!=null){
      var user=auth.currentUser;
      var file = File(imagePath);
      var link=  imageStorageService.uploadImageUserOrderImage(file, '${user!.uid}');
      link.then((value) {
        print('value ici: ${value}');
         orderPackageInformation!.setImage(value);
      });
    }
  }


  void saveOrder(BuildContext context)async{
    isLoading=true;
    notifyListeners();
    var order_size=orderPackageInformation!.package_size;
    var km_price=getPriceByDistance(order_size!);
    var user = auth.currentUser;
    var orderImage=savedOrderImage(imagePath);

    var package=new OrderPackageInformation(
      package_nature: orderPackageInformation!.package_nature,
      package_size: orderPackageInformation!.package_size,
      package_image: orderImage.toString()
    );

    Order data=new Order(
        isValidate: false,
        order_price: km_price,
        order_km: getDistance(),
        order_status: 'loading',
        user_id: user!.uid,
        deliveryInformation: orderDeliveryInformation?.toJson(),
        packageInformation: orderPackageInformation?.toJson(),
        recipientInformation: orderRecipientInformation?.toJson(),
        created_at: DateTime.now(),
        updated_at: DateTime.now()
    );
    var order= orderDataBase.addDocument(data.toJson());
    order.then((value) async{
      await orderDataBase.addDocumentOrderId(value.id);
      var message=messageDataBase.setDocument(value.id);
      message.then((val){
        var pref=sharedPreferenceService.setNewOrder(value.id);
        pref.then((result){
          if(result){
            isLoading=false;
            notifyListeners();
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new OrderScanScreen(orderId:value.id)));
          }
        });
      });
    });
  }



  Future<DocumentSnapshot> getOrderInformation()async{
    var orderId= await sharedPreferenceService.getOrderId();
    return orderDatabase.getDocumentById(orderId!);
  }

}