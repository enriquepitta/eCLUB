import 'package:flutter/material.dart';

class MovementModel {
  final String title;
  final String category;
  final String amount;
  final String date;
  final String icon;
  final Color color;

  MovementModel({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.icon,
    required this.color,
  });
}