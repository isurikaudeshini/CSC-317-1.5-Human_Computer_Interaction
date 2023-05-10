import 'package:flutter/material.dart';

class Shoe {
  final String id;
  final String imageUrl;
  final String snapchatUrl;
  final String price;
  final String brand;
  final String color;

  const Shoe(
      {required this.id,
      required this.imageUrl,
      required this.snapchatUrl,
      required this.price,
      required this.brand,
      required this.color});
}
