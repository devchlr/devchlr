import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/package_size.dart';
import 'package:flutter_app/constants/price.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/services/database/api.dart';
import 'package:flutter_app/services/database/order_store_service.dart';
import 'package:flutter_app/services/fire_auth_service.dart';
import 'package:flutter_app/services/google_place/place_service.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/orders/form/camera/camera_screen.dart';
import 'package:flutter_app/ui/views/orders/form/resume_order_screen.dart';
//camera
import 'package:camera/camera.dart';



class AddPhotoVM extends BaseModel{
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  OrderPackageInformation? orderPackageInformation;
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  DataBaseApi orderDataBase=DataBaseApi('orders');
  DataBaseApi messageDataBase=DataBaseApi('messages');
  FirebaseAuth auth=FirebaseAuth.instance;
  bool isLoading=false;
  GooglePlaceService googlePlaceService=GooglePlaceService();


  Future<double> getDistance()async{
    var depart=orderDeliveryInformation!.departure_address;
    var arrival=orderRecipientInformation!.arrival_address;
    var km_distance=googlePlaceService.getDistance(depart!, arrival!);
    return km_distance;
  }


  Future<double> getPriceByDistance(String value)async{
    var getD=await getDistance();
    double distance = getD;
    switch(value){
      case PackageSize.small:return distance*TypePrice.ps;
      case PackageSize.medium:return distance*TypePrice.pm;
      case PackageSize.large:return distance*TypePrice.pl;
      case PackageSize.extralarge:return distance*TypePrice.pxl;
      default:return -1;
    }
  }


  void getPackageResume(BuildContext context)async{
    isLoading=true;
    notifyListeners();
    var order_size=orderPackageInformation!.package_size;
    var km_price=getPriceByDistance(order_size!);
    var getD=await getDistance();
    var price=await km_price;
    // Order data=new Order(
    //   isValidate: false,
    //   order_price: price,
    //   order_km: getD,
    //   order_status: 'loading',
    //     user_id: user!.uid,
    //     deliveryInformation: orderDeliveryInformation?.toJson(),
    //     packageInformation: orderPackageInformation?.toJson(),
    //     recipientInformation: orderRecipientInformation?.toJson(),
    //   created_at: DateTime.now(),
    //   updated_at: DateTime.now(),
    // );
    isLoading=false;
    notifyListeners();
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new ResumeOrderScreen(order_price:price,order_km:getD,packageInformation: orderPackageInformation,recipientInformation: orderRecipientInformation,deliveryInformation: orderDeliveryInformation,)));
    // var order= orderDataBase.addDocument(data.toJson());
    // order.then((value) async{
    //   await orderDataBase.addDocumentOrderId(value.id);
    //   var message=messageDataBase.setDocument(value.id);
    //   message.then((val){
    //     var pref=sharedPreferenceService.setNewOrder(value.id);
    //     pref.then((result){
    //       if(result){
    //         isLoading=false;
    //         notifyListeners();
    //         Navigator.push(context,
    //             new MaterialPageRoute(
    //                 builder: (BuildContext context) =>
    //                 new ResumeOrderScreen(order: data,)));
    //       }
    //     });
    //   });
    // });
  }


  void getPhoto(BuildContext context)async{
    isLoading=true;
    notifyListeners();
    var order_size=orderPackageInformation!.package_size;
    var km_price=getPriceByDistance(order_size!);
    var user = auth.currentUser;
    var getD=await getDistance();
    var price=await km_price;
    // Order data=new Order(
    //     isValidate: false,
    //     order_price: getD,
    //     order_km: price,
    //     order_status: 'loading',
    //     user_id: user!.uid,
    //     deliveryInformation: orderDeliveryInformation?.toJson(),
    //     packageInformation: orderPackageInformation?.toJson(),
    //     recipientInformation: orderRecipientInformation?.toJson(),
    //   created_at: DateTime.now(),
    //   updated_at: DateTime.now(),
    // );

    //camera
    final cameras = await availableCameras();
    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras;
    final List<CameraDescription> camera=firstCamera;


    isLoading=false;
    notifyListeners();
    // Navigator.pushNamed(context, '/take_picture', arguments: {
    //   'order_price':price,
    //   'order_km':getD,
    //   'packageInformation': orderPackageInformation,
    //   'recipientInformation': orderRecipientInformation,
    //   'deliveryInformation': orderDeliveryInformation,
    // });
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new TakePictureScreen(camera: camera,
              order_price:price,
              order_km:getD,
              packageInformation: orderPackageInformation,
              recipientInformation: orderRecipientInformation,
              deliveryInformation: orderDeliveryInformation,

            )));

    // var order= orderDataBase.addDocument(data.toJson());
    // order.then((value) async{
    //   await orderDataBase.addDocumentOrderId(value.id);
    //   var message=messageDataBase.setDocument(value.id);
    //   message.then((val){
    //     var pref=sharedPreferenceService.setNewOrder(value.id);
    //     pref.then((result){
    //       if(result){
    //        }
    //     });
    //   });
    // });
  }

}