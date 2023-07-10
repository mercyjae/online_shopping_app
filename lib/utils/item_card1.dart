import 'package:flutter/material.dart';
import 'package:online_shopping/model/bag_model.dart';

import 'constants.dart';

class ItemCard1 extends StatelessWidget {
  final Product product;
  final Function() press;
  const ItemCard1({Key? key, required this.product, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
             EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5, horizontal: KDefaultPadding - 5),
            child: Text(
              product.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text(
              "\$${product.price}",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}