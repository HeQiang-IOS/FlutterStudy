import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart' as prefix0;

// void main(List<String> args) {
//   runApp(
    // new Center(
    //   child: new Text(
    //     'Hello world!',
    //     textDirection: TextDirection.ltr,
    //   ),
    // )
    // new MaterialApp(
    //   title: 'My App1',
    //   home: new MyScaffold(),
    // )
//     new MaterialApp(
//       title: "Flutter Tutorial",
//       home: new TutorialHome(),
//     )
//   );
// }


class MyAppBar extends StatelessWidget {
  const MyAppBar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),

          new Expanded(
            child: title,
          ),

          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),

          new Expanded(
            child: new Center(
              child: new Text("Hello world!"),
            ),
          ),
        ],
      ),
    );
  }
}


class TutorialHome extends StatelessWidget {
  const TutorialHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),

        title: new Text("Example title"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
        ],
      ),


      body: new Center(
        // child: new Text("Hello, world!"),
        child: Counter(),
      ),

      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        print("MyButton was tapped");
      },

      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: new Center(
          child: new Text("Engage"),
        ),
      ),
    );
  }
}

/** 
class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text("Increment"),
        ),

        new Text("Count: $_counter"),
      ],
    );
  }
}
*/


class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;
  
  @override
  Widget build(BuildContext context) {
    return new Text("Count: $count");
  }
}


class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});



  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text("Increment"),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _increment() {
    setState(() {
      ++ _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterIncrementor(
          onPressed: _increment,
        ),
        new CounterDisplay(
          count: _counter,
        )
      ],
    );
  }
}


class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);


class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged}): product = product, super(key:new ObjectKey(product));

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;

    return new TextStyle(
      color: Colors.black45,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: (){
        onCartChanged(product, !inCart);
      },

      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),

      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart){
    setState(() {
      if(inCart){
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),

      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'Shopping App',
      home: new ShoppingList(
        products:<Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ]
      ),
    ),
  );
}