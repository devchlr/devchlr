import 'package:flutter_app/services/parsers/transformer.dart';

class Bills{

  final double? amount;
  final String? id;
  final String? order;
  final String? reference;
  final DateTime? created_at;

  Bills({this.id,this.order,this.amount,this.reference,this.created_at});
  static Bills fromJson(Map<String, dynamic> json) => Bills(
    id: json['id'],
    amount: json['amount'],
    order: json['order'],
    reference: json['reference'],
    created_at:Utils.toDateTime(json['created_at']),

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'order': order,
    'reference': reference,
    'created_at':Utils.fromDateTimeToJson(created_at!),
  };

}