import 'package:animation_flutter/animatedCard.dart';
import 'package:animation_flutter/customAnimatedSize.dart';
import 'package:animation_flutter/customButton.dart';
import 'package:animation_flutter/scrollTestListView.dart';
import 'package:animation_flutter/testing_listview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueAccent
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAnimatedSize());
  }
}





class AnimationBoxes extends StatefulWidget {
  AnimationBoxes({Key? key}) : super(key: key);

  @override
  _AnimationBoxesState createState() => _AnimationBoxesState();
}

class _AnimationBoxesState extends State<AnimationBoxes>
    with TickerProviderStateMixin {
  late AnimationController mAnimationController;
  late Animation mSldingAnimation;
  late Animation mSldingAnimationOne;
  late Animation mSldingAnimationTwo;

  @override
  void initState() {
    super.initState();

    mAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    mSldingAnimation = Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
        parent: mAnimationController,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));

    mSldingAnimationOne = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: mAnimationController,
        curve: Interval(0.0, 1.0, curve: Curves.easeOut)));

    mSldingAnimationTwo = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: mAnimationController,
        curve: Interval(0.43, 1.0, curve: Curves.bounceInOut)));

    mAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    mAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: mAnimationController,
        builder: (context, child) {
          return Column(
            children: [
                Transform(transform: Matrix4.translationValues(0.0, 10.0*mSldingAnimation.value, 0.0),
                child: Opacity(opacity: mSldingAnimationOne.value,
                child: Text("Mac Book Pro 2021")),)
            ],
          );
        });
  }
}
