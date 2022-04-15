import 'dart:ui';

class CartModel {
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

  CartModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        title = json['title'],
        description = json['description'],
        price = json['price'],
        size = json['size'],
        color = Color(int.parse(json['color']));

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'size': size,
      'color': color.value.toString()
    };
  }
}
