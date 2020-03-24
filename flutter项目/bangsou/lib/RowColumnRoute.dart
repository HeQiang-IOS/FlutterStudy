import 'package:flutter/material.dart';

class RowColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RowColumnRoute"),
      ),

      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              
              Container(
                color: Colors.red,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),

                    Row(
                      children: <Widget>[
                        Text("1222"),
                        Text("Hello World"),
                      ],
                    )
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }

}