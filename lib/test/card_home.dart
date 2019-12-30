import 'dart:convert';

import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/banner_bean_entity.dart';
import 'package:flutter_app/bean/home_list_bean_entity.dart';
import 'package:http/http.dart' as http;

class CardRecommand extends StatefulWidget {
  @override
  _CardRecommandState createState() => _CardRecommandState();
}

class _CardRecommandState extends State<CardRecommand> {
  HomeListBeanEntity _homeListBeanEntity;
  BannerBeanEntity _bannerBeanData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerData();
    initHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Text("HHHHHH")
      ],
    );
  }

  void initBannerData() {
    String listjson =
        getNetWorkData("https://www.wanandroid.com/article/list/0/json")
            as String;
    String bannerjson =
        getNetWorkData("https://www.wanandroid.com/banner/json") as String;


    print("list="+listjson);
    print("bannerjson="+bannerjson);

    if (listjson.length > 0) {
      HomeListBeanEntity homeListBeanEntity =
          HomeListBeanEntity.fromJson(json.decode(listjson));
      if (homeListBeanEntity != null) {
        setState(() {
          _homeListBeanEntity = homeListBeanEntity;
//          _homeListBeanEntity.data.datas.
        });
      }
    }

    if (bannerjson.length > 0) {
      BannerBeanEntity bannerBeanData = BannerBeanEntity.fromJson(json.decode(bannerjson));
      if (bannerBeanData != null) {
        setState(() {
          _bannerBeanData = bannerBeanData;
        });
      }
    }
  }

  void initHomeList() {}

  Future<String> getNetWorkData(String url) async {
    http.Response response = await http.get(url);
    return response.body;
  }
}
