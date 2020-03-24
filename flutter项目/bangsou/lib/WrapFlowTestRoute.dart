import 'package:flutter/material.dart';
/*
body: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
            label: new Text("Hamilton"),
          ),

          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text("M")),
            label: new Text("Lafayette"),
          ),

          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child:  Text("H")),
            label: new Text("Mulligan"),
          ),

          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text("J")),
            label: new Text("Laurens"),
          ),
        ],

      ),
*/
class WrapFlowTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: Text("WrapFlowTestRoute"),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(width: 80, height: 80, color: Colors.red),
          new Container(width: 80, height: 80, color: Colors.green),
          new Container(width: 80, height: 80, color: Colors.blue),
          new Container(width: 80, height: 80, color: Colors.yellow),
          new Container(width: 80, height: 80, color: Colors.brown),
          new Container(width: 80, height: 80, color: Colors.purple),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren

    var x = margin.left;
    var y = margin.top;

    for(int i =0; i<context.childCount; i++){
      var w = context.getChildSize(i).width + x + margin.right;
      if(w < context.size.width){
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x = w + margin.left;       
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;

        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;        
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate !=this;
  }
  
}