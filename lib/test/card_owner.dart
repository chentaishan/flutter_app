import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'fileUtil.dart';

class card_owner extends StatefulWidget {
  @override
  _card_ownerState createState() => _card_ownerState();
}

class _card_ownerState extends State<card_owner> {

  String msg="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      readContent().then((value) => (msg=value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(msg),
      ),
    );
  }
}
