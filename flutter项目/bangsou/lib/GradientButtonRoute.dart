import 'package:bangsou/GradientButton.dart';
import 'package:flutter/material.dart';

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() {
    // TODO: implement createState
    return new _GradientButtonRouteState();
  }
  
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  onTap(){
    print("button click");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GradientButtonRoute"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: onTap,
            ),

            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("commit"),
              onPressed: onTap,
            ),

            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300],Colors.blueAccent],
              child: Text("提交"),
              onPressed: onTap,

            ),
          ],
        ),
      ),
    );
  }
  
}