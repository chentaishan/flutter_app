import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionTestPage extends StatefulWidget {
  @override
  _PermissionTestPageState createState() => _PermissionTestPageState();
}

class _PermissionTestPageState extends State<PermissionTestPage> {
  String result;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //检查权限
    checkPermissionStatus();
    //没有权限-请求权限确认

//    结果回调
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("检查读写SD卡权限"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("检查是否拥有权限--读写外部卡"),
            onPressed: checkPermissionStatus,
          ),
          Text(
            "检查权限结果：" + hasPermissionText(_permissionStatus),
          ),
          RaisedButton(
            child: Text("请求权限"),
            onPressed: requestPermission,
          ),
          Text(
            "获取权限结果：" + getPermissionResult(_permissionStatus),
          )
        ],
      ),
    );
  }

  /**
   * 检查是否有相关权限
   */
  void checkPermissionStatus() {
    final Future<PermissionStatus> statusFuture =
    PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    statusFuture.then((PermissionStatus status) {
      setState(() {
        _permissionStatus = status;
      });
    });
  }

  /**
  * 请求系统权限，让用户确认授权
   */
  Future requestPermission() async {
    List<PermissionGroup> permissions = <PermissionGroup>[
      PermissionGroup.storage
    ];
    Map<PermissionGroup, PermissionStatus> permissionMap =
        await PermissionHandler().requestPermissions(permissions);

    setState(() {
      _permissionStatus = permissionMap[PermissionGroup.storage];
    });
  }

  String hasPermissionText(PermissionStatus status) {
    return status != PermissionStatus.granted ? "没有相关权限" : "已经拥有了权限";
  }

  String getPermissionResult(PermissionStatus permissionStatus) {
    return permissionStatus != PermissionStatus.granted ? "请求权限失败" : "获取权限成功";
  }
}
