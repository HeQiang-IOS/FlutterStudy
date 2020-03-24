import 'package:flutter/material.dart';

class StreamBuilderTestRoute extends StatefulWidget {
  @override
  _StreamBuilderTestRouteState createState() {
    // TODO: implement createState
    return new _StreamBuilderTestRouteState();
  }
}

Stream<int> counter(){
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  });
}

class _StreamBuilderTestRouteState extends State<StreamBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder"),
      ),
      body: StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("没有Stream");
              break;
            case ConnectionState.waiting:
            return Text('等待数据...');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return Text('Stream已关闭');
          }
          return null;
        },
      ),
    );
  }
  
}