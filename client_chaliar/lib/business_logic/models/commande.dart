import 'dart:convert';

//command Object class

class Order{
  final double order_price;
  final String order_status;
  final String order_id;
  final String user_id;
  final String delivery_id;
  final OrderDeliveryInformation deliveryInformation;
  final OrderRecipientInformation recipientInformation;
  final OrderPackageInformation packageInformation;

  Order(
      this.order_price,
      this.order_status,
      this.order_id,
      this.user_id,
      this.delivery_id,
      this.deliveryInformation,
      this.recipientInformation,
      this.packageInformation
      );
  Order.fromJson(Map<String,dynamic>json):
        order_price=json['order_price'],
        order_status=json['order_status'],
        order_id=json['order_id'],
        user_id=json['user_id'],
        delivery_id=json['delivery_id'],
        deliveryInformation=json['deliveryInformation'],
        recipientInformation=json['recipientInformation'],
        packageInformation=json['packageInformation'];

  Map<String,dynamic>toJson()=>{
  'order_price':order_price,
  'order_status':order_status,
  'order_id':order_id,
  user_id:user_id,
  delivery_id:delivery_id,
  'deliveryInformation':deliveryInformation,
  'recipientInformation':recipientInformation,
  'packageInformation':packageInformation
  };

}


//delivery Order information command
class OrderDeliveryInformation{
  final String departure_address;
  final String delivery_date;
  final String delivery_schedule;
  final String delivery_firt_name;
  final String phone_number;
  final String delivery_email;
  final String delivery_group;
  final String command_order;

  OrderDeliveryInformation(
    this.departure_address,
    this.delivery_date,
    this.delivery_schedule,
    this.delivery_firt_name,
    this.delivery_email,
    this.delivery_group,
    this.command_order,
      this.phone_number
);
  OrderDeliveryInformation.fromJson(Map<String, dynamic> json)
     :  departure_address=json['departure_address'],
        delivery_date=json['delivery_date'],
        delivery_schedule=json['delivery_schedule'],
        delivery_firt_name=json['delivery_firt_name'],
        delivery_email=json['delivery_email'],
        delivery_group=json['delivery_group'],
        phone_number=json['phone_number'],
        command_order=json['delivery_order'];

  Map<String, dynamic> toJson() =>{
  departure_address:'departure_address',
  delivery_date:'delivery_date',
  delivery_schedule:'delivery_schedule',
  delivery_firt_name:'delivery_firt_name',
  delivery_email:'delivery_email',
  delivery_group:'delivery_group',
  command_order:'delivery_order',
    phone_number:'phone_number',
  };
}


//recipient Order information command
class OrderRecipientInformation{
  final String arrival_address;
  final String recipient_phone_number;
  final String firt_name_recipient;
  final String name_recipient;
  final String recipient_email;
  final String recipient_group;
  final String recipient_note;
  final String command_order;

  OrderRecipientInformation(
  this.arrival_address,
  this.recipient_phone_number,
  this.firt_name_recipient,
  this.name_recipient,
  this.recipient_email,
  this.recipient_group,
  this.recipient_note,
  this.command_order
      );
  OrderRecipientInformation.fromJson(Map<String, dynamic> json)
      :  arrival_address=json['arrival_address'],
        recipient_phone_number=json['recipient_phone_number'],
        firt_name_recipient=json['firt_name_recipient'],
        name_recipient=json['name_recipient'],
        recipient_email=json['recipient_email'],
        recipient_group=json['recipient_group'],
        recipient_note=json['recipient_note'],
        command_order=json['command_order'];

  Map<String, dynamic> toJson() =>{
  arrival_address:'arrival_address',
  recipient_phone_number:'recipient_phone_number',
  firt_name_recipient:'firt_name_recipient',
  name_recipient:'name_recipient',
  recipient_email:'recipient_email',
  recipient_group:'recipient_group',
  recipient_note:'recipient_note',
    command_order:'command_order'
  };
}
//package Order nature
class OrderPackageInformation{
  final String package_nature;
  final String package_size;
  final String package_image;
  final String command_order;
  OrderPackageInformation(
      this.package_nature,
      this.package_size,
      this.package_image,
  this.command_order
      );
  OrderPackageInformation.fromJson(Map<String, dynamic>json):
      package_nature=json['package_nature'],
  package_size=json['package_size'],
        command_order=json['command_order'],
  package_image=json['package_image'];
  Map<String,dynamic>toJson()=>{
    'package_nature':package_nature,
    'package_size':package_size,
    'package_image':package_image,
    'command_order':command_order
  };
}