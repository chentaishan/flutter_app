import 'package:flutter/material.dart';

class newRoute extends StatefulWidget {
  String text;


  newRoute({Key key,this.text});

  @override
  _newRouteState createState() => _newRouteState();
}

class _newRouteState extends State<newRoute> {

  String text=null;
  @override
  void initState() {
    // TODO: implement initState
    if(text==null){

      text = widget.text;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
