import 'package:flutter_app/services/parsers/transformer.dart';

class OrdersNotes{
  final String? comment;
  final DateTime? created_at;
  final String?id;
  final String?order;
  final int? stars;
  final String? user;


  OrdersNotes({
    this.comment,
    this.created_at,
    this.id,
    this.order,
    this.stars,
    this.user
});

  static OrdersNotes fromJson(Map<String, dynamic> json) => OrdersNotes(
    id: json['id'],
    comment: json['comment'],
    stars: json['stars'],
    order: json['order'],
    user: json['user'],
    created_at:Utils.toDateTime(json['created_at']),

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'comment': comment,
    'order': order,
    'user':user,
    'stars': stars,
    'created_at':Utils.fromDateTimeToJson(created_at!),
  };

}