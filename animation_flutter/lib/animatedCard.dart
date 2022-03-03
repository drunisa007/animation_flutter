import 'package:animation_flutter/onHoverCard.dart';
import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key}) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: _height * 30 / 100,
        height: _height * 30 / 100,
        child: OnHoverCard(
          builder: (isHover) {
            print("isHover is working $isHover");
            return Stack(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isHover ? 0 : 1,
                  curve: Curves.easeOut,
                  child: Image.network(
                      "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                      fit: BoxFit.cover,
                      width: _height * 30 / 100,
                      height: _height * 30 / 100),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isHover ? 1 : 0,
                  curve: Curves.easeIn,
                  child: Container(
                    width: _height * 30 / 100,
                    height: _height * 30 / 100,
                    child: Center(
                        child: Text(
                      'hello world',
                      style:TextStyle(color: Colors.blue)
                    )),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
