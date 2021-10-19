import 'package:flutter/material.dart';
import 'package:online_shopping/constants.dart';
class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List  categories =[
    "Handbag","Footwear"," Jewelries","Dresses"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20,child:
      ListView.builder(itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
        return GestureDetector(onTap: (){
          setState(() {
            selectedIndex=index;
          });
        },
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
            child: Column(children: [
            Text(categories[index],
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,
            color: selectedIndex ==index? KTextColor:KTextLightColor),),
            Container(height: 2,width: 30,color: selectedIndex ==index? Colors.black: Colors.transparent)
            ],),
            ),
            );
          }
    )

    );}
}
