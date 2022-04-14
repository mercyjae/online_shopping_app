import 'package:get/get.dart';
import 'package:online_shopping/models/cart_model.dart';
import 'package:online_shopping/models/dress_products.dart';

class DressController extends GetxController{
  var cartItems1 = <DressProduct>[].obs;
  Map<int, CartModel> cartitems = {};

  void addToCart (DressProduct dressproduct){
    cartItems1.add(dressproduct);

  }



  void addItem(DressProduct dressProduct){
    if(cartitems.putIfAbsent(dressProduct.id, () =>
        CartModel(id: dressProduct.id,
            image: dressProduct.image, title: dressProduct.title,
            description: dressProduct.description, price: dressProduct.price,
            size: dressProduct.size, color: dressProduct.color)))
  }
}