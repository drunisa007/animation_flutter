import 'package:flutter/material.dart';

class OnHoverCard extends StatefulWidget {
  late Widget Function(bool isHoverd) builder;

  OnHoverCard({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverCardState createState() => _OnHoverCardState();
}

class _OnHoverCardState extends State<OnHoverCard> {
  bool onHover = false;



  @override
  Widget build(BuildContext context) {

  final matrixTransform = Matrix4.identity()..translate(0,-8,0);
  
  final realTransform = onHover?matrixTransform:Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHoverdChange(true),
      onExit: (_) => onHoverdChange(false),
      child: widget.builder(onHover),
    );
  }

  onHoverdChange(bool values) {
    setState(() {
      onHover = values;
    });
  }
}
