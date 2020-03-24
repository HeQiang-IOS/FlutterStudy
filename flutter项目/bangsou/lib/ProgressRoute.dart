import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;

  void initState(){
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animationController.forward();
    _animationController.addListener(()=>setState(()=>{}));
    super.initState();
  }

  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
              value: _animationController.value,
            ),
          ),
        ],
      ),
    );
  }
  
}