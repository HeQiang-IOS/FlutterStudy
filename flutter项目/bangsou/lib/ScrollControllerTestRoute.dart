import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() {
    // TODO: implement createState
    return new ScrollControllerTestRouteState() ;
  }

}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  
  ScrollController _controller = new ScrollController();
  bool showToTapBtn = false;

  void initState(){
    _controller.addListener((){
      print(_controller.offset);
      if(_controller.offset < 1000 && showToTapBtn){
        setState(() {
          showToTapBtn = false;
        });
      } else if(_controller.offset >= 0 && showToTapBtn == false){
        setState(() {
          showToTapBtn = true;
        });
      }
      
    });
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
          itemBuilder: (context, index){
            return ListTile(title: Text("$index"),);
          },
        ),
      ),
      floatingActionButton: !showToTapBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(.0, duration:Duration(milliseconds:200),
          curve: Curves.ease
          );
        },
      ),
    );
  }
  
}