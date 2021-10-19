import 'package:flutter/material.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/constants.dart';
import 'package:online_shopping/models/products.dart';

class DetailsScreen1 extends StatefulWidget {
  final Product product;
  const DetailsScreen1({Key? key, required this.product}) : super(key: key);

  @override
  _DetailsScreen1State createState() => _DetailsScreen1State();
}

class _DetailsScreen1State extends State<DetailsScreen1> {
   int items = 01;
   void numOfItems1(){
     setState(() {
       items++;
     });
   }
   void numOfItems2(){
     setState(() {
       items--;
     });
   }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  Container(margin: EdgeInsets.only(top: size.height * 0.3),
      height: 400,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text("Color",
              style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),),
            Row(
              children: [
                ColorDot(colors: Colors.blue,isSelected: true,),
                SizedBox(width: KDefaultPadding/2,),
                ColorDot(colors: Colors.amber,isSelected: false,),
                SizedBox(width: KDefaultPadding/2,),
                ColorDot(colors: Colors.grey,isSelected: true,),SizedBox(width: 70,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Text("Size",style:  TextStyle(color: Colors.black45,fontWeight:FontWeight.bold ),),
                      SizedBox(height: KDefaultPadding/2,),
                      Text("${widget.product.size}",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              ],
            ),
            Text(widget.product.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            Row(
              children: [
                IconSign(icon1:Icons.remove, press: () {
                  numOfItems2();
                },),SizedBox(width: 10,),
                Text(items.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(width: 10,),
                IconSign(icon1: Icons.add, press: () {
                  setState(() {
                    numOfItems1();
                  });
                },
                ),Spacer(),
                Container(height: 20,width: 20,
                  decoration: BoxDecoration(color: Colors.red,
                    shape:BoxShape.circle, ),
                  child: Icon(Icons.favorite,color: Colors.white,size: 13,),)],),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 35,width: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8,),
                      border: Border.all(width: 1,color: Colors.blue)),
                  child: IconButton(onPressed: (){},
                      icon:Icon(Icons.add_shopping_cart_outlined,
                        color: Colors.blue,size: 20,)),),
                SizedBox(width: 40,),
                Expanded(
                  child: RaisedButton(
                    color:Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(10)),
                    onPressed: (){},
                    child: Text("BUY NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                )
              ],)
          ],
        ),
      ),
    );
  }
}
