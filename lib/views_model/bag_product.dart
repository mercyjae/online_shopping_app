import 'package:flutter/material.dart';
class Product{
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final int id;
  final Color color;
  final int quantity;
  Product({
    required this.image,
    required this.title,
    required  this.description,
    required this.price,
    required this.size,
    required  this.id,
    required this.color,
    required this.quantity
  });

  Product.fromJson(Map<String, dynamic> json)
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
List<Product> products =[
  Product(
      id: 1,
      title:  "Modern Office ",
      description: "Lovely Apple Songs",
      size: "20cm",
      price: 350 ,
      color: Color(0xFF3D82AE),
      image:"assets/images/bag_1.png", quantity: 1
  ),
  Product(
       id: 2,
       title: "Louis Vuitton",
       description: "Lovely Apple Songs",
        size: "13cm",
       price: 300,
       color: Color(0xFFFB7883),
       image: "assets/images/bag_5.png",quantity: 1,
  ),
  Product(
    id: 3,
    title: "Tote ",
    description: "Lovely Apple Songs",
    size: "12cm",
    price: 280,
    color: Color(0xFFebc034),
    image: "assets/images/bag3.png",quantity: 1,
  ),
  Product(
    id: 4,
    title: "Gucci",
    description: "Lovely Apple Songs",
    size: "12cm",
    price: 300,
    color: Colors.black12,
    image: "assets/images/bag4.png",quantity: 1,
  ),
  Product(
      id: 5,
       title: "Pink Alligator",
       description: "Lovely Apple Songs",
       size: "15cm",
      price: 350,
       color: Color(0xFFD3A984),
       image: "assets/images/bag7.png",quantity: 1,
  ),
  Product(
       id: 6,
       title: "Pranda",
       description: "Lovely Apple Songs",
       size: "10cm",
       price: 380,
       color: Color(0xFFf54242),
      image: "assets/images/bag6.png",quantity: 1,
  ),
];
