import 'package:flutter/material.dart';
import 'package:flutter_app/test/card_home.dart';
import 'package:flutter_app/test/card_owner.dart';
import 'package:flutter_app/test/card_shared.dart';

class contentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final PageViewController pageViewController;

  const contentPager({Key, key, this.onPageChanged, this.pageViewController})
      : super(key: key);

  @override
  _contentPagerState createState() => _contentPagerState();
}

class _contentPagerState extends State<contentPager> {
  final PageController pageController =
      PageController(viewportFraction: 1, initialPage: 0);

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
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _widgetItem(CardRecommand()),
            _widgetItem(card_project()),
            _widgetItem(card_owner()),
          ],
        ))
      ],
    );
  }

  Widget _widgetItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(0),
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
