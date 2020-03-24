
import 'package:flutter/material.dart';

class AlignTestRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AlignTestRoute"),
      ),

      body: Container(
        // height: 120,
        // width: 120,
        color: Colors.blue[50],
        child: Align(
          widthFactor: 2,
          heightFactor: 2,
          // alignment: Alignment.topRight,
          // alignment: Alignment(2,0.0),
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }

}