import 'package:flutter/material.dart';
import 'package:flutter_app/test/content_pager.dart';
import 'package:flutter_app/test/newRoute.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    var _select_index = 0;

    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  PageViewController pageViewController;
  var default_color = Colors.grey;
  var active_color = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController = PageViewController();
  }

  @override
  Widget build(BuildContext context) {
    var _select_index;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WanAdroid",
          textDirection: TextDirection.ltr,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print(" 分享");
            },
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: contentPager(
        pageViewController: pageViewController,
        onPageChanged: (index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) {
          pageViewController.jumpTPage(index);
          setState(() {
            currIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          _selfBottomNavigationItem(Icons.palette, "HOME", 0),
          _selfBottomNavigationItem(Icons.print, "Project", 1),
          _selfBottomNavigationItem(Icons.palette, "Owner", 2),
        ],
      ),
    );
  }

  _selfBottomNavigationItem(IconData iconData, String title, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: default_color,
        ),
        activeIcon: Icon(
          iconData,
          color: active_color,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: currIndex != index ? default_color : active_color,
          ),
        ));
  }
}

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: Center(
              child: ClipOval(
                child: IconButton(
                  onPressed: () {
                    print("hhhh");

                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("我是SnackBar"),
                    ));
                  },
                  icon: Image.asset(
                    "images/apple.png",
                    width: 100,
                    height: 100,
                  ),
                ),
//                child: IconButton.asset("images/apple.png", width: 100, height: 100,),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    "images/Beer.png",
                    width: 33,
                    height: 33,
                  ),
                  title: Text(
                    "one",
                    textDirection: TextDirection.ltr,
                  ),
                  subtitle: Text("sub_title"),
                  isThreeLine: true,
                  onTap: () => {print("one")},
                ),
                ListTile(
                  leading:
                  Image.asset("images/apple.png", width: 33, height: 33),
                  title: Text("two"),
                  onTap: () => {
                  print("two"),

                  //导航到新路由
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) {
                  return newRoute();
                  }))
                },
                ),
                ListTile(
                  leading:
                  Image.asset("images/Ribs.png", width: 33, height: 33),
                  title: Text("three"),
                ),
                ListTile(
                  leading:
                  Image.asset("images/Rice.png", width: 33, height: 33),
                  title: Text("four"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
