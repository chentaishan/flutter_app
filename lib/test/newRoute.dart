import 'package:flutter/material.dart';

class newRoute extends StatefulWidget {
  @override
  _newRouteState createState() => _newRouteState();
}

class _newRouteState extends State<newRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}
