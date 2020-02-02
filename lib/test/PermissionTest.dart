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

  void checkPermissionStatus() {
    final Future<PermissionStatus> statusFuture =
        PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    statusFuture.then((PermissionStatus status) {
      setState(() {
        _permissionStatus = status;
      });
    });
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
            child: Text("检查用户权限--读写外部卡"),
            onPressed: checkPermissionStatus,
          ),
          Container(
            child: GestureDetector(
                child: Text(
                  getPermissionText(_permissionStatus),
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
                onTap: requestPermission),
          ),
        ],
      ),
    );
  }

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

  String getPermissionText(PermissionStatus status) {
    return status!=PermissionStatus.granted ? "没有相关权限--点击我请求权限" : "已经拥有了权限";

  }
}
