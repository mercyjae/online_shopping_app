import 'package:get/get.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/models/cart_model.dart';
import 'package:online_shopping/models/dress_products.dart';

class CartController extends GetxController {
  Map<int, CartModel> _cartItems = {};

  Map<int, CartModel> get cartItems => _cartItems;

  void addDressItem(DressProduct dressProduct) {
    if (_cartItems.containsKey(dressProduct.id)) {
      _cartItems.update(dressProduct.id, (value) {
        return CartModel(
          id: value.id,
          title: value.title,
          price: value.price,
          image: value.image,
          description: value.description,
          size: value.size,
          color: value.color,
        );
      });
    } else {
      _cartItems.putIfAbsent(
          dressProduct.id,
          () => CartModel(
                id: dressProduct.id,
                title: dressProduct.title,
                price: dressProduct.price,
                image: dressProduct.image,
                description: dressProduct.description,
                size: dressProduct.size,
                color: dressProduct.color,
              ));
    }
    update();
  }

  void addBagItem(Product bagProduct) {
    if (_cartItems.containsKey(bagProduct.id)) {
      _cartItems.update(bagProduct.id, (value) {
        return CartModel(
          id: value.id,
          title: value.title,
          price: value.price,
          image: value.image,
          description: value.description,
          size: value.size,
          color: value.color,
        );
      });
    } else {
      _cartItems.putIfAbsent(
          bagProduct.id,
          () => CartModel(
                id: bagProduct.id,
                title: bagProduct.title,
                price: bagProduct.price,
                image: bagProduct.image,
                description: bagProduct.description,
                size: bagProduct.size,
                color: bagProduct.color,
              ));
    }
    update();
  }

  void removeItem(int id) {
    _cartItems.remove(id);
    update();
  }

  List<CartModel> get getItems {
    return _cartItems.entries.map((e) => e.value).toList();
  }
}
