
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/adress.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/services/database/api.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter_app/services/preferences/shared_preference_service.dart';
import 'package:flutter_app/ui/views/message/home_message.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'Dart:ui' as ui;


class TrackingMV extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');
  FirebaseAuth auth=FirebaseAuth.instance;
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  FirestoreService firestoreService=FirestoreService();
  GoogleMapController? mapController;
  Completer<GoogleMapController> _controller = Completer();
  // double _originLatitude = 48.87964, _originLongitude = 2.33231;
  // double _destLatitude = 48.87523, _destLongitude = 2.29767;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAQX7OqHR3keR8UQW02TyAWgqr6Co2OXWI";
  BitmapDescriptor? startMarker;
  BitmapDescriptor? endMarker;
  Uint8List? imageData;
  var order;
  LatLng center=  LatLng(48.87964, 2.33231);
  // =  LatLng(48.87964, 2.33231)

  void init(BuildContext context){

    /// destination marker
  }


Order? orderInformation;
 Future<void> initMap(BuildContext context)async{
   markers = {};
  polylines = {};
   polylineCoordinates = [];
    // print('ici: ${orderInformation!.toJson()}');
    var orderInfo=orderInformation!.toJson();
    var myOrder=Order.fromJson(orderInfo);
     var depart=OrderDeliveryInformation.fromJson(myOrder.deliveryInformation!);
     var arrival=OrderRecipientInformation.fromJson(myOrder.recipientInformation!);
     AdressLocalisation arrivalInfo=arrival.arrival_address!;
    AdressLocalisation departInfo=depart.departure_address!;
     var aLat=arrivalInfo.lat;
     var aLong=arrivalInfo.long;
     var dLat=departInfo.lat;
     var dLong=departInfo.long;

     print('ici: ${departInfo.lat}');
     center =  LatLng(dLat!, dLong!);
    await _addMarker(LatLng(dLat, dLong), "origin",
         'assets/images/marker/clientMarker.png',context);
    await _addMarker(LatLng(aLat!, aLong!), "destination",
         'assets/images/marker/chaliarMarker.png',context);
    await _getPolyline(departInfo,arrivalInfo);
  }



  void onMapCreated(GoogleMapController controller) async{
    mapController = controller;
  }

  getUserInfo(String userId){
    return firestoreService.getUserFuture(userId);
  }

  Future<DocumentSnapshot> getOrderInformation()async{
    var orderId= await sharedPreferenceService.getOrderId();
    order= orderDatabase.getDocumentById(orderId!);
    return order;
  }

  _addMarker(LatLng position, String id,String path,BuildContext context)async {
    ByteData byteData = await DefaultAssetBundle.of(context).load(path);
      MarkerId markerId = MarkerId(id);
      Marker marker =
      Marker(markerId: markerId, icon: BitmapDescriptor.fromBytes(byteData.buffer.asUint8List()), position: position);
      markers[markerId] = marker;
  }

  Future<void> actualise()async{

  }


  getMessageScreen(String orderId,BuildContext context,String senderId){
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new HomeMessageScreen(senderId: senderId, orderId:orderId,) ) );
  }

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Color(0xff2E9EE5), points: polylineCoordinates);
    polylines[id] = polyline;
  }

  _getPolyline(AdressLocalisation depart,AdressLocalisation arrival) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(depart.lat!, depart.long!),
      PointLatLng(arrival.lat!,arrival.long!),
      travelMode: TravelMode.driving,);
    // print('result ${result.points}');
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    addPolyLine();
  }
}