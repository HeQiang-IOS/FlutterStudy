import 'package:flutter/material.dart';
import 'package:douban/widgets/search_text_field_widget.dart';

var titleList = ['电影','电视','综艺','读书','音乐','同城'];

List<Widget> tabList;

TabController _tabController;


class BookAudioVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookAudioVideoPageState();
  }

}

class _BookAudioVideoPageState extends State<BookAudioVideoPage> with SingleTickerProviderStateMixin {
  
  var tabBar;

  void initState(){
    super.initState();
    tabBar = HomePageTabBar();
    tabList =  getTabList();
    _tabController = TabController(vsync: this, length: tabList.length);
  }


  List<Widget> getTabList() {
    return titleList.map((item)=>
      Text(
        '$item',
        style: TextStyle(fontSize: 15),
      )
    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(
          length: titleList.length,
          child: _g,
        ),
      ),
    );
  }
}

Widget _getNestedScrollView(Widget tabBar) {
  String hintText = '用一部电影来形容你的2018';
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: SearchTextFieldWidget(
              hintText:hintText,
              onTab:(){
                
              }
            ),
          ),
        ),
        SliverPersistentHeader(
          floating: true,
          pinned: true,
          delegate: _SLiverAppBarDelegate(),
        )
      ];
    },
  );
}

class _SLiverAppBarDelegate extends SliverPersistentHeaderDelegate {

}

class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageTabBarState();
  }


}

class _HomePageTabBarState extends State<HomePageTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}