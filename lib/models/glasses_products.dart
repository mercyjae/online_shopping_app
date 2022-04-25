import 'package:flutter/material.dart';
class GlassProduct{
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final int id;
  final Color color;
  final int quantity;
  GlassProduct({
    required this.image,
    required this.title,
    required  this.description,
    required this.price,
    required this.size,
    required  this.id,
    required this.color,
    required this.quantity
  });

  GlassProduct.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        title = json['title'],
        description = json['description'],
        price = json['price'],
        size = json['size'],
        id = json['id'],
        color = Color(json['color']),
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
    'image': image,
    'title': title,
    'description': description,
    'price': price,
    'size': size,
    'id': id,
    'color': color.value,
    'quantity': quantity,
  };
}
List<GlassProduct> eyeglass =[
  GlassProduct(
      id: 1,
      title: "Prada",
      description: "Lovely Apple Songs",
      size: "20cm",
      price: 35 ,
      color: Color(0xFFE6B398),
      image: "assets/images/eyeglass 1.png", quantity: 0
  ),
  GlassProduct(
      id: 2,
      title: "Ray-Ban",
      description: "Lovely Apple Songs",
      size: "30cm",
      price: 45,
      color: Colors.blueGrey,
      image: "assets/images/eyeglass 2.png",quantity: 0
  ),
  GlassProduct(
      id: 3,
      title: "Easton",
      description: "Office Glass",
      size: "30cm",
      price: 40,
      color:   Color(0xFFAEAEAE),
      image: "assets/images/eyeglass 3.png",quantity: 0
  ),
  GlassProduct(
      id: 4,
      title: "Oliver",
      description: "Lovely Apple Songs",
      size: "28cm",
      price: 35,
      color: Color(0xFFAEAEAE),
      image: "assets/images/eyeglass 4.png",quantity: 0
  ),
  GlassProduct(
      id: 5,
      title: "Gucci",
      description: "Lovely Apple Songs",
      size: "25cm",
      price: 30,
      color:  Color(0xFFAEAEAE),
      image: "assets/images/eyeglass 5.png",quantity: 0
  ),
  GlassProduct(
      id: 6,
      title: "Wilson",
      description: "Lovely Apple Songs",
      size: "22cm",
      price: 28,
      color: Color(0xFFAEAEAE),
      image: "assets/images/eyeglass 6.png",quantity: 0
  ),
];
