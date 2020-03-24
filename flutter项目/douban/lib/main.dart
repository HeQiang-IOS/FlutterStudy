import 'dart:io';

import 'package:douban/pages/splash/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if(Platform.isAndroid){
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Colors.white),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SplashWidget(),
        ),
      ),
    );
  }
}


class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key key, @required this.child}):assert(child !=null), super(key:key);
  
  static restartApp(BuildContext context) {
    final _RestartWidgetState state = context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>()) ;
    state.restartApp();
  }
  
  
  @override
  _RestartWidgetState createState() {
    // TODO: implement createState
    return new _RestartWidgetState();
  }

}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}