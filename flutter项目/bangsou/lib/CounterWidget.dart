import 'package:bangsou/EventBus.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initValue;
  const CounterWidget({
    Key key,
    this.initValue: 0,
  }):super(key:key);

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

   int _counter;

   var busT = new EventBus();
  


   @override
   void initState(){
     super.initState();
     _counter = widget.initValue;
     print("initState");
     busT.on("login", (arg){
       print("$arg");
     });
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: ()=>setState(()=>++_counter,),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble(){
    super.reassemble();
    print("reassemble");
  }

@override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
  /*
  initState
  disChangeDependencies
  build


  reassemble
  didUpdateWidget
  build

  reassemble
  deactive
  dispose
  
  */
}