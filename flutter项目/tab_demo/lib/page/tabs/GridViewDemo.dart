import 'package:flutter/material.dart';
import 'package:tab_demo/res/ListData.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key key}) : super(key: key);

Widget _getListData(context, index) {

    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]['imageUrl']),
          SizedBox(height: 20,),
          Text(listData[index]["title"],
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
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewDemo"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: listData.length,
        itemBuilder: this._getListData,
      )
    );
  }
}