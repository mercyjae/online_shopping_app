import 'dart:ui';

import 'package:online_shopping/models/dress_products.dart';
import 'package:online_shopping/models/glasses_products.dart';
import 'package:online_shopping/models/shoes_product.dart';

import 'bag_product.dart';

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
  Product? bagProduct;
  ShoesProduct? shoesProduct;
  GlassProduct? glassProduct;

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
    this.bagProduct,
    this.shoesProduct,
    this.glassProduct,

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
  dressProduct = DressProduct.fromJson(json["dressProduct"]),
        bagProduct = Product.fromJson(json["bagProduct"]),
  shoesProduct = ShoesProduct.fromJson(json['shoesProduct']),
  glassProduct = GlassProduct.fromJson(json['glassProduct']);


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
      'bagProduct': bagProduct?.toJson(),
      'shoesProduct': shoesProduct?.toJson(),
      'glassProduct': glassProduct?.toJson(),
    };
  }
}
