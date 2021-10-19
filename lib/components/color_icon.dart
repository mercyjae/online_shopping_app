import 'package:flutter/material.dart';
class IconSign extends StatelessWidget {
final IconData icon1;
final Function() press;
const IconSign({
Key? key, required this.icon1, required this.press,
}) : super(key: key);
@override
Widget build(BuildContext context) {
  return
    Container(height: 35,width: 35,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1, color: Colors.grey,)),
    child: IconButton(onPressed: press,icon: Icon(icon1,size: 20,
    )),);
  }
  }

class ColorDot extends StatelessWidget {
  final Color colors;
  final bool isSelected;
  const ColorDot({
    Key? key, required this.colors,required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: (){},
      child: Row(children: [
        Container(width:20,height: 20,
          decoration: BoxDecoration(color:isSelected ? colors: Colors.transparent ,
              shape: BoxShape.circle,
              border: Border.all(width: 2,color: Colors.grey)),)
      ],),
    );
  }
}
