import 'package:get/get.dart';
import 'package:online_shopping/controllers/cart_controller.dart';
import 'package:online_shopping/models/dress_products.dart';

class DressController extends GetxController {
  //declare a late variable for the cart controller
  late CartController _cartController;
  int _quantity = 0;
  int get quantity => _quantity;
  int _retrieveDressQuantityInCart = 0;
  int get retrieveDressQuantityInCart =>
      _retrieveDressQuantityInCart + _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    /*now we check if the quantity for when the product is available
    in the cart or not and compare if it is less than zero.*/
    if ((_retrieveDressQuantityInCart + quantity) < 0) {
      Get.snackbar(
        'Check Quantity',
        'Item is already empty',
        duration: const Duration(milliseconds: 900),
      );
      return 0;
    }
    return quantity;
  }

  //initialize the current dress product when you navigate to the dress page
  //which is after a dress item is selected from the dress list.
  //also initialize the cart controller to be used to retrieve the quantity of the dress in the cart
  //and also check if a dress already exist in the cart
  void initDressProduct(
      DressProduct dressProduct, CartController cartController) {
    _quantity = 0;
    _cartController = cartController;
    //now let's handle the case for when a dress product already exists in the cart
    var exist = false;
    exist = _cartController.isDressItemInCart(dressProduct);
    //check if it exists in the cart and if it does, then retrieve the quantity
    //and set it to the dress quantity in cart
    if (exist) {
      _retrieveDressQuantityInCart =
          _cartController.getDressQuantity(dressProduct);
    }
  }

  void addDressItem(DressProduct dressProduct) {
    _cartController.addDressItem(dressProduct, _quantity);
    _quantity = 0;
    //retrieve the quantity of the dress item in the cart
    _retrieveDressQuantityInCart =
        _cartController.getDressQuantity(dressProduct);
    update();
  }
}
