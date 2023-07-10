import 'package:get/get.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/model/bag_model.dart';

class ShoesController extends GetxController{
 late CartController _cartController;
  int _quantity = 0;
  int get quantity => _quantity;
  int _retrieveShoeQuantityInCart = 0;
  int get retrieveShoeQuantityInCart => _retrieveShoeQuantityInCart + _quantity;

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity  +1);
    }
    else{
      _quantity = checkQuantity(_quantity -1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if((_retrieveShoeQuantityInCart + quantity) < 0){
      Get.snackbar("Check quantity", "Items is already empty", duration: Duration(milliseconds: 900));
      return 0;
    }else{
      return quantity;
    }
  }
  void initShoeProduct(Product shoesProduct, CartController cartController){
    _quantity = 0;
    _cartController = cartController;
    var exist = false;
    exist = _cartController.isShoesInCart(shoesProduct);
    if(exist){
      _retrieveShoeQuantityInCart = _cartController.getShoesQuantity(shoesProduct);
    }

  }

 void addShoesItem(Product shoesProduct){
   _cartController.addItem(shoesProduct, _quantity);
   _quantity = 0;
   _retrieveShoeQuantityInCart = _cartController.getShoesQuantity(shoesProduct);
   update();
 }

}