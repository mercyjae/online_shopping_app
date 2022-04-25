 import 'package:get/get.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/models/glasses_products.dart';

class GlassController extends GetxController{
  late CartController _cartController;
  int _quantity = 0;
  int get quantity => _quantity;
  int _retrieveGlassQuantityInCart = 0;
  int get retrieveGlassQuantityInCart => _retrieveGlassQuantityInCart + _quantity;

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity + 1);
    }else{
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_retrieveGlassQuantityInCart + quantity) < 0){
      Get.snackbar("Check Quantity", "Items is already empty",
      duration: Duration(milliseconds: 900));
      return quantity = 0;
    }
   return quantity;
  }

  void initGlassProduct(GlassProduct glassProduct, CartController cartController){
    _quantity = 0;
    _cartController = cartController;
    var exist = false;
    exist = _cartController.isGlassItemInCart(glassProduct);
    if(exist){
      _retrieveGlassQuantityInCart = _cartController.getGlassQuantity(glassProduct);
    }

  }
  void addGlassItem(GlassProduct glassProduct) {
    _cartController.addGlassItem(glassProduct, _quantity);
    _quantity = 0;
    //retrieve the quantity of the dress item in the cart
    _retrieveGlassQuantityInCart =
        _cartController.getGlassQuantity(glassProduct);
    update();
  }
}