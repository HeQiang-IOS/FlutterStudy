import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Demo2"),
        ),
        body: new Center(
          child: new ParentCWidget(),
        ),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


class ParentWidget extends StatefulWidget {
  ParentWidget({Key key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new TapboxB(
         active: _active,
         onChanged: _handleTapboxChanged,
       )
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxB({Key key, this.active:false, @required this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: Center(
          child: new Text(
            active ? 'ActiveB' : 'InactiveB',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),

        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentCWidget extends StatefulWidget {
  ParentCWidget({Key key}) : super(key: key);

  @override
  _ParentCWidgetState createState() => _ParentCWidgetState();
}

class _ParentCWidgetState extends State<ParentCWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new TapboxC(
         active: _active,
         onChanged: _handleTapboxChanged,
       ),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged}) : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'ActiveC' : 'InactiveC',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10.0
          ) : null,
        ),
      ),
    );
  }
}