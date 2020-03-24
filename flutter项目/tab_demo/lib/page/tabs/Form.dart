import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:tab_demo/provider/Counter.dart';

class FormPage extends StatelessWidget {
  final String title;
  final arguments;
  const FormPage({this.arguments,this.title="Form", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${arguments !=null ? arguments['id']:'0'}"),
          RaisedButton(
            child: Text("下一步"),
            onPressed: (){
              // Navigator.re
              Navigator.of(context).pushReplacementNamed('/nextPage', arguments: {
                "id":122
              });
            },
          ),

          InkWell(
            child: Text("click"),
            onTap: (){

            },
          ),

          SizedBox(
            height: 80,
          ),

          MyText(),
          SizedBox(
            height: 40,
          ),
          MyButton(),
        ],


      ),

      floatingActionButton: FloatingActionButton(
        child: Text("back"),
        onPressed: (){
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.yellow,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MyText extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(
        builder: (context,child, counter){
          return Text('${counter.value}');
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("加一"),
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
      ),
    );
  }
}