import 'dart:convert';
import 'dart:core';
import 'dart:io';



import 'package:bsdemo/config/service_method.dart';
import 'package:bsdemo/model/HomeModel.dart';
import 'package:bsdemo/model/HomeModelList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText = '还没有请求数据';
  HomeModelList _modelList;
  @override
  Widget build(BuildContext context) {
    //  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: FutureBuilder(
        future: requestGet("homePageContext"),
        builder: (context, snapshot){
          if(snapshot.hasData){
            this._modelList = HomeModelList.fromJson(snapshot.data);
            return ListView.builder(
              itemCount: this._modelList.data.length,
              itemBuilder: this._getListData,
            );
          }else {
            return Center(
              child: Text("加载中～～"),
            );
          }
        },
      )
    );
  }


  Widget _getListData(context, index) {
    return ListTile(
      title: Text(this._modelList.data[index].name),
      subtitle: Text(this._modelList.data[index].remark),
      leading: Image.network(this._modelList.data[index].imgUrl, fit: BoxFit.cover, height: 128.0, width: 128.0,),
      onTap: (){
        Navigator.pushNamed(context, '/pageDetail', arguments: {
          'id': this._modelList.data[index].id
        });
      },
    );
  }

  void _jike() async {
    print('开始向极客时间请求数据..................');
    // getHttp().then((val) {
    //   setState(() {
    //     //  showText=val['data'].toString();
    //   });
    // });

    await requestGet("homePageContext").then((val){
      // print("解析---------");
      // print(val['resultCode'].toString());
      // var data2 = json.decode(val.toString());
      // HomeModel list = HomeModel.fromJson(data);
      setState(() {
        this._modelList = HomeModelList.fromJson(val);
        print(_modelList.data.length);
        HomeModel model =  _modelList.data[1];
        print( _modelList.data[1].imgUrl);
      });
    });
  }
}
