import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter',
      home: new PageHomeWidget(),
    );
  }
}

class PageHomeWidget extends StatelessWidget {
  const PageHomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var center = new Center(
            child: new Text("hello world"),
          );
        return Container(
          child: center,
    );
  }
}