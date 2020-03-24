import 'package:flutter/material.dart';
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          // image: new AssetImage('images/aa.png'),
          image: new NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
        ),
      ),
    );
  }
}