import 'package:douban/pages/shop/shop_page.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}):super(key:key);
  @override
  _ContainerPageState createState() {
    // TODO: implement createState
    return new _ContainerPageState();
  }
}

class _Item{
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  final ShopPageWidget shopPageWidget = ShopPageWidget();
  List<Widget> pages;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  List<BottomNavigationBarItem> itemList;

  void initState(){
    super.initState();
    if(pages == null) {
      pages = [
        shopPageWidget,
        shopPageWidget,
        shopPageWidget,
        shopPageWidget,
        shopPageWidget,
      ];
    }

    if(itemList == null) {
      itemList = itemNames.map((item) => BottomNavigationBarItem(
        icon: Image.asset(
          item.normalIcon,
          width:30.0,
          height: 30.0
        ),
        title: Text(
          item.name,
          style: TextStyle(fontSize: 10.0),
        ),
        activeIcon: Image.asset(
          item.activeIcon,
          width: 30.0,
          height: 30.0,
        ),
      )).toList();
    }
  }

  int _selectIndex = 0;

  Widget _getPagesWidget(int index) {
    print(index);
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index], 
      ),
    );
  }
 
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  } 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),

      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index){
          setState(() {
            _selectIndex = index;
            shopPageWidget.setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },

        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}