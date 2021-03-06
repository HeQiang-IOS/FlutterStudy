import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() {
    // TODO: implement createState
    return new _GestureDetectorTestRouteState();
  }

}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {

   String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation, style: TextStyle(color:Colors.red)),
          ),

          onTap: () => updateText("tap"),
          onDoubleTap: () => updateText("doubleTap"),
          onLongPress: () => updateText("longPress"),
        ),
      ),
    );
  }
  
  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }
}

