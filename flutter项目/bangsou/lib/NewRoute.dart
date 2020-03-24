import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('New route'),
      ),
      body: Center(
        // child: Text('This is new route'),
        child: Builder(builder: (context){
          Scaffold scaffold =  context.ancestorWidgetOfExactType(Scaffold);
          print((scaffold.appBar as AppBar).title);
          return  RaisedButton(
              onPressed: (){
                // ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
               ScaffoldState _state = Scaffold.of(context);
                _state.showSnackBar(
                  SnackBar(
                    content: Text("我是SnackBar"),
                  ),
                );
              },
              child: Text('显示SnackBar'),
            );
        }),
        
      ),
    );
  }

}