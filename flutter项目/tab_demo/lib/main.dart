import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:tab_demo/provider/Counter.dart';
import 'routes/Routes.dart';

void main(){
  var providers = new Providers();
  var counter = Counter();
  providers..provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(child: MyApp(), providers: providers,));
} 

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute
    );
  }
}
