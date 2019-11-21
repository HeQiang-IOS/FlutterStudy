import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo5",
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = "https://httpbin.org/ip";
    var httpClient = new HttpClient();

    String result;

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result = "Error getting IP Address: ${response.statusCode}";
      }

    } catch (e) {
      result = "Failed getting IP address";
    }

    if(!mounted)return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0,);
    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You currrent IP address is:"),
            new Text("$_ipAddress"),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text("Get IP address"),
            ),
          ],
        ),
      ),
    );
  }
}