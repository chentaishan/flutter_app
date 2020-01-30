
//创建文件目录
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> get _localFile async {

  // getTemporaryDirectory()//临时目录
  //  getApplicationDocumentsDirectory()//应用程序的文档目录
  // getExternalStorageDirectory()外部储存目录

  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/content.txt');
}
//将字符串写入文件
Future<File> writeContent(String content) async {
  final file = await _localFile;
  return file.writeAsString(content);
}
//从文件读出字符串
Future<String> readContent() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "";
  }
}