import 'package:bsdemo/config/service_method.dart';
import 'package:bsdemo/model/PageListModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  EasyRefreshController _controller;
  // 条目总数
  int _count = 1;
  PageListModel _pageListModel;
  List<PageList> listPage;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("上拉加载下拉刷新"),
        ),
        body: FutureBuilder(
          future: request('pageListContext', formData: {
            "keyword": "",
            "page": {"current": this._count, "size": 10}
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              this._pageListModel = PageListModel.fromJson(snapshot.data);
              if (this._count == 1) {
                this.listPage = this._pageListModel.data;
              } else {
                this.listPage.addAll(this._pageListModel.data);
              }

              return EasyRefresh.custom(
                enableControlFinishRefresh: false,
                enableControlFinishLoad: true,
                controller: _controller,
                header: ClassicalHeader(),
                footer: ClassicalFooter(),
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    print('onRefresh');
                    setState(() {
                      _count = 1;
                    });
                    _controller.resetLoadState();
                  });
                },
                onLoad: () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    print('onLoad');
                    setState(() {
                      _count += 1;
                    });
                    _controller.finishLoad(noMore: _count >= 40);
                  });
                },
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: ListTile(
                            title: Text(this.listPage[index].name),
                            subtitle: Text(this.listPage[index].remark),
                            leading: Image.network(
                              this.listPage[index].imgUrl,
                              height: 128,
                              width: 128,
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/pageDetail',
                                  arguments: {'id': this.listPage[index].id});
                            },
                          ),
                        );
                      },
                      childCount: this.listPage.length,
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("加载中～～"),
              );
            }
          },
        ));
  }
}
