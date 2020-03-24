import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRouteState createState() {
    // TODO: implement createState
    return new _WillPopScopeTestRouteState();
  }

}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {

  DateTime _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      onWillPop: () async {
        if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
           _lastPressedAt = DateTime.now();
           return false;
          }
          return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连接按两次返回键退出"),
      ),
    );
  }

  
}