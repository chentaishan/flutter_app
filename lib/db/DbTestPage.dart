import 'package:flutter/material.dart';
import 'package:flutter_app/db/TripDatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

import 'user_entity.dart';

class DbTestPage extends StatefulWidget {
  @override
  _DbTestPageState createState() => _DbTestPageState();
}

class _DbTestPageState extends State<DbTestPage> {
  var insertResult;
  static TestDatabaseProvider provider;

  String queryResult = "--";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 初始化数据库对象
    provider = TestDatabaseProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试数据库的页面"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) => _saveInsert(value),
                  decoration: InputDecoration(
                      hintText: "请输入int-id,String-name,String-age",
                      prefixIcon: Icon(Icons.person)),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  obscureText: false,
                  // 隐藏正在编辑的内容
                  autofocus: true,
                ),
              ),
              RaisedButton(
                onPressed: () => _insertData(insertResult),
                child: Text("插入"),
              )
            ],
          ),
          RaisedButton(
            onPressed: _queryAll,
            child: Text("查询所有"),
          ),

               Text(queryResult,style: TextStyle(),) ,

        ],
      ),
    );
  }

  _saveInsert(String value) => insertResult = value;

  _insertData(var insertResult) async {
    if (insertResult.isEmpty) {
      return;
    }
    List list = insertResult.split(",");

    UserEntity user = UserEntity();

    user.id = int.parse(list[0]);
    user.name = list[1];
    user.age = list[2];
    Database database = await provider.database;
    await database
        .insert(provider.tableName, user.toJson())
        .then((value) => {print("_insertData--$value")});
  }

  void _queryAll() async {

    queryResult="-----\n";

    Database database = await provider.database;
    Future<List<Map<Object, dynamic>>> future =
        database.query(provider.tableName);

    future.then((List<Map<Object, dynamic>> list) {
      for (Map<Object, dynamic> map in list) {
        for (var key in map.keys) {
          print("key=${key}--value=${map[key]}");

          setState(() {
            queryResult = queryResult+"$key:${map[key]}\n" ;
          });
        }
      }
    });
  }
}
