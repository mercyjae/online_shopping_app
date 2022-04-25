import 'package:get/get.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/models/bag_product.dart';

class BagController extends GetxController{
  late CartController _cartController;
  int _quantity = 0;
  int get  quantity => _quantity;
  int _retrieveBagQuantityInCart = 0;
  int get retrieveBagQuantityInCart => _retrieveBagQuantityInCart + _quantity;

  void setQuantity(bool isIncrement){
    if(isIncrement){
       _quantity =checkQuantity(quantity + 1);
    }else{
       _quantity =checkQuantity(quantity - 1);
    }
    update();
  }
  int  checkQuantity(int quantity){
    if((retrieveBagQuantityInCart + quantity) < 0){
      Get.snackbar("Check Quantity", "Item is already empty",
          duration: Duration(milliseconds: 900));
      return 0;
    }
      return quantity;


  }

  void initBagProduct(Product bagProduct, CartController cartController){
    _quantity=0;
    _cartController = cartController;

    var exist = false;
    exist = _cartController.isBagItemInCart(bagProduct);
    if(exist){
      _retrieveBagQuantityInCart = _cartController.getBagQuantity(bagProduct);
    }

  }

  void addBagItem(Product bagProduct){
    _cartController.addBagItem(bagProduct, _quantity);
    _quantity = 0;
    _retrieveBagQuantityInCart = _cartController.getBagQuantity(bagProduct);
    update();
  }


}