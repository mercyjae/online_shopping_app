import 'package:flutter/material.dart';
class DressProduct{
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final int id;
  final Color color;
  final int quantity;
  DressProduct({
    required this.image,
    required this.title,
    required  this.description,
    required this.price,
    required this.size,
    required  this.id,
    required this.color,
    required this.quantity
  });
}
List<DressProduct> dress =[
  DressProduct(
      id: 1,
      title: "Cinderella",
      description: "Lovely Apple Songs",
      size: "13cm",
      price: 40,
      color: Color(0xFF3489eb),
      image: "assets/images/dress 8.png", quantity: 1
  ),
  DressProduct(
      id: 2,
      title: "Flared yellow gown",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 35,
      color: Color(0xFFebc034),
      image: "assets/images/dress 1.png",quantity: 1
  ),
  DressProduct(
      id: 3,
      title: "Black Short Gown",
      description: "Lovely Apple Songs",
      size: "15cm",
      price: 40 ,
      color: Colors.black54,
      image: "assets/images/dresses.png",quantity: 1
  ),
  DressProduct(
      id: 4,
      title: "Flared red gown",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 28,
      color:   Color(0xFFeb3434),
      image: "assets/images/dress 7.png",quantity: 1
  ),
  DressProduct(
      id: 5,
      title: "Lapping gown",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 35,
      color:  Color(0xFF3D82AE),
      image: "assets/images/dress 4.png",quantity: 1
  ),
  DressProduct(
      id: 6,
      title: "Silky gown",
      description: "Lovely Apple Songs",
      size: "10cm",
      price: 25,
      color: Color(0xFFAEAEAE),
      image: "assets/images/dress_6.png",quantity: 1
  ),
];
