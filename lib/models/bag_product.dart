import 'package:flutter/material.dart';

class Product {
  final int id;

  final String image;

  final String title;

  final String description;
  final int price;

  final String size;
  final Color color;

  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.color});
}

List<Product> products = [
  Product(
    id: 1,
    title: "Modern Office ",
    description: "Lovely Apple Songs",
    size: "18cm",
    price: 45,
    color: Color(0xFF3D82AE),
    image: "assets/images/bag_1.png",
  ),
  Product(
      id: 2,
      title: "Louis Vuitton",
      description: "Lovely Apple Songs",
      size: "13cm",
      price: 30,
      color: Color(0xFFFB7883),
      image: "assets/images/bag_5.png"),
  Product(
      id: 3,
      title: "Tote ",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 28,
      color: Color(0xFFebc034),
      image: "assets/images/bag3.png"),
  Product(
      id: 4,
      title: "Gucci",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 30,
      color: Colors.black12,
      image: "assets/images/bag4.png"),
  Product(
      id: 5,
      title: "Pink Alligator",
      description: "Lovely Apple Songs",
      size: "15cm",
      price: 35,
      color: Color(0xFFD3A984),
      image: "assets/images/bag7.png"),
  Product(
      id: 6,
      title: "Pranda",
      description: "Lovely Apple Songs",
      size: "10cm",
      price: 38,
      color: Color(0xFFf54242),
      image: "assets/images/bag6.png"),
];
