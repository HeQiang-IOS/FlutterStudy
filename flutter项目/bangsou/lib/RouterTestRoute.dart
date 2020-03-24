import 'package:flutter/material.dart';

import 'TipRoute.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Route'),
      ),
      body: Center(
      child: RaisedButton(
        onPressed: () async {
          var resultA = await Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return TipRoute(text:'我是提示XXX');
          }
          ),
          );
          print('路由返回值： $resultA');
        },
        child: Text("打开提示页"),
      ),
    ),
    );
  }
}