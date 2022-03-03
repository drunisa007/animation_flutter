import 'dart:async';

import 'package:flutter/material.dart';

class TestingListView extends StatefulWidget {
  TestingListView({Key? key}) : super(key: key);

  @override
  _TestingListViewState createState() => _TestingListViewState();
}

class _TestingListViewState extends State<TestingListView>
    with SingleTickerProviderStateMixin {
  late AnimationController mAnimationController;

  @override
  void initState() {
    mAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    Timer(Duration(milliseconds: 200), () => mAnimationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    mAnimationController.dispose();
    super.dispose();
  }

  getAnimationStyle(int index) {
    late Animation<Offset> mAnimation;

    mAnimation = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: mAnimationController,
            curve: Interval(index * 0.1,1.0,
                curve: Curves.fastOutSlowIn)));
    return mAnimation;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ListViewSingle(mAnimation: mAnimationController,index:  index,);
        },
        itemCount: 5);
  }

}


class ListViewSingle extends StatelessWidget {

  const ListViewSingle({Key? key,required this.mAnimation,required this.index}) : super(key: key);

  final AnimationController mAnimation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 1.0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: mAnimation,
            curve: Interval(index * 0.1,1.0,
                curve: Curves.fastOutSlowIn))),
      child: FadeTransition(
        opacity:mAnimation,
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text'),
        ),
      ),
    );
  }
}
