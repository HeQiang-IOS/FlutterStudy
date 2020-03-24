import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import 'User.dart';


class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() {
    // TODO: implement createState
    return new _WebSocketRouteState();
  }

}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text ='';

 //一个JSON格式的用户列表字符串


  
  void initState(){
    channel = new IOWebSocketChannel.connect("ws://echo.websocket.org");

    String jsonStr='[{"name":"Jack"},{"name":"Rose"}]';
//将JSON字符串转为Dart对象(此处是List)
List items=json.decode(jsonStr);
//输出第一个用户的姓名
print(items[0]["name"]);

String jsonT='{"name":"Jack","email":"122@qq.com"}';
Map<String, dynamic> user = json.decode(jsonT);
print('${user['name']}');
print('${user['email']}');

Map userMap = json.decode(jsonT);
User user2;
user2 = new User.fromJson(userMap);

print('Howdy, ${user2.name}!');
print('We sent the verification link to ${user2.email}.');
  }
  
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar:  AppBar(
          title: Text("webSocket"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Form(
                child: new TextFormField(
                  controller: _controller,
                  decoration: new InputDecoration(labelText: "Send a message"),
                ),
              ),

              new StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    _text = "网络不通";
                  } else if(snapshot.hasData){
                    _text = "echo: "+snapshot.data;
                  } 
                  return new Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(_text),
                  );
                },
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: "Send message",
          child: new Icon(Icons.send),
        ),
      );
    }

    void _sendMessage(){
      if(_controller.toString().isNotEmpty){
        channel.sink.add(_controller.text);
      }
    }

    void dispose(){
      channel.sink.close();
      super.dispose();
    }
    
  }