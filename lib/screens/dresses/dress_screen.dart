import 'package:flutter/material.dart';
import 'package:online_shopping/components/item_card2.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/views/dresses/dress_details.dart';
import 'package:online_shopping/views_model/bag_product.dart';
import 'package:online_shopping/views_model/dress_products.dart';

class DressScreen extends StatefulWidget {
  const DressScreen({Key? key}) : super(key: key);
  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.90, crossAxisCount: 2),
              itemBuilder: (context, int index) => ItemCard2(
                    dressproduct: dress[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DressDetails(
                                    dressproduct: dress[index],
                                  )));
                    },
                  )),
        )
      ],
    );
  }
}
