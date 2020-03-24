import 'package:flutter/material.dart';
import '../../res/ListData.dart';

class ListViewDemo extends StatelessWidget {
  
  // List<Widget> _getDate(){
  //   // List<Widget> list = new List();

  //   // for(var i=1; i<=20; i++){
  //   //   list.add(ListTile(
  //   //     title: Text("我是$i列表"),
  //   //   ));
  //   // }
  //   var tempList = listData.map((value){
  //     return ListTile(
  //       title: Text(value["title"]),
  //       subtitle: Text(value["author"]),
  //       leading: Image.network(value["imageUrl"]),
  //     );
  //   });

  //   return tempList.toList();
  // }
  List _list = new List();
  ListViewDemo(){
     for(var i=1; i<=20; i++){
      this._list.add("我是$i列表");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listView"),
      ),
      body: ListView.builder(
        itemCount: this._list.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(this._list[index]),
          );
        },
      )
    );
  }
}