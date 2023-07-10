import 'package:flutter/material.dart';
import 'package:online_shopping/model/bag_model.dart';

import 'constants.dart';
class ItemCard4 extends StatelessWidget {
  final Product glassProduct;
  final Function() press;
  const ItemCard4({
    Key? key,
    required this.glassProduct,
    required this.press,
  }) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: glassProduct.color),
              child: Image.asset(glassProduct.image),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text(
              glassProduct.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text("\$${glassProduct.price}",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          )
        ],
      ),
    );
  }
}
