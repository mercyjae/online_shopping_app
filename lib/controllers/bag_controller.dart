import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:online_shopping/models/bag_product.dart';

class BagController extends GetxController {
  //add  a dict to store the products in the cart
  //var _products = {}.obs;
  var cartItems = <Product>[].obs;

  //void addProduct()
//   dynamic addProduct(Product product){
//   if (_products.containsKey(product)){
//     _products[product] += 1;
//     print("product data : $_products");
//   }else{
//     _products[product] = 1;
//     print("product info : $_products");
//   }
//   var cart = _products.containsKey(product);
//   print("$cart");
//   Get.snackbar("Product Added","You have added the ${product.title} to the cart",
//   snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 3));
// }

  //get products =>_products;

  void addToCart(Product product) {
    cartItems.add(product);
    // print("$cartItem");
    Get.snackbar(
        "Product Added", "You have added the ${product.title} to the cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3));
  }

//void removeProduct()

//get products

//get productSubTotal

//get total

}
