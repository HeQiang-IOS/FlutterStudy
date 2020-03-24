import 'package:flutter/material.dart';

void main() => runApp(MyDrawer());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Scaffold脚手架组件',
      home: new MyHomePage(),
    );
  }
}


class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold脚手架组件Demo'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          )
        ],

        leading: IconButton(
          icon: Icon(Icons.pages),
          tooltip: '首页',
          onPressed: (){},
        ),
      ),
      body: Center(
        child: Text('Scaffold'),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}):super(key: key);
  @override
  _MyHomePageState createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index0:信息'),
    Text('Index1:通讯录'),
    Text('Index2:发现'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: Text('BottomNavigationBar Demo'),
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')),
        ],

        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}


class DefaultTabControllerSample extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一',),
    Tab(text: '选项卡二',)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),

          body: TabBarView(
            children: myTabs.map((Tab tab){
              return Center(child: Text(tab.text),);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DefaultTabController(
        length: items.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('TabBar 选项卡'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: items.map((ItemView item){
                return new Tab(
                  text: item.title,
                  icon: new Icon(item.icon)
                );
              }).toList(),
            ),
          ),

          body: new TabBarView(
            children: items.map((ItemView item){
              return new Padding(
                padding: EdgeInsets.all(16.0),
                child: new SelectedView(item: item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemView {
    const ItemView(this.title, this.icon);
    final String title;
    final IconData icon;    
}

const List<ItemView> items = const <ItemView>[
  const ItemView('自驾',Icons.directions_car),
  const ItemView('自行车', Icons.directions_bike),
  const ItemView('轮船',Icons.directions_boat),
  const ItemView('公交车', Icons.directions_bus),
  const ItemView('火车',Icons.directions_railway),
  const ItemView('步行', Icons.directions_bike),
  const ItemView('自驾',Icons.directions_walk),
];

class SelectedView extends StatelessWidget {

  const SelectedView({Key key, this.item}):super(key:key);
  final ItemView item;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(item.icon, size:128.0, color: textStyle.color),
            new Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
  
}



class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '1',
      home: MyDrawerLayout(),
    );
  }
  
}

class MyDrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('drawer'),
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("hq"),
              accountEmail: Text("1222@qq.con"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.green,
              ),
              onDetailsPressed: (){
                print("userAccount");
              },
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Icon(Icons.toys),
                )
              ],
            ),

            ListTile(
              leading: new CircleAvatar(
                child: Icon(Icons.color_lens),
              ),
              title: Text("个性装扮"),
              onTap: (){
                print("点击");
              },
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(Icons.photo),
              ),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(Icons.wifi),
              ),
              title: Text('免流量特权'),
            )
          ],
        ),
      ),
    );
  }

}
