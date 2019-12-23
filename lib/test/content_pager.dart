import 'package:flutter/material.dart';
import 'package:flutter_app/test/card_recommand.dart';

class contentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final PageViewController pageViewController;

  const contentPager({Key, key, this.onPageChanged, this.pageViewController})
      : super(key: key);

  @override
  _contentPagerState createState() => _contentPagerState();
}

class _contentPagerState extends State<contentPager> {
  final PageController pageController = PageController(viewportFraction: 0.8);

  List<Color> colorList = [Colors.blue, Colors.grey, Colors.white, Colors.red];

  @override
  void initState() {
    // TODO: implement initState
    if (widget.pageViewController != null) {
      widget.pageViewController._pageController = pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // appbar

        Expanded(
            child: PageView(
          onPageChanged: widget.onPageChanged,
          controller: pageController,
          children: <Widget>[
            _widgetItem(CardRecommand()),
            _widgetItem(CardRecommand()),
            _widgetItem(CardRecommand()),
            _widgetItem(CardRecommand()),
          ],
        ))
      ],
    );
  }

  Widget _widgetItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: widget,
    );
  }
}

class PageViewController {
  PageController _pageController;

  void jumpTPage(int index) {
    _pageController?.jumpToPage(index);
  }
}
