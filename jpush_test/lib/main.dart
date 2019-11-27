import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String debugLable = 'Unknown';
  final JPush jPush = new JPush();
  @override
  void initState() { 
    super.initState();
    initPlatformState();
  }


  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      jPush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
          setState(() {
            debugLable = '接收到推送： ${message}';
          });
        }
      );
    } on PlatformException{
      platformVersion = '平台版本获取失败，请查看';
    }

    if (!mounted) {
      return;
    }

    setState(() {
      debugLable = platformVersion;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('极光推送'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('结果：$debugLable'),
              FlatButton(
                child: Text('发送推送消息'),
                onPressed: (){
                  var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
                  var localNotification = LocalNotification(
                    id: 234,
                    title: '111',
                    buildId: 1,
                    content:'kandd',
                    fireTime: fireDate,
                    subtitle: 'yi',
                  );

                  jPush.sendLocalNotification(localNotification).then((res){
                    setState(() {
                      debugLable = res;
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}