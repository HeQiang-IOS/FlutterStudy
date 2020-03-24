import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "asdflkjhgfdsdfghjkljhgfdsqwertyuytre";
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollViewTestRoute"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("").map((c)=>Text(c, textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }

}