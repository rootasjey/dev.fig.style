import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserApp {
  DateTime createdAt;
  String description;
  final String id;
  String name;
  DateTime updatedAt;

  UserApp({
    this.createdAt,
    this.description = '',
    @required this.id,
    this.name = '',
    this.updatedAt,
  });

  factory UserApp.fromJSON(Map<String, dynamic> data) {
    return UserApp(
      createdAt: (data['createdAt'] as Timestamp)?.toDate(),
      description: data['description'],
      id: data['id'],
      name: data['name'],
      updatedAt: (data['createdAt'] as Timestamp)?.toDate(),
    );
  }
}
