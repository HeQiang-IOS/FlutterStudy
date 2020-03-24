import 'package:flutter/material.dart';
import 'package:tab_demo/res/ListData.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key key}) : super(key: key);

List<Widget> _getListData() {
  var tempList = listData.map((value){
    return Container(
      child: Column(

        children: <Widget>[
          Image.network(value['imageUrl']),
          SizedBox(height: 20,),
          Text(value["title"],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20
          ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(233, 233, 233, 1),
          width: 1
        )
      ),
    );
  }).toList();
  return tempList;
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
        // childAspectRatio: 0.7,
        children: this._getListData()
      )
    );
  }
}