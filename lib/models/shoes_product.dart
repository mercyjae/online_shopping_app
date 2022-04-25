import 'package:flutter/material.dart';
class ShoesProduct{
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final int id;
  final Color color;
  final int quantity;
  ShoesProduct({
    required this.image,
    required this.title,
    required  this.description,
    required this.price,
    required this.size,
    required  this.id,
    required this.color,
    required this.quantity,
  });

  ShoesProduct.fromJson(Map<String, dynamic> json)
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
List<ShoesProduct> shoe =[
  ShoesProduct(
      id: 1,
      title: "Nike air force",
      description: "Lovely Apple Songs",
      size: "13cm",
      price: 38 ,
      color: Color(0xFF3D82AE),
      image: "assets/images/shoes_11.png", quantity: 0
  ),
  ShoesProduct(
      id: 2,
      title: "Avrio V1",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 35,
      color: Colors.black54,
      image: "assets/images/shoes_02.png",quantity: 0
  ),
  ShoesProduct(
      id: 3,
      title: "Club Court",
      description: "Lovely Apple Songs",
      size: "15cm",
      price: 40,
      color:   Color(0xFFeff542),
      image: "assets/images/shoes_03.png",quantity: 0
  ),
  ShoesProduct(
      id: 4,
      title: "Nike Joyride",
      description: "Lovely Apple Songs",
      size: "15cm",
      price: 45,
      color: Color(0xFF3D82AE),
      image: "assets/images/shoes_04.png",quantity: 0
  ),
  ShoesProduct(
      id: 5,
      title: "Nike Adapt BB",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 40,
      color:  Colors.black54,
      image: "assets/images/shoes_12.png",quantity: 0
  ),
  ShoesProduct(
      id: 6,
      title: "Xpros V2",
      description: "Lovely Apple Songs",
      size: "13cm",
      price: 50,
      color: Colors.purpleAccent.shade100,
      image: "assets/images/shoes_01.png",quantity: 0
  ),
];




