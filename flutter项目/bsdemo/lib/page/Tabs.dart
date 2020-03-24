import 'package:bsdemo/page/tab/Home.dart';
import 'package:bsdemo/page/tab/Search.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs ({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(index){
    this._currentIndex = index;
  }

  List _pageList = [
    HomePage(),
    SearchPage(),
    HomePage(),
  ];


   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },
        iconSize: 36.0,
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("搜索")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("我的")
          )
        ],
      )
    );
  }
}