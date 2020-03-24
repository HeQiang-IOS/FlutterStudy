import 'package:flutter/material.dart';
import 'package:tab_demo/page/Tabs.dart';
import 'package:tab_demo/page/UserPage.dart';
import 'package:tab_demo/page/tabs/Form.dart';
import 'package:tab_demo/page/tabs/NextPage.dart';
import 'package:tab_demo/page/tabs/TabDemo.dart';

final routes = {
  '/':(context) => Tabs(),
  // '/form':(context) => FormPage()
  '/form':(context,{arguments}) => FormPage(arguments:arguments),
  '/nextPage':(context, {arguments})=> NextPage(arguments: arguments),
  '/tabDemo':(context) => TabDemo(),
  '/userPage':(context) => UserPage(),
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