import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          // new Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),

          // new Text('41'),
          new FavoriterWidget(),
        ],
      ),
    );


   Column buildButtonColumn(IconData icon, String label){
     Color color = Theme.of(context).primaryColor;

     return new Column(
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         new Icon(icon, color: color),
         new Container(
           margin: const EdgeInsets.only(top: 8.0),
           child: new Text(
             label,
             style: new TextStyle(
               fontSize: 12.0,
               fontWeight: FontWeight.w400,
               color: color,
             ),
           ),
         ),
       ],
     );
   }

   Widget buttonSection = new Container(
     child: new Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         buildButtonColumn(Icons.call, 'CALL'),
         buildButtonColumn(Icons.near_me, 'ROUTE'),
         buildButtonColumn(Icons.share, 'SHARE'),
       ],
     ),
   );

   Widget textSecton = new Container(
     padding: const EdgeInsets.all(32.0),
     child: new Text(
       '''
       Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
       ''',
       softWrap: true,
     ),
   );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: new  ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
               height: 240.0,
               fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSecton,
          ],
        ),
      ),
    );
  }
}

class FavoriterWidget extends StatefulWidget {
  FavoriterWidget({Key key}) : super(key: key);

  @override
  _FavoriterWidgetState createState() => _FavoriterWidgetState();
}

class _FavoriterWidgetState extends State<FavoriterWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),

        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text("$_favoriteCount"),
          ),
        ),
      ],
    );
  }
}