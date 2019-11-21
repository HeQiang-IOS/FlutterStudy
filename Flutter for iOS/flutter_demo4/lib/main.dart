import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPageB(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  Widget getRow(int i){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position){
          return getRow(position);
        },
      ),
    );
  }
}

class SampleAppPageB extends StatefulWidget {
  SampleAppPageB({Key key}) : super(key: key);

  @override
  _SampleAppPageBState createState() => _SampleAppPageBState();
}

class _SampleAppPageBState extends State<SampleAppPageB> {

  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  showLoadingDialog(){
    if(widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody(){
    if(showLoadingDialog()){
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog(){
    return Center(child: CircularProgressIndicator());
  }


  ListView getListView() => ListView.builder(
    itemCount: widgets.length,
    itemBuilder: (BuildContext context, int position){
      return getRow(position);
    },
  );


  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }







  loadData() async{
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }

  static dataLoader(SendPort sendPort) async {
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive (SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Isolate Demo"),
      ),
      body: getBody(),
    );
  }
}