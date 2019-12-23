import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(ChenApp());

class ChenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "chen demo",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChenHomePage("chen home page"),
    );
  }
}

class ChenHomePage extends StatefulWidget {
  ChenHomePage(String s);

  String title = "null";

  @override
  ChenHomeState createState() {
    // TODO: implement createState
    return ChenHomeState();
  }
}

class ChenHomeState extends State<ChenHomePage> {
  int _count = 0;

  void updateCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("I am Title!")),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text(
            '$_count',
            textAlign: TextAlign.left, // 文本对齐方式 左右中
            textScaleFactor: 3, // 字体大小的缩放因子
            maxLines: 1, // 最大行
            overflow: TextOverflow.ellipsis, // 文本末尾省略号
          ),
          Text("TTTT" * 6, // 重复6次

              style: TextStyle(
                  color: Colors.red,
                  // 文字颜色
                  fontSize: 18.0,
                  // 文字大小
                  height: 1.2,
                  // 行高
                  background: new Paint()..color = Colors.blue,
                  // 背景色
                  decoration: TextDecoration.overline,
                  // 下划线
                  decorationStyle: TextDecorationStyle.dashed)),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home:  "),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
          ])),
          RaisedButton(
            //默认带有阴影和灰色背景。按下后，阴影会变大

            child: Text("Hello"),
            onPressed: () {},
          ),
          FlatButton(
            // 扁平按钮，默认背景透明不带阴影，按下有背景色

            child: Text("World"),
            onPressed: () {},
          ),
          OutlineButton(
            // 默认有边框 ，不带阴影且背景透明

            child: Text("你好"),
          ),
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
          ),
          RaisedButton.icon(
              onPressed: null, icon: Icon(Icons.ac_unit), label: Text("test")),
          OutlineButton.icon(
              onPressed: null, icon: Icon(Icons.print), label: Text("print")),
          Image(
            image: AssetImage("images/shanzi.png"),
            width: 77,
          ),
          Image.asset("images/shanzi.png", width: 50, height: 50),
          Image.network(
              "http://www.qubaobei.com/ios/cf/uploadfile/132/9/8366.jpg",
              width: 50),
          TextField(

            autofocus: true,
            maxLines: 1,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "邮箱"

            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: updateCount,
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
