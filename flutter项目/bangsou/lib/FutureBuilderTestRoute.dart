import 'package:flutter/material.dart';

class FutureBuilderTestRoute extends StatefulWidget {
  @override
  FutureBuilderTestRouteState createState() {
    // TODO: implement createState
    return new FutureBuilderTestRouteState();
  }

} 

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => '我是从互联网上获取的数据');
}

class FutureBuilderTestRouteState extends State<FutureBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderTest"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Contents: ${snapshot.data}");
              }
            } else {
                return CircularProgressIndicator();
              }
          },
        ),
      ),
    );
  }

}