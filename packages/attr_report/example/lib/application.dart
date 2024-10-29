// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:base_attr_report/base_attr_report.dart';
import 'package:bbcore/bbcore.dart';
import 'package:flutter/material.dart';

class App extends BaseApp {
  App() {
    System.router = Routes.init();
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BaseAppState<App> {
  @override
  void initState() {
    super.initState();

    //...
    _onAppInit();
    
  }

  @override
  void dispose() {
    //...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _onLoginSucc,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  width: 120,
                  height: 44,
                  child: const Text('登录成功'),
                ),
              ),
              GestureDetector(
                onTap: _onRegisterSucc,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  width: 120,
                  height: 44,
                  child: const Text('注册成功'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 以下为 归因SDK 接入 所需
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    //...
    if (state == AppLifecycleState.paused) {
      //...
      // 进入后台
      debugPrint('go to background');
      BASEAttrReport.instance.report(BASEAttrReportAction.inactive);
    }
    //...
  }

  /// 初始化， 应在 app initState()中，调用
  void _onAppInit() {
    getAttrReportParams().then((value) {
      BASEAttrReport.instance.init(overseas: false, domain: 'yinjietd.com', regularParams: value, aaid: '');
      BASEAttrReport.instance.report(BASEAttrReportAction.start);
    });
  }

  /// 登录成功，应在收到登录成功通知时调用
  void _onLoginSucc() {
    BASEAttrReport.instance.report(BASEAttrReportAction.login);
  }

  /// 注册成功，应在收到注册成功通知时调用
  void _onRegisterSucc() {
    BASEAttrReport.instance.report(BASEAttrReportAction.reg);
  }

  /// 一个返回 依赖于 bbcore 的参数的方法， 供SDK初始化时使用
  Future<Map<String, dynamic>> getAttrReportParams() async {
    String ldy = await Xhr.getLdy();
    return {
      'mac': DeviceInfo.mac,
      'uid': Session.uid.toString(),
      'channel': DeviceInfo.channel,
      'package': Constant.packageName,
      'mt': Xhr.getMt(),
      'syv': DeviceInfo.systemVersion,
      'version': Constant.appVersion,
      'jversion': Config.get('report.user.jv', ''),
      'idfa': DeviceInfo.idfa,
      'imei': DeviceInfo.deviceId,
      'oaid': DeviceInfo.oaid,
      'uagent': DeviceInfo.userAgent,
      'simulator': DeviceInfo.isSimulator,
      'root': DeviceInfo.isRoot,
      'ldy': ldy
    };
  }
}
