import 'package:flutter/material.dart';

class newRoute extends StatefulWidget {
  String text;


  newRoute({Key key,this.text});

  @override
  _newRouteState createState() => _newRouteState();
}

class _newRouteState extends State<newRoute> {

  String text="new route";
  @override
  void initState() {
    // TODO: implement initState
    if(widget.text!=null){

      text = widget.text;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    //取出路由参数
    //
    String msg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(

          children: <Widget>[

            Text(msg),
            RaisedButton(
              child:Text("回调按钮"),
              onPressed: (){


                Navigator.pop(context,"hi!");

              },
            )
          ],
        ),
      ),
    );
  }
}
