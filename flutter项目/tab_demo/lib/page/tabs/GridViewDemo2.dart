import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key key}) : super(key: key);

List<Widget> _getListData() {
  List<Widget> list = new List();
  for (var i = 0; i < 20; i++) {
    list.add(
      Container(
        alignment: Alignment.center,
        child:Text(
          "这是$i条数据",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
        color:Colors.blue,
      )
    );
  }

  return list;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewDemo"),
      ),
      body: GridView.count(
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.only(top: 20),
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        children: this._getListData()
      )
    );
  }
}