import 'package:flutter/material.dart';

import 'EventBus.dart';

class DragTestRoute extends StatefulWidget {
  @override
  _DragState createState() {
    // TODO: implement createState
    return new _DragState();
  }
  
}


class _DragState extends State<DragTestRoute> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

    var bus = new EventBus();

  void initSate(){
    bus.emit("login",'aa');
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (DragDownDetails e){
                print("用户手指按下： ${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },

              onPanEnd: (DragEndDetails e){
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }

}
