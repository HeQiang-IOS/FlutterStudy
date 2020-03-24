import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTestRoute extends StatefulWidget {
  @override
  _DioTestRouteState createState() {
    // TODO: implement createState
    return new _DioTestRouteState();
  }
  
}

class _DioTestRouteState extends State<DioTestRoute> {

  Dio _dio = new Dio();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("dio"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              Response response = snapshot.data;
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }

              return ListView(
                children: response.data.map<Widget>((e) => 
                ListTile(title: Text(e["full_name"]))
                ).toList(),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}