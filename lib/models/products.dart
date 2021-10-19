import 'package:flutter/material.dart';
class Product{
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final int id;
  final Color color;
  Product({
    required this.image,
    required this.title,
    required  this.description,
    required this.price,
    required this.size,
    required  this.id,
    required this.color,
});
}
List<Product> products =[
  Product(
    id: 1,
    title: "Office code",
    description: "Lovely Apple Songs",
    size: "12cm",
    price: 2345 ,
    color: Color(0xFF3D82AE),
    image: "assets/images/bag_1.png"
  ),
  Product(
      id: 2,
      title: "Bag extraordinaire",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 2345,
      color: Color(0xFFD3A984),
      image: "assets/images/bag_2.png"
  ),
  Product(
      id: 3,
      title: "Old fashion",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 2345,
      color:   Color(0xFF989493),
      image: "assets/images/bag_3.png"
  ),
  Product(
      id: 4,
      title: "Office code",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 2345,
      color: Color(0xFFE6B398),
      image: "assets/images/bag_4.png"
  ),
  Product(
      id: 5,
      title: "0ffice code",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 2345,
      color:  Color(0xFFFB7883),
      image: "assets/images/bag_5.png"
  ),
  Product(
      id: 6,
      title: "Belt bag",
      description: "Lovely Apple Songs",
      size: "12cm",
      price: 2345,
      color: Color(0xFFAEAEAE),
      image: "assets/images/bag_6.png"
  ),
];
