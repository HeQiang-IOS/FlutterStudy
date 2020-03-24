import 'package:flutter/material.dart';

class WarpDemo extends StatelessWidget {
  const WarpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WarpDemo"),
      ),
      body: Container(
        height: 600,
        width: 400,
        color: Colors.red,
        child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.end,
        direction: Axis.vertical,
        children: <Widget>[
          MyButton("1"),
          MyButton("2"),
          MyButton("3"),
          MyButton("4"),
          MyButton("5"),
          MyButton("6"),
          MyButton("7"),
          MyButton("8"),
          MyButton("9"),
          MyButton("10"),
          MyButton("11"),
        ],
      ),
      )
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: (){
        print(this.text);
      },
    );
  }
}