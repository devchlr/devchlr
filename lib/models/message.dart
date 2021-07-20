import 'package:flutter/material.dart';
import 'package:flutter_app/services/parsers/transformer.dart';
class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String? idUser;
  final String? urlAvatar;
  final String? username;
  final String? message;
  final DateTime? createdAt;
  final DateTime? created_at;
  final DateTime? updated_at;

  const Message({
    this.idUser,
    this.urlAvatar,
    this.username,
    this.message,
     this.createdAt,
    this.created_at,
    this.updated_at
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
    idUser: json['idUser'],
    urlAvatar: json['urlAvatar'],
    username: json['username'],
    message: json['message'],
    createdAt: Utils.toDateTime(json['createdAt']),
    created_at:Utils.toDateTime(json['created_at']),
    updated_at:Utils.toDateTime(json['updated_at']),

  );

  Map<String, dynamic> toJson() => {
    'idUser': idUser,
    'urlAvatar': urlAvatar,
    'username': username,
    'message': message,
    'createdAt': Utils.fromDateTimeToJson(createdAt!),
    'created_at':Utils.fromDateTimeToJson(created_at!),
    'updated_at':Utils.fromDateTimeToJson(updated_at!),
  };
}