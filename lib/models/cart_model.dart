import 'dart:ui';

import 'package:online_shopping/models/dress_products.dart';

class CartModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final Color color;
  late final int quantity;
  DressProduct? dressProduct;

  CartModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity,
    this.dressProduct,
  });

  CartModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        title = json['title'],
        description = json['description'],
        price = json['price'],
        size = json['size'],
        color = Color(int.parse(json['color'])),
        quantity = json["quantity"],
        dressProduct = DressProduct.fromJson(json['dressProduct']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'size': size,
      'color': color.value.toString(),
      "quantity": quantity,
      'dressProduct': dressProduct?.toJson(),
    };
  }
}
