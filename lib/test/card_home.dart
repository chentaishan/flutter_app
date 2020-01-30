import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/banner_bean_entity.dart';
import 'package:flutter_app/bean/home_list_bean_entity.dart';
import 'package:flutter_app/test/banner_card.dart';
import 'package:flutter_app/test/loading_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'fileUtil.dart';

class CardRecommand extends StatefulWidget {
  @override
  _CardRecommandState createState() => _CardRecommandState();
}

class _CardRecommandState extends State<CardRecommand> {
  HomeListBeanEntity _homeListBeanEntity;
  BannerBeanEntity _bannerBeanData;

  var result;

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
    Widget nullColor = Divider(
      color: Colors.white,
    );
    return _homeListBeanEntity==null? loadingPage():ListView.separated(
      itemCount: _homeListBeanEntity.data.datas.length,
      itemBuilder: (BuildContext context, int index) {
        return _bannerBeanData != null &&
                _bannerBeanData.data.length > 0 &&
                index == 0
            ? bannerItem(_bannerBeanData)
            : listItem(_homeListBeanEntity, index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return index > 0 ? itemColor : nullColor;
      },
    );
  }

  void initBannerData() async {
    result = await getNetWorkData("https://www.wanandroid.com/banner/json");
    writeContent(result);
    print("list=" + result);

    if (result.toString().length > 0) {
      BannerBeanEntity bannerBeanEntity =
          BannerBeanEntity.fromJson(json.decode(result));
      if (bannerBeanEntity != null) {
        setState(() {
          _bannerBeanData = bannerBeanEntity;

        });
      }
    }
  }

  Future<String> getNetData(String url) async {
    var uri = Uri.parse(url);

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse httpClientResponse = await request.close();

    return await httpClientResponse.transform(utf8.decoder).join();
  }

  void initHomeList() async {
    result =
        await getNetWorkData("https://www.wanandroid.com/article/list/0/json");

    print("list=" + result);

    if (result.toString().length > 0) {
      HomeListBeanEntity homeListBeanEntity =
          HomeListBeanEntity.fromJson(json.decode(result));
      if (homeListBeanEntity != null) {
        setState(() {
          _homeListBeanEntity = homeListBeanEntity;
        });
      }
    }
  }

  getNetWorkData(String url) async {
    var uri = Uri.parse(url);

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse httpClientResponse = await request.close();

    var str = await httpClientResponse.transform(utf8.decoder).join();

    print(httpClientResponse.toString());

    return str;
  }
}

Widget bannerItem(BannerBeanEntity _bannerBeanData) {
  return Container(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            _bannerBeanData.data[index].imagePath,
            fit: BoxFit.cover,
          );
        },
        autoplay: true,
        onTap: (index) => print(index),
        itemCount: _bannerBeanData.data.length,
        pagination: new SwiperPagination(),
//        control: new SwiperControl(),
      ));
}

Widget listItem(HomeListBeanEntity _homeListBeanEntity, int index) {
  if (_homeListBeanEntity == null) {
    return null;
  }
  if (index == 5) {
    return sixItem();
  }

  index > 0 ? index-- : index;
  return Padding(
    padding: EdgeInsets.all(11),
    child: Row(
      textDirection: TextDirection.ltr,
      children: <Widget>[
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
}

Widget sixItem() {
  return Container(
    height: 220,
    child: Image.network(
      "http://ww1.sinaimg.cn/large/0065oQSqgy1fu39hosiwoj30j60qyq96.jpg",
      fit: BoxFit.cover,
    ),
  );
}
