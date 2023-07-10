import 'package:flutter/material.dart';
import 'package:online_shopping/utils/item_card4.dart';
import 'package:online_shopping/model/glasses_products.dart';

import 'eyedetails_screen.dart';

class EyeglassScreen extends StatefulWidget {
  const EyeglassScreen({Key? key}) : super(key: key);

  @override
  State<EyeglassScreen> createState() => _EyeglassScreenState();
}

class _EyeglassScreenState extends State<EyeglassScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: eyeglass.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.90, crossAxisCount: 2),
              itemBuilder: (context, int index) => ItemCard4(
                    glassProduct: eyeglass[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EyeDetails(
                                    glassproduct: eyeglass[index],
                                  )));
                    },
                  )),
        )
      ],
    );
  }
}

