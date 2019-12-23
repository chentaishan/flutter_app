import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(5),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            topContent(), // 顶部布局
            bottomContent(''), //底部布局
          ],
        ),
      ),
    );
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 22, top: 22, bottom: 12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              mainTitle(''),
            ],
          ),
          subTitle(''),
        ],
      ),
    );
  }

  bottomContent(String url) {
    return Expanded(

      child: Image.network(url,fit: BoxFit.cover,),
    );
  }

  mainTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, color: Colors.black),
    );
  }

   subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 22),
      child: Text(
        "$title",
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}
