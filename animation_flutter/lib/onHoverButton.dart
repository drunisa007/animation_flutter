import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  late Widget child;

  OnHoverButton({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;



  @override
  Widget build(BuildContext context) {
    
    final hoverTransform = Matrix4.identity()..translate(0.0,-8.0,0.0);
     final letTranform = isHovered?hoverTransform:Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => changeHoverd(true),
      onExit: (_) => changeHoverd(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: letTranform ,
        child: widget.child,
      ),
    );
  }

  changeHoverd(bool value) {
    setState(() {
      isHovered = value;
    });
  }
}
