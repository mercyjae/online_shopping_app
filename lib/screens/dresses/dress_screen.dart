import 'package:flutter/material.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/dress_products.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/dresses/dress_details.dart';

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


class ItemCard2 extends StatelessWidget {
  final DressProduct dressproduct;
  final Function() press;
  const ItemCard2({
    Key? key,
    required this.dressproduct,
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
            const EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: dressproduct.color),
              child: Image.asset(dressproduct.image),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text(
              dressproduct.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: KDefaultPadding - 5),
            child: Text("\$${dressproduct.price}",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          )
        ],
      ),
    );
  }
}