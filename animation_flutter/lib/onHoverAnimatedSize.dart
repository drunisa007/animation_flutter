import 'package:flutter/material.dart';

class OnHoverAnimatedSize extends StatefulWidget {

  late Widget Function(bool isHoverd) builder;

  OnHoverAnimatedSize({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverAnimatedSizeState createState() => _OnHoverAnimatedSizeState();
}

class _OnHoverAnimatedSizeState extends State<OnHoverAnimatedSize> {


  bool isHoverd = false;

  onHoveredEnter(){
    setState(() {
      if(!isHoverd){
       isHoverd = true;
     }
    });
     
  }

   onHoveredExist(){

     setState(() {
       if(isHoverd){
       isHoverd = false;
     }
     });
     
  }


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_)=> onHoveredEnter(),
      onExit: (_)=> onHoveredExist(),
      child: widget.builder(isHoverd),
    );
  }
}
