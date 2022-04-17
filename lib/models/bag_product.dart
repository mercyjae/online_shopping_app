import 'package:flutter/material.dart';

class Product {
  final int id;
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final Color color;
  final int quantity;
  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.color,
      required this.quantity});
}

List<Product> products = [
  Product(
    id: 7,
    title: "Modern Office ",
    description: "Lovely Apple Songs",
    size: "18cm",
    price: 45,
    color: Color(0xFF3D82AE),
    image: "assets/images/bag_1.png", quantity: 1,
  ),
  Product(
      id: 8,
      title: "Louis Vuitton",
      description: "Lovely Apple Songs",
      size: "13cm",
      price: 30,
      color: Color(0xFFFB7883),
      image: "assets/images/bag_5.png",quantity: 1,),
  Product(
      id: 9,
      title: "Tote ",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 28,
      color: Color(0xFFebc034),
      image: "assets/images/bag3.png",quantity: 1,),
  Product(
      id: 10,
      title: "Gucci",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 30,
      color: Colors.black12,
      image: "assets/images/bag4.png",quantity: 1,),
  Product(
      id: 11,
      title: "Pink Alligator",
      description: "Lovely Apple Songs",
      size: "15cm",
      price: 35,
      color: Color(0xFFD3A984),
      image: "assets/images/bag7.png",quantity: 1,),
  Product(
      id: 12,
      title: "Pranda",
      description: "Lovely Apple Songs",
      size: "10cm",
      price: 38,
      color: Color(0xFFf54242),
      image: "assets/images/bag6.png",quantity: 1,),
];
