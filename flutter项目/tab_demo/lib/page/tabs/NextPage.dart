import 'package:flutter/material.dart';
import 'package:tab_demo/page/Tabs.dart';


class NextPage extends StatefulWidget {
  Map arguments;
  NextPage({Key key, this.arguments}) : super(key: key);

  _NextPageState createState() => _NextPageState(arguments: this.arguments);
}

class _NextPageState extends State<NextPage> {
  Map arguments;
  _NextPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${this.arguments.toString()}"),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            child: Text("finish"),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context)=> new Tabs(index: 1,)), 
              (route) => route == null
              );
            },
          ),
        ],
      ),
    );
  }
}