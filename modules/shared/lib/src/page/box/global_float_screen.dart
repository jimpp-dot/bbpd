import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 新的全局飘屏布局
class GlobalFloatScreen extends StatefulWidget {
  const GlobalFloatScreen({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class GlobalMessage {
  final int rid;
  final int uid;
  final String username;
  final String iconUrl;
  final String content;
  final int resourceId; // 资源id
  final int size; // 字节数
  final String msgType; // 消息类型
  final String resourceType; // 资源类型
  final int showtime;
  String resourceUrl = '';
  final String jumpPath; // 跳转链接
  final String bgImg; // 飘屏背景
  final Map commonScreenContent; // 通用飘屏内部数据
  File? bgFile;
  List<int> rids; //在这些房间里飘屏
  int showScope; //0:全局飘屏；1：全房间飘屏；2：指定房间飘屏(rids必传)

  GlobalMessage.fromJson(Map data)
      : rid = Util.parseInt(data['rid']),
        uid = Util.parseInt(data['uid']),
        username = Util.parseStr(data['name']) ?? '',
        iconUrl = Util.parseStr(data['image']) ?? '',
        content = Util.parseStr(data['data']) ?? '',
        resourceId = Util.parseInt(data['id']),
        size = Util.parseInt(data['size']),
        msgType = Util.parseStr(data['msg_type']) ?? '',
        resourceType = Util.parseStr(data['resource_type']) ?? '',
        showtime = Util.parseInt(data['show_time']),
        jumpPath = Util.parseStr(data['jump_path']) ?? '',
        bgImg = Util.parseStr(data['back_img']) ?? '',
        rids = Util.parseIntList(data['rids']),
        showScope = Util.parseInt(data['show_scope']),
        commonScreenContent = Util.parseMap(data['common_screen_extra']);
}

class _State extends State<GlobalFloatScreen> {
  final List<GlobalMessage> _list = []; //全房间通知
  GlobalMessage? _data;
  final ValueAnimation _trx = Animated.value(Util.width);
  Sequence? _sequence;

  Widget? body;

  @override
  void initState() {
    super.initState();
    _sequence = Animated.sequence([
      Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
      Animated.delay(const Duration(seconds: 7000)),
      Animated.spring(_trx,
          toValue: 0 - Util.width,
          speed: 3.0,
          bounciness: 3.0,
          overshootClamping: true),
    ], _onAniUpdate);

    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onAllRoomNotify);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onAllRoomNotify);

    if (_sequence != null) {
      _sequence?.stop();
      _sequence = null;
    }
    super.dispose();
  }

  _onAniUpdate(bool complete) {
    if (complete) {
      _onComplete();
    } else {
      if (mounted) setState(() {});
    }
  }

  _addNewMessage(GlobalMessage? message) {
    if (_data == null) {
      setState(() {
        body = null;
        _data = message;
        _trx.reset();
      });
      _sequence = Animated.sequence([
        Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
        Animated.delay(Duration(seconds: _data?.showtime ?? 7)),
        Animated.spring(_trx,
            toValue: 0 - Util.width,
            speed: 3.0,
            bounciness: 3.0,
            overshootClamping: true),
      ], _onAniUpdate);
      _sequence?.start();
    } else {
      _list.add(message!);
    }
  }

  void _onAllRoomNotify(String type, dynamic data) async {
    Log.d('_onGlobalNotify data = $data');
    if (Util.appState != AppLifecycleState.resumed || !mounted) return;
    GlobalMessage? message;
    try {
      if (data is Map &&
          CommonFloatScreen.supportType(Util.notNullStr(data['name'])) &&
          data['data'] is Map) {
        Map json = data['data'];
        message = GlobalMessage.fromJson(json);
        if (message.showScope > 0) {
          eventCenter.emit('im.room.global.common.notify', json);
        } else {
          if (Util.validStr(message.bgImg)) {
            String? bgFilePath = await cacheUrlWithTry(
                Util.getRemoteImgUrl(message.bgImg), 0,
                subDir: 'resource_screen');
            if (Util.validStr(bgFilePath) &&
                CommonFloatScreen.supportType(message.msgType)) {
              message.bgFile = File(bgFilePath!);
              _addNewMessage(message);
            }
          }
        }
      }
    } catch (e) {
      Log.d(e);
      return;
    }
  }

  _onComplete() {
    if (!mounted) return;
    _sequence?.stop();
    setState(() {
      body = null;
      _data = null;
    });

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (mounted && _sequence != null && _data == null && _list.isNotEmpty) {
        setState(() {
          body = null;
          _data = _list.removeAt(0);
          _trx.reset();
        });
        _sequence = Animated.sequence([
          Animated.spring(_trx, toValue: 0.0, speed: 1.0, bounciness: 3.0),
          Animated.delay(Duration(seconds: _data?.showtime ?? 7)),
          Animated.spring(_trx,
              toValue: 0 - Util.width,
              speed: 3.0,
              bounciness: 3.0,
              overshootClamping: true),
        ], _onAniUpdate);
        _sequence?.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return const SizedBox.shrink();
    }
    Widget child = renderContent();
    return RepaintBoundary(
      child: Container(
        width: MediaQuery.of(context).size.width,
        transform: Matrix4.identity()..translate(_trx.value),
        child: child,
      ),
    );
  }

  // 全服的布局根据类型进行展示
  Widget renderContent() {
    if (CommonFloatScreen.supportType(_data?.msgType)) {
      // 通用飘屏
      return CommonFloatScreen(
        bg: _data!.bgFile!,
        scheme: _data!.jumpPath,
        info: CommonScreenContent.parseMap(_data!.commonScreenContent),
      );
    }
    return const SizedBox.shrink();
  }
}
