import 'package:get/get.dart';
import 'package:online_shopping/models/dress_products.dart';

class DressController extends GetxController {
  //final CartController cartController;

  //DressController({required this.cartController});
  var cartItems1 = <DressProduct>[].obs;

  void addToCart(DressProduct dressProduct) {
    cartItems1.add(dressProduct);
  }
}
