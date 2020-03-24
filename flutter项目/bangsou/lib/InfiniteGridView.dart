import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  _InfiniteGridViewState createState() =>  new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = [];

  void initState(){
    _retrieveIcons();
  }

  void _retrieveIcons(){
    Future.delayed(Duration(milliseconds:200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
          ]
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InfiniteGridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index){
          if(index == _icons.length-1 && _icons.length < 200){
            _retrieveIcons();
          }

          return Icon(_icons[index]);
        },
      ),
    );
  }
  
}