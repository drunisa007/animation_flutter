import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollTestListView extends StatefulWidget {
  const ScrollTestListView({Key? key}) : super(key: key);

  @override
  State<ScrollTestListView> createState() => _ScrollTestListViewState();
}

class _ScrollTestListViewState extends State<ScrollTestListView> {

ScrollController mScrollController = ScrollController();

bool show = false;

  @override
  void dispose() {
    mScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   


    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification noti){
          
          if(noti.metrics.pixels>150){
           setState(() {
             if(!show){
               show = true;
             }
           
           });
          }
          else if(noti.metrics.pixels<150){
            setState(() {
              if(show){
              show = false;
            }
            });
            
          }
   
          // if(noti.direction== ScrollDirection.forward){
          //     print("this is working");
          // }
          // else if(noti.direction==ScrollDirection.reverse){
          //      print("this is reverse working");
          //      print(noti.metrics.pixels);
          // }
          return true;
        },
        child: ListView.builder(controller: mScrollController,itemCount:100,itemBuilder: (context,index){
          return ListTile(title: Text("Item $index"),);
        }),
      ),
      floatingActionButton: show?FloatingActionButton(
        onPressed: (){
            mScrollController.jumpTo(mScrollController.position.maxScrollExtent);
        },
        child: Icon(Icons.add),
      ):Container()
    );
  }
}