import 'package:bsdemo/page/Tabs.dart';
import 'package:bsdemo/page/tab/PageDetail.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => Tabs(),
  '/pageDetail':(context, {arguments}) => PageDetail(arguments: arguments)
};


var onGenerateRoute = (RouteSettings settings){
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if(pageContentBuilder !=null) {
    if(settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments:settings.arguments)
      );
      return route;
    }else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  }

};