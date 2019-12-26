import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var _select_index;
    return Scaffold(
      appBar: AppBar(
        title: Text("WanAdroid"),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text("Project")),
          BottomNavigationBarItem(
              icon: Icon(Icons.palette), title: Text("Owner"))
        ],
      ),
    );
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
                child: Image.asset("images/Rice.png", width: 100, height: 100),
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
                  title: Text(  "one",textDirection: TextDirection.ltr, ),
                  subtitle: Text("sub_title"),
                  isThreeLine: true,
                  onTap: () => {print("one")},
                ),
                ListTile(
                  leading:
                      Image.asset("images/apple.png", width: 33, height: 33),
                  title: Text("two"),
                  onTap: () => {print("two")},
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
