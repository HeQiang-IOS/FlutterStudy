import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.share, 
          size: 30,),
          title: Text(
            "12222", 
            style: TextStyle(
            fontSize: 24
          ),
          ),
          subtitle: Text("222222"),
          trailing: Icon(Icons.pages)
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.share, 
          size: 30,),
          title: Text(
            "12222", 
            style: TextStyle(
            fontSize: 24
          ),
          ),
          subtitle: Text("222222"),
          trailing: Icon(Icons.pages)
        ),
      ],
    );
  }
}