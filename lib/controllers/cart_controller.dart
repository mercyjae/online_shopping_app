import 'package:get/get.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/models/cart_model.dart';
import 'package:online_shopping/models/dress_products.dart';
import 'package:online_shopping/models/glasses_products.dart';
import 'package:online_shopping/models/shoes_product.dart';

class CartController extends GetxController {
  Map<int, CartModel> _cartItems = {};
  Map<int, CartModel> get cartItems => _cartItems;

  int quantity = 0;
  int totalPrice = 0;
  var totalQuantity = 0;
  void addShoesItem(ShoesProduct shoesProduct, int quantity) {
    if (_cartItems.containsKey(shoesProduct.id)) {
      _cartItems.update(shoesProduct.id, (value) {
        totalQuantity = value.quantity + quantity;
        return CartModel(
            id: value.id,
            image: value.image,
            title: value.title,
            description: value.description,
            price: value.price,
            size: value.size,
            color: value.color,
            quantity: value.quantity + quantity,
        shoesProduct:  shoesProduct);
      });
      if (totalQuantity <= 0) {
        _cartItems.remove(shoesProduct.id);
      }
    } else {
      if (quantity > 0){
      _cartItems.putIfAbsent(
          shoesProduct.id,
          () => CartModel(
                id: shoesProduct.id,
                image: shoesProduct.image,
                title: shoesProduct.title,
                description: shoesProduct.description,
                price: shoesProduct.price,
                size: shoesProduct.size,
                color: shoesProduct.color,
                quantity: quantity,
            shoesProduct: shoesProduct
              ));
    }}
    update();
  }

  void addDressItem(DressProduct dressProduct, int quantity) {
    //create a total quantity variable to track the current quantity for a dress item
    //that's for the an item which already exist in the cart.

    if (_cartItems.containsKey(dressProduct.id)) {
      _cartItems.update(dressProduct.id, (value) {
        //set the total quantity to the current quantity of the dress item
        totalQuantity = value.quantity + quantity;
        return CartModel(
            id: value.id,
            title: value.title,
            price: value.price,
            image: value.image,
            description: value.description,
            size: value.size,
            color: value.color,
            quantity: value.quantity + quantity,
            //save the dress item in the cart as well
            dressProduct: dressProduct);
      });
      //use the var totalQuantity to remove the dress item from the cart once the
      //quantity gets to zero
      if (totalQuantity <= 0) {
        _cartItems.remove(dressProduct.id);
      }
    } else {
      //for a new dress item that's not in the cart yet
      //then check if the quantity is greater than zero and add it to the cart
      if (quantity > 0) {
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
                quantity: quantity,
                //save the dress item in the cart model as well
                dressProduct: dressProduct));
      }
    }
    update();
  }

  void addBagItem(Product bagProduct, int quantity) {
    if (_cartItems.containsKey(bagProduct.id)) {
      _cartItems.update(bagProduct.id, (value) {
        totalQuantity = value.quantity + quantity;
        return CartModel(
            id: value.id,
            title: value.title,
            price: value.price,
            image: value.image,
            description: value.description,
            size: value.size,
            color: value.color,
            quantity: value.quantity + quantity,
        bagProduct: bagProduct);
      });
      if(totalQuantity <= 0){
        _cartItems.remove(bagProduct.id);
      }
    } else {
      if(quantity > 0){
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
              quantity:quantity,
            bagProduct: bagProduct,

          ));
    }}
    update();
  }

  void addGlassItem(GlassProduct glassProduct,int quantity) {
    if (_cartItems.containsKey(glassProduct.id)) {
      _cartItems.update(glassProduct.id, (value) {
        totalQuantity = value.quantity + quantity;
        return CartModel(
            id: value.id,
            title: value.title,
            price: value.price,
            image: value.image,
            description: value.description,
            size: value.size,
            color: value.color,
            quantity: value.quantity,
        glassProduct: glassProduct);
      });
      if (totalQuantity <= 0) {
        _cartItems.remove(glassProduct.id);
      }
    } else {
      if(quantity > 0){
      _cartItems.putIfAbsent(
          glassProduct.id,
          () => CartModel(
              id: glassProduct.id,
              title: glassProduct.title,
              price: glassProduct.price,
              image: glassProduct.image,
              description: glassProduct.description,
              size: glassProduct.size,
              color: glassProduct.color,
              quantity:quantity,
          glassProduct: glassProduct));
    }}
    update();
  }

  void removeItem(int id) {
    _cartItems.remove(id);
    update();
  }

  //get the quantity of a specific dress product in the cart
  int getDressQuantity(DressProduct dressProduct) {
    var quantity = 0;
    if (_cartItems.containsKey(dressProduct.id)) {
      _cartItems.forEach((key, value) {
        if (key == dressProduct.id) {
          quantity = value.quantity;
        }
      });
    }
    return quantity;
  }
  int getBagQuantity(Product bagProduct){
    var quantity = 0;
    if(_cartItems.containsKey(bagProduct.id)){
      _cartItems.forEach((key, value) {
        if(key == bagProduct.id){
          quantity = value.quantity;
        }
      });
    }return quantity;
  }
  int getShoesQuantity(ShoesProduct shoesProduct){
    var quantity = 0;
    if(_cartItems.containsKey(shoesProduct.id)){
      _cartItems.forEach((key, value) {
        if(key == shoesProduct.id){
          quantity = value.quantity;
        }
      });

    }
    return quantity;
  }
  int getGlassQuantity(GlassProduct glassProduct){
    var quantity = 0;
    if(_cartItems.containsKey(glassProduct.id)){
      _cartItems.forEach((key, value) {
        if(key == glassProduct.id){
          quantity = value.quantity;
        }
      });
    } return quantity;
  }

  //checks if a dress item already exists in the cart
  bool isDressItemInCart(DressProduct dressProduct) {
    if (_cartItems.containsKey(dressProduct.id)) {
      return true;
    }
    return false;
  }
  bool isBagItemInCart(Product bagProduct){
    if(_cartItems.containsKey(bagProduct.id)){
      return true;
    }else{
      return false;
    }

  }
bool isGlassItemInCart(GlassProduct glassProduct){
    if(_cartItems.containsKey(glassProduct.id)){
      return true;
    }
    return false;
}



bool isShoesInCart(ShoesProduct shoesProduct){
    if(_cartItems.containsKey(shoesProduct.id)){
      return true;
    }
    return false;
}


  List<CartModel> get getItems {
    return _cartItems.entries.map((e) => e.value).toList();
  }
}
