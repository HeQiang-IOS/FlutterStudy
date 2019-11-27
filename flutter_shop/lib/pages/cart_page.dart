import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart_page/cart_bottom.dart';
import 'package:flutter_shop/pages/cart_page/cart_item.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provide/counter.dart';

/** 
class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton()
          ],
        )
      ),
    );
  }
}


class Number extends StatelessWidget {
  const Number({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Counter>(
        builder:(context, child, counter){
          return Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}


class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<String> testList = [];

  @override
  Widget build(BuildContext context) {
    _show();
    return Container(
       child: Column(
         children: <Widget>[
           Container(
             height: 500.0,
             child: ListView.builder(
               itemCount: testList.length,
               itemBuilder: (context, index){
                 return ListTile(
                   title: Text(testList[index]),
                 );
               },
             ),
           ),

           RaisedButton(
             onPressed: (){_add();},
             child: Text('增加'),
           ),

           RaisedButton(
             onPressed: (){_clear();},
             child: Text('清空'),
           ),
         ],
       ),
    );
  }

  void _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = '回去回去';
    testList.add(temp);
    prefs.setStringList('testInfo', testList);
    _show();
  }

  void _show() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getStringList('testInfo') != null) {
        testList = prefs.getStringList('testInfo');
      }
    });
  }

  void _clear() async {
    SharedPreferences presf = await SharedPreferences.getInstance();
    // presf.clear();
    presf.remove('testInfo');
    setState(() {
      testList = [];
    });
  }
}
*/

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: FutureBuilder(
          future: _getCartInfo(context),
          builder: (context, snapshot) {
            List cartList = Provide.value<CartProvide>(context).cartList;
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  Provide<CartProvide>(
                    builder: (context, child, childCategory) {
                      cartList = Provide.value<CartProvide>(context).cartList;
                      return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: CartItem(item: cartList[index]),
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CartButton(),
                  ),
                ],
              );
            } else {
              return Text('正在加载');
            }
          },
        ));
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
