import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.yellow,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(text: "推荐0"),
                    Tab(text: "推荐1"),
                    Tab(text: "推荐2"),
                    Tab(text: "推荐3"),
                    Tab(text: "推荐4"),
                    Tab(text: "推荐5"),
                    Tab(text: "推荐6"),
                    Tab(text: "推荐7"),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                ),
                ListTile(
                  title: Text("第一个tab"),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第2个tab"),
                ),
                ListTile(
                  title: Text("第2个tab"),
                ),
                
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第3个tab"),
                ),
                ListTile(
                  title: Text("第3个tab"),
                ),
                
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第4个tab"),
                ),
                ListTile(
                  title: Text("第4个tab"),
                ),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第5个tab"),
                ),
                
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第6个tab"),
                ),
                
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第7个tab"),
                ),
                
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第8个tab"),
                ),
                ListTile(
                  title: Text("第8个tab"),
                ),
                ListTile(
                  title: Text("第8个tab"),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}