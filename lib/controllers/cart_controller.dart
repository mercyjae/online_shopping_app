import 'package:get/get.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/models/cart_model.dart';
import 'package:online_shopping/models/dress_products.dart';
import 'package:online_shopping/models/glasses_products.dart';
import 'package:online_shopping/models/shoes_product.dart';

class CartController extends GetxController {
  Map<int, CartModel> _cartItems = {};
  Map<int, CartModel> get cartItems => _cartItems;

  void addShoes(ShoesProduct shoesProduct){
    if(_cartItems.containsKey(shoesProduct.id)){
      _cartItems.update(shoesProduct.id, (value){
    return  CartModel(id: value.id,
          image: value.image,
          title: value.title,
          description: value.description,
          price: value.price,
          size: value.size,
          color: value.color,
          quantity: value.quantity);});
    }else{
      _cartItems.putIfAbsent(shoesProduct.id, () =>
          CartModel(id: shoesProduct.id,
              image: shoesProduct.image,
              title: shoesProduct.title,
              description: shoesProduct.description,
              price: shoesProduct.price,
              size: shoesProduct.size,
              color: shoesProduct.color,
            quantity: shoesProduct.quantity,
          ));

    }
    update();
  }

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
            quantity: value.quantity
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
            quantity: dressProduct.quantity
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
            quantity: value.quantity
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
            quantity: bagProduct.quantity
              ));
    }
    update();
  }
  void addGlass(GlassProduct glassProduct){
    if(_cartItems.containsKey(glassProduct.id)){
      _cartItems.update(glassProduct.id, (value) {
      return  CartModel(
            id: value.id,
            title: value.title,
            price: value.price,
            image: value.image,
            description: value.description,
            size: value.size,
            color: value.color,
          quantity: value.quantity
          );});
    }else{
      _cartItems.putIfAbsent(glassProduct.id, () =>
          CartModel(
            id: glassProduct.id,
            title: glassProduct.title,
            price: glassProduct.price,
            image: glassProduct.image,
            description: glassProduct.description,
            size: glassProduct.size,
            color: glassProduct.color,
            quantity: glassProduct.quantity
          ));
    }
    update();
  }

  void removeItem(int id) {
    _cartItems.remove(id);
    update();
  }
  int quantity = 0;

 void setQuantity(bool isIncrement){
 if(isIncrement){
  quantity = checkQuantity(quantity+1);
}else{
   quantity = checkQuantity(quantity-1);
 }
 update();
 print(quantity);
}
int checkQuantity(int quantity){
   if(quantity <0){
     Get.snackbar("can't get", " 0 item");
     return 0;
   }
   return quantity;
  }




  List<CartModel> get getItems {
    return _cartItems.entries.map((e) => e.value).toList();
  }
}
