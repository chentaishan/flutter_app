import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/bean/banner_bean_entity.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

var debugPaintSizeEnabled = true;

void main() => runApp(new Netwidget());

class Netwidget extends StatefulWidget {
  @override
  _NetwidgetState createState() => _NetwidgetState();
}

class _NetwidgetState extends State<Netwidget> {
  String title = "";

  List dataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList?.length,
        itemExtent: 55,
        itemBuilder: (context, index) => ListTile(
              title: setItemView(dataList[index]),
            ));
  }

  Future initData() async {
    http.Response response =
        await http.get("https://www.wanandroid.com/banner/json");

    title = response.body;

    var result = json.decode(title);
    BannerBeanEntity bannerBeanEntity = BannerBeanEntity.fromJson(result);

    setState(() {
      dataList = bannerBeanEntity.data;
    });
    bannerBeanEntity.data.forEach((item) => print("---" + item.title));

//    print("result=" + bannerBeanEntity.data[0].title);
  }

  setItemView(BannerBeanData bannerBeanData) {
    return Text(
      bannerBeanData.title,
      style: TextStyle(fontSize: 15, color: Colors.red),
    );
  }
}
