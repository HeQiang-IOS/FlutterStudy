import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  TabDemo({Key key}) : super(key: key);

  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 2
    );


    _tabController.addListener((){
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabDemo"),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: "1",),
            Tab(text: "2",),
          ],
        ),
      ),

      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(
            child: Text("1"),
          ),
          Center(
            child: Text("2"),
          ),
        ],
      ),

      
    );
  }
}