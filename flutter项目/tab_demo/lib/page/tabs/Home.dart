import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:tab_demo/page/tabs/Form.dart';
import 'package:tab_demo/provider/Counter.dart';
import 'WarpDemo.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("跳转FormPage"),
            onPressed: (){
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context)=> FormPage(title: "toFormPage")
              //   )
              // );
            Navigator.pushNamed(context, "/form", arguments: {
              "id":'122'
            });
            // Navigator.pushNamed(context, "/tabDemo");
            },
          ),

          Provide<Counter>(
            builder: (context, child, counter){
              return Text("${counter.value}",
              style: Theme.of(context).textTheme.display1,
              );
            },
          )
        ],
      ),
    );
  }
}