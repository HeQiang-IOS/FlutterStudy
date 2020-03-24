import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:tab_demo/page/tabs/GridViewDemo.dart';
import 'package:tab_demo/page/tabs/ListViewDemo.dart';
import 'package:tab_demo/page/tabs/WarpDemo.dart';
import 'tabs/Home.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index =0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex;
   _TabsState(index) {
     this._currentIndex = index;
   }


   List _pageList = [
     HomePage(),
     SettingPage(),
     ListViewDemo(),
     GridViewDemo(),
     WarpDemo(),
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
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("设置")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text("ListView")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("GridView")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup),
            title: Text("Warp")
          ),
        ],
      ),


     drawer: Drawer(
       child: Column(
         children: <Widget>[
          //  Row(
          //    children: <Widget>[
          //     Expanded(
          //       child: DrawerHeader(
          //       child: Text("1"),
          //    decoration: BoxDecoration(
          //     //  color: Colors.yellow
          //     image: DecorationImage(
          //       image: NetworkImage("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"),
          //       fit: BoxFit.cover
          //     )
          //    ),
          //    ),
          //  ),
          //    ],
          //  ),

          UserAccountsDrawerHeader(
            accountName: Text("userName"),
            accountEmail: Text("email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.yellow,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"),
                fit: BoxFit.cover
              )
            ),

            otherAccountsPictures: <Widget>[
              Image.network("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg")
            ],
          ),
          
           Divider(),
           ListTile(
             leading: CircleAvatar(
               child: Icon(Icons.people),
             ),
             title: Text("user center"),
             onTap: (){
               Navigator.of(context).pop();
               Navigator.pushNamed(context, '/userPage');
             },
           ),
           
           Divider(),
           ListTile(
             leading: CircleAvatar(
               child: Icon(Icons.settings),
             ),
             title: Text("setting"),
           ),
         ],
       ),
     ),

     endDrawer: Drawer(
       child: Text("end"),
     ),


     floatingActionButton: Container(
       height: 80,
       width: 80,
      //  color: Colors.yellow,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 10),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(40),
         color: Colors.white,
       ),
       child: FloatingActionButton(
       child: Icon(Icons.add),
       onPressed: (){
         setState(() {
           this._currentIndex = 2;
         });
       },
       backgroundColor: this._currentIndex==2 ? Colors.red: Colors.yellow,
     ),
     ),

     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}