import 'package:flutter_app/db/DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';



class TestDatabaseProvider extends DatabaseProvider {

  @override
  String get databaseName => "test.db";  // 重写 get 方法

  @override
  String get tableName => "user";

  /**
   * 重写父类方法
   */
  @override
  createDatabase(Database db, int version) {
    db.execute(
        """
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age TEXT
      
      );
      """
    );

  }
}
