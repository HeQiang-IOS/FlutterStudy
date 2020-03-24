import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.green,);

    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewTestRoute"),
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
          return ListTile(title: Text("$index"),);
        },

        separatorBuilder: (BuildContext context, int index){
          return index%2 == 0? divider1 :divider2;
        },
      ),
    );
  }

}