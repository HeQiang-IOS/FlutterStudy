import 'package:bangsou/AlignTestRoute.dart';
import 'package:bangsou/CustomPaintRoute.dart';
import 'package:bangsou/CustomScrollViewTestRoute.dart';
import 'package:bangsou/DemoLocalizations.dart';
import 'package:bangsou/DioTestRoute.dart';
import 'package:bangsou/DragTestRoute.dart';
import 'package:bangsou/FlexLayoutTestRoute.dart';
import 'package:bangsou/FutureBuilderTestRoute.dart';
import 'package:bangsou/GestureDetectorTestRoute.dart';
import 'package:bangsou/GradientButtonRoute.dart';
import 'package:bangsou/HttpTestRoute.dart';
import 'package:bangsou/InfiniteGridView.dart';
import 'package:bangsou/InfiniteListView.dart';
import 'package:bangsou/ListViewTestRoute.dart';
import 'package:bangsou/ListenerTest.dart';
import 'package:bangsou/MyForm.dart';
import 'package:bangsou/MyTextField.dart';
import 'package:bangsou/Mybtn.dart';
import 'package:bangsou/Myimage.dart';
import 'package:bangsou/NewRoute.dart';
import 'package:bangsou/PaddingTestRoute.dart';
import 'package:bangsou/ProgressRoute.dart';
import 'package:bangsou/RouterTestRoute.dart';
import 'package:bangsou/RowColumnRoute.dart';
import 'package:bangsou/ScrollControllerTestRoute.dart';
import 'package:bangsou/ScrollNotificationTestRoute.dart';
import 'package:bangsou/SingleChildScrollViewTestRoute.dart';
import 'package:bangsou/StackTestRoute.dart';
import 'package:bangsou/StreamBuilderTestRoute.dart';
import 'package:bangsou/SwitchAndCheckBoxTestRoute.dart';
import 'package:bangsou/TipRoute.dart';
import 'package:bangsou/TurnBoxRoute.dart';
import 'package:bangsou/WebSocketRoute.dart';
import 'package:bangsou/WillPopScopeTestRoute.dart';
import 'package:bangsou/WrapFlowTestRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'CupertinoTestRoute.dart';
import 'MyNotificationRoute.dart';
import 'MyText.dart';
import 'ParentWidget.dart';
import 'ParentWidgetC.dart';
import 'TapboxA.dart';

void main(List<String> args) {
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate(),
      ],

      supportedLocales: [
        const Locale('en','US'),
        const Locale('zh','CN')
      ],


        title: 'Demo 1',
        initialRoute: "aa",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          'new_route': (context) => NewRoute(),
          // "new_route":(context)=>EchoRoute(),
          "aa": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          //注册首页路由
          "tip2": (context) {
            return TipRoute(text: ModalRoute.of(context).settings.arguments);
          }
        },
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
            print('routeName');
          });
        }
        // home: new MyHomePage(title: 'Demo 1'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text(widget.title),
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('1'),
            new Text('2'),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return NewRoute();
                // }));
                Navigator.pushNamed(context, "new_route");
                // Navigator.of(context).pushNamed("new_route", arguments:"hi");
              },
            ),
            FlatButton(
              child: Text('open RouterTestRoute'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RouterTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text('open CupertinoTestRoute'),
              textColor: Colors.green,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new CupertinoTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("TapboxA"),
              textColor: Colors.grey,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new TapboxA();
                }));
              },
            ),
            FlatButton(
              child: Text("ParentWidget"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new ParentWidget();
                }));
              },
            ),
            FlatButton(
              child: Text('ParentWidgetC'),
              textColor: Colors.orange,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new ParentWidgetC();
                }));
              },
            ),
            FlatButton(
              child: Text("MyText"),
              textColor: Colors.pink,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new MyText();
                }));
              },
            ),

            FlatButton(
              child: Text("Mybtn"),
              textColor: Colors.purple,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return Mybtn();
                }));
              },
            ),

            FlatButton(
              child: Text('Myimage'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return new Myimage();
                }));
              },
            ),

            FlatButton(
              child: Text('MyTextField'),
              textColor: Colors.red,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return new MyTextField();
                }));
              },
            ),

            FlatButton(
              child: Text("FormTestRoute"),
              textColor: Colors.green,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return new CustomPaintRoute();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}


class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return null;
  }
}


