import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void _tapRecognizer() {}
    DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('hello world'),
          Text('I`m an Jack'),
          Text(
            'I`m an Jack',
            style: TextStyle(inherit: false, color: Colors.grey),
          )
        ],
      ),
    );
String icons = "";
// accessible: &#xE914; or 0xE914 or E914
icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(
        title: Text('MyText'),
      ),
      body: Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text("Hello world", textAlign: TextAlign.left),
              Text('Hello world! I`m Jack.' * 4,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              Text("Hello world", textScaleFactor: 1.5),
              Text('Hello world',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2,
                      fontFamily: 'Courier',
                      background: new Paint()..color = Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed)),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Home: '),
                TextSpan(
                  text: "https://www.baidu.com",
                  style: TextStyle(color: Colors.blue),
                  // recognizer: _tapRecognizer,
                ),
              ])),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('hello world'),
                    Text('I`m an Jack'),
                    Text(
                      'I`m an Jack',
                      style: TextStyle(inherit: false, color: Colors.grey),
                    )
                  ],
                ),
              ),

              Text(
                icons,
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'MaterialIcons',
                  color: Colors.green
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MyIcons.book, color: Colors.purple),
                  Icon(MyIcons.wechat, color: Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyIcons{
  // book 图标
  static const IconData book = const IconData(
      0xe614, 
      fontFamily: 'myIcon', 
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = const IconData(
      0xec7d,  
      fontFamily: 'myIcon', 
      matchTextDirection: true
  );
}