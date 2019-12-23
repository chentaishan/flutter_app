import 'package:flutter/material.dart';

void main() => runApp(OneApp());

class OneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: OnePage(),
    );
  }
}

class OnePage extends StatefulWidget {
  @override
  OnePageState createState() {
    // TODO: implement createState
    return OnePageState();
  }
}

class OnePageState extends State<OnePage> with SingleTickerProviderStateMixin{
  List tabs = ["新闻", "历史", "图片"];

  int _selectedIndex = 1;

  TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        centerTitle: true,
        actions: <Widget>[
          // 右侧菜单
          Icon(Icons.print),
        ],
        leading: Builder( // 导航图标
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom:TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),


      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),

    );


  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}
