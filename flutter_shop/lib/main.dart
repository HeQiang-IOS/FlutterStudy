import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/currentIndex.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:provide/provide.dart';

void main(){
  var counter = Counter();
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();

  var providers = Providers();
  providers..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
  ..provide(Provider<CartProvide>.value(cartProvide));

  runApp(ProviderNode(child:MyApp(), providers: providers));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      // 把路由注册到顶层
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;


    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      onGenerateRoute: Application.router.generator,
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}

