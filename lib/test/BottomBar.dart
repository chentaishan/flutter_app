import 'package:flutter/material.dart';
import 'package:flutter_app/test/content_pager.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _default_color = Colors.grey;
  final _active_color = Colors.blue;
  int _current_index = 0;
  final PageViewController _pageViewController = PageViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.grey,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: contentPager(
          pageViewController: _pageViewController,
          onPageChanged: (int index) {
            setState(() {
              // 更新状态

              _current_index = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current_index,
        onTap: (index) {
          _pageViewController.jumpTPage(index);
          setState(() {
            _current_index = index;
          });
        },
        items: [
          _BottombarItem("首页", Icons.print, 0),
          _BottombarItem("HHH", Icons.accessibility_new, 1),
          _BottombarItem("GGG", Icons.access_time, 2),
          _BottombarItem("KKK", Icons.print, 3),
        ],
      ),
    );
  }

  _BottombarItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _default_color,
      ),
      activeIcon: Icon(
        icon,
        color: _active_color,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: _current_index != index ? _default_color : _active_color),
      ),
    );
  }
}
