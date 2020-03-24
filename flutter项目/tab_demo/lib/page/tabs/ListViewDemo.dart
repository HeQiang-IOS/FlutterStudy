import 'package:flutter/material.dart';
import '../../res/ListData.dart';
import '../Tabs.dart';
class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _getListData(context, index) {
    return ListTile(
      title: Text(listData[index]["title"]),
      subtitle: Text(listData[index]["author"]),
      leading: Image.network(listData[index]["imageUrl"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDemo"),
        backgroundColor: Colors.red,
        leading: IconButton(
          iconSize: 40,
          icon: Icon(Icons.menu),
          onPressed: (){

          },
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 40,
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context)=> new Tabs(index: 1,)), 
              (route) => route == null
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: this._getListData,
      ),
    );
  }
}