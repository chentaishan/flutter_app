import 'package:flutter/cupertino.dart';
import 'package:flutter_app/test/base_card.dart';

class CardRecommand extends BaseCard{


  @override
  CardRecommandState createState() {

    return CardRecommandState();
  }
}

class CardRecommandState extends BaseCardState{


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
    return super.bottomContent("https://ww1.sinaimg.cn/large/0065oQSqly1g2hekfwnd7j30sg0x4djy.jpg");
  }

}