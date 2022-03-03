import 'package:animation_flutter/onHoverAnimatedSize.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSize extends StatefulWidget {
  const CustomAnimatedSize({ Key? key }) : super(key: key);

  @override
  _AnimatedSizeState createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<CustomAnimatedSize> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OnHoverAnimatedSize(
        builder: (bool value){
          return Container(
            width: 200,
            height: 200,
            color: Colors.white,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
               Container(
                 child: Text("Mouser"),
               ),
               SizedBox(
                 height: 6,
               ),
              AnimatedSize(
                 duration: Duration(milliseconds: 300),
                 alignment: Alignment.centerLeft,
                 curve: Curves.linear,
                 child: Container(
                   width: value?40:0,
                   height: 2,
                   decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                   ),
                 ),
               )
            ],
                  ),
          );
        },
      )
    );
  }
}