import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/services/database/order_store_service.dart';


class AddPhotoVM extends BaseModel{
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  OrderPackageInformation? orderPackageInformation;
  OrderStoreService orderStoreService=OrderStoreService();

  void getPackageResume(){
    orderStoreService.addOrder(new Order(
      deliveryInformation: orderDeliveryInformation?.toJson(),
      packageInformation: orderPackageInformation?.toJson(),
      recipientInformation: orderRecipientInformation?.toJson()
    ));
  }


}