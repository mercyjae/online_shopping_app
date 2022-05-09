import 'package:get/get.dart';
import 'package:online_shopping/views_model/bag_product.dart';
import 'package:online_shopping/views_model/cart_model.dart';

class CartController extends GetxController {
  Map<int, CartModel> _cartItems = {};
  Map<int, CartModel> get cartItems => _cartItems;

  int quantity = 0;
  int totalPrice = 0;
  var totalQuantity = 0;


  int  totalAmount() {
    var totalAmount = 0;
     _cartItems.forEach((key, value) {
      totalAmount += value.quantity * value.price;

    });
    return totalAmount;
  }

  void addItem(Product product, int quantity) {
    //create a total quantity variable to track the current quantity for a dress item
    //that's for the an item which already exist in the cart.

    if (_cartItems.containsKey(product.id)) {
      _cartItems.update(product.id, (value) {
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
            product: product
        );
      });
      //use the var totalQuantity to remove the dress item from the cart once the
      //quantity gets to zero
      if (totalQuantity <= 0) {
        _cartItems.remove(product.id);
      }
    } else {
      //for a new dress item that's not in the cart yet
      //then check if the quantity is greater than zero and add it to the cart
      if (quantity > 0) {
        _cartItems.putIfAbsent(
            product.id,
            () => CartModel(
                id: product.id,
                title: product.title,
                price: product.price,
                image: product.image,
                description: product.description,
                size: product.size,
                color: product.color,
                quantity: quantity,
                //save the dress item in the cart model as well
              product: product
            ));
      }
    }
    update();
  }



  void removeItem(int id) {
    _cartItems.remove(id);
    update();
  }

  //get the quantity of a specific dress product in the cart
  int getDressQuantity(Product dressProduct) {
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
  int getShoesQuantity(Product shoesProduct){
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
  int getGlassQuantity(Product glassProduct){
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
  bool isDressItemInCart(Product dressProduct) {
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
bool isGlassItemInCart(Product glassProduct){
    if(_cartItems.containsKey(glassProduct.id)){
      return true;
    }
    return false;
}



bool isShoesInCart(Product shoesProduct){
    if(_cartItems.containsKey(shoesProduct.id)){
      return true;
    }
    return false;
}



  List<CartModel> get getItems {
    return _cartItems.entries.map((e) => e.value).toList();
  }
}
