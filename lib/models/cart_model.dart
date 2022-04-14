import 'dart:ui';

class CartModel{
  final int id;
  final String image;
  final String title;
  final String description;
  final int price;
  final String size;
  final Color color;
  CartModel(
      {required this.id,
        required this.image,
        required this.title,
        required this.description,
        required this.price,
        required this.size,
        required this.color});
}
}