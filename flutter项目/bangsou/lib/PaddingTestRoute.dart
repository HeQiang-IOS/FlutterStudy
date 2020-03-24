import 'package:flutter/material.dart'; 

class PaddingTestRoute extends StatelessWidget {


  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title:  Text("PaddingTestRoute"),
        actions: <Widget>[
          // SizedBox(
          //   width: 20,
          //   height: 20,
          //   child: CircularProgressIndicator(
          //     strokeWidth: 3,
          //     valueColor: AlwaysStoppedAnimation(Colors.white70),
          //   ),
          // )
          UnconstrainedBox(
            child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white70),
            ),
          ),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hello world"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("I am Jack"),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Text("Your friend"),
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50.0
                ),
                child: Container(
                  height: 5.0,
                  child: redBox,
                ),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: redBox,
              ),


              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 60.0,
                  minHeight: 60.0
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 20.0,
                    minWidth: 90.0
                  ),
                  child: redBox,
                ),
              ),


              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 60.0,
                  minHeight: 100.0
                ),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 20.0,
                      minWidth: 90.0
                    ),
                    child: redBox,
                  ),
                ),
              ),


              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0
                    )
                  ]
                ),

                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }


}