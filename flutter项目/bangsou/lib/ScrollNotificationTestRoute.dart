

import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget{
  @override
  _ScrollNotificationTestRouteState createState() {
    // TODO: implement createState
    return new _ScrollNotificationTestRouteState();
  }

}

class _ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {
  
  String _progress = "0%";
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScorllNotification"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification){
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: %{notification.metrics.extentAfter == 0}");
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index){
                  return ListTile(title: Text("$index"),);
                },
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }

  
}