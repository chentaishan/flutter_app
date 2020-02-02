import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'fileUtil.dart';

class ImageTest extends StatefulWidget {
  @override
  _ImageTestState createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  var result;

//  final PermissionGroup _permissionGroup;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;

//  _ImageTestState(this._permissionGroup);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getLocalExternalStorageFile("DCIM/Camera/ggg.png")
        .then((value) => (result = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image--test")),
      body: Column(
        children: <Widget>[
//          Image.network(
//            "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
//            height: 88,
//          ),
//          Image.asset("images/aaa.jpg"),
          FutureBuilder(
            future: checkPermissionStatus(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Text("没完事");

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(snapshot.error);
                  } else if (snapshot.data != null) {
                    return Image.file(
                      File(snapshot.data),
                      height: 222,
                      width: 222,
                    );
                  }else{
                    return LinearProgressIndicator();
                  }
              }
            },
          ),
        ],
      ),
    );
  }

//获取SDCard的路径：
  Future<String> _getLocalExternalStorageFile(String filename) async {
    String dir = (await getExternalStorageDirectory()).path;
//    File file = new File('$dir/$filename');

//    file.exists().then((value) => value == true ? print("存在-${value}") : print("不存在"));

    return dir + filename;
  }

  /**
   * 检查是否有相关权限
   */
  Future<String> checkPermissionStatus() async {
    Future<PermissionStatus> statusFuture =
        PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    statusFuture.then((PermissionStatus status) {
      if (status != PermissionStatus.granted) {
        return requestPermission();
      }
      return null;
    });
  }

  /**
   * 请求系统权限，让用户确认授权
   */
  Future<String> requestPermission() async {
    List<PermissionGroup> permissions = <PermissionGroup>[
      PermissionGroup.storage
    ];
    Map<PermissionGroup, PermissionStatus> permissionMap =
        await PermissionHandler().requestPermissions(permissions);

    if (PermissionStatus.granted == permissionMap[PermissionGroup.storage]) {
      return _getLocalExternalStorageFile("DCIM/Camera/ggg.png");
    } else {
      return null;
    }
    ;
  }
}
