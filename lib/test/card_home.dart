import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/banner_bean_entity.dart';
import 'package:flutter_app/bean/home_list_bean_entity.dart';
import 'package:flutter_app/test/banner_card.dart';

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
    Widget itemColor = Divider(
      color: Colors.blue,
    );
    return ListView.separated(
      itemCount: _homeListBeanEntity.data.datas.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(11),
          child: Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[

              BannerCard(),
//              Image.network(
//                  "http://www.qubaobei.com/ios/cf/uploadfile/132/9/8366.jpg",
//                  height: 100,
//                  width: 100),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(
                            _homeListBeanEntity.data.datas[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            "desc=${_homeListBeanEntity.data.datas[index].desc}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(fontSize: 11.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return itemColor;
      },
    );
  }

  void initBannerData() async {
//    String listjson =
//        getNetWorkData("https://www.wanandroid.com/article/list/0/json");
//    String bannerjson =
//        getNetWorkData("https://www.wanandroid.com/banner/json");

    var uri = Uri.parse("https://www.wanandroid.com/article/list/0/json");

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse httpClientResponse = await request.close();

    var listjson = await httpClientResponse.transform(utf8.decoder).join();

    print(httpClientResponse.toString());

    print("list=" + listjson);
//    print("bannerjson=" + bannerjson);

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

//    if (bannerjson.length > 0) {
//      BannerBeanEntity bannerBeanData =
//          BannerBeanEntity.fromJson(json.decode(bannerjson));
//      if (bannerBeanData != null) {
//        setState(() {
//          _bannerBeanData = bannerBeanData;
//        });
//      }
//    }
  }

  void initHomeList() {}

  Future<String> getNetWorkData(String url) async {
    var uri = Uri.parse(url);

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse httpClientResponse = await request.close();

    var str = await httpClientResponse.transform(utf8.decoder).join();

    print(httpClientResponse.toString());

    return str;
  }
}

abstract class Listitem {}

class Header implements Listitem {
  Header();
}

class Normal implements Listitem {
  Normal();
}
