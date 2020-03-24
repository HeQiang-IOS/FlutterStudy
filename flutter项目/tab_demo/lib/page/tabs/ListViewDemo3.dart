import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child:ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          height: 180,
          width: 180,
          color: Colors.red,
        ),

         Container(
          height: 180,
          width: 180,
          color: Colors.blue,
        ),

         Container(
          height: 180,
          width: 180,
          color: Colors.green,
        ),

         Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
      ],
    ),
    );
  }
}