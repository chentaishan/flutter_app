import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class newRoute extends StatefulWidget {
  String text;

  newRoute({Key key, this.text});

  @override
  _newRouteState createState() => _newRouteState();
}

class _newRouteState extends State<newRoute> {
  String text = "new route";

  @override
  void initState() {
    // TODO: implement initState
    if (widget.text != null) {
      text = widget.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //取出路由参数
    //
//    String msg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body:  new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://ww1.sinaimg.cn/large/0065oQSqly1fu7xueh1gbj30hs0uwtgb.jpg",
            fit: BoxFit.cover,
          );
        },
        containerHeight: 111,
        itemHeight: 111,

        autoplay:true ,
        onTap: (index) => print(index),
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
