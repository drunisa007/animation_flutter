import 'package:animation_flutter/onHoverButton.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OnHoverButton(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue,width: 2),
            shape: StadiumBorder()
          ),
          onPressed: () {
            print("hello world");
          },
          child: Text('hellowrold'),
        ),
      ),
    );
  }
}
