import 'package:flutter/material.dart';

class ListenerTest extends StatefulWidget {
  @override
  _ListenerTestState createState() {
    // TODO: implement createState
    return new _ListenerTestState();
  }
  
}

class _ListenerTestState extends State<ListenerTest> {

 PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Listener"),
      ),
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 150.0,
          child: Text(_event?.toString() ??"", style: TextStyle(color: Colors.white),),
        ),

        onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
  onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
  onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
      ),
    );
  }

}