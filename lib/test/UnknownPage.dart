import 'package:flutter/material.dart';

class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error page"),


      ),
      body: Container(
        child: Center(
          child: Text("this is Error page!"),
        ),
      ),
    );
  }
}
