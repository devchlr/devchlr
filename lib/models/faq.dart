import 'package:flutter_app/services/parsers/transformer.dart';
class Faq {
  final int id;
  final String title;
  final String description;
  final DateTime? created_at;

  Faq({
    required this.id,
    required this.title,
    required this.description,
    this.created_at,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['userId'],
      title: json['id'],
      description: json['title'],
      created_at:Utils.toDateTime(json['created_at']),
    );
  }
}
