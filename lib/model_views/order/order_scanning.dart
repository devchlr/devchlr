import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/services/database/api.dart';

class OrderScanningVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');

  Stream<DocumentSnapshot> getOrderInformation(String orderId){
    return orderDatabase.streamDataCollectionById(orderId);
  }
}