import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/base_card.dart';

class card_project extends StatefulWidget {
  @override
  _card_projectState createState() => _card_projectState();
}

class _card_projectState extends State<card_project> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          //SliverAppBar作为头图控件
          //设置悬浮样式
          flexibleSpace: Image.network("https://ww1.sinaimg.cn/large/0065oQSqly1ftzsj15hgvj30sg15hkbw.jpg", fit: BoxFit.cover),
          //设置悬浮头图背景
          expandedHeight: 300, //头图控件高度
        ),
        SliverList(
          //SliverList作为列表控件
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')),
            //列表项创建方法
            childCount: 100, //列表元素个数
          ),
        ),
      ]),
    );
  }
}
