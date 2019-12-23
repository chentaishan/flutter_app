import 'package:flutter/cupertino.dart';
import 'package:flutter_app/test/base_card.dart';

class card_shared extends BaseCard{


  @override
  card_sharedState createState() {

    return card_sharedState();
  }
}

class card_sharedState extends BaseCardState{


  @override
  mainTitle(String title) {
    // TODO: implement mainTitle
    return super.mainTitle("本周推荐");
  }

  @override
  subTitle(String title) {
    // TODO: implement subTitle
    return super.subTitle("送你一天天无限卡");
  }
  
  @override
  bottomContent(String url) {
    // TODO: implement bottomContent
    return super.bottomContent("https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg");
  }

  @override
  main2Title(String title) {
    // TODO: implement main2Title
    return super.main2Title("/123期");
  }

}