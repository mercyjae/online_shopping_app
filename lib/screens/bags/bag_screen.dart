import 'package:flutter/material.dart';

import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/bag_product.dart';
import 'package:online_shopping/screens/bags/details_screen.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.90),
                itemBuilder: (context, int index) => ItemCard(
                      product: products[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(product: products[index])));
                      },
                    )))
      ],
    );
  }
}


class ItemCard extends StatelessWidget {
final Product product;
final Function() press;
const ItemCard({Key? key, required this.product, required this.press})
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
          const EdgeInsets.symmetric(horizontal: KDefaultPadding / 2),
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
