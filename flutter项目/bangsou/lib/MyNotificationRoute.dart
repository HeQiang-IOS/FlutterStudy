import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}


class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() {
    // TODO: implement createState
    return new _NotificationRouteState();
  }
  
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MyNotificationRoute"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification){
          setState(() {
            _msg += notification.msg + " ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context){
                  return RaisedButton(
                    onPressed: ()=>MyNotification("HI").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
  
}