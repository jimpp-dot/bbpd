import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart' hide Lock;
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/screen.msg.pull.pb.dart';
import 'package:synchronized/synchronized.dart';

class RoomMsgPullManager {
  static const String TAG = "RoomMsgPullManager";

  // 日志开关
  static const _showLog = false;

  final ChatRoomData _room;

  bool _switch = false;
  String _url = '';
  int _curServerTime = 0;

  int _curLocalTime = 0;
  int _preFileName = 0;

  final Random _rnd = Random();
  bool _pause = false;
  Timer? _timer;
  final Duration _interval = const Duration(milliseconds: 250);

  final _lock = Lock();

  RoomMsgPullManager(this._room) {
    _init();
  }

  void _init() {
    Log.d("$TAG _init");
    eventCenter.addListener('Room.Ui.initState', _onEventRoomScreenInit);
    eventCenter.addListener('Room.Ui.Disposed', _onEventRoomScreenDispose);
    _room.addListener(RoomConstant.Event_Pull_Msg_Result, _onEvent);
  }

  void dispose() {
    Log.d("$TAG dispose");
    eventCenter.removeListener('Room.Ui.initState', _onEventRoomScreenInit);
    eventCenter.removeListener('Room.Ui.Disposed', _onEventRoomScreenDispose);
    _room.removeListener(RoomConstant.Event_Pull_Msg_Result, _onEvent);

    _destroyLoop();

    _switch = false;
    _url = '';
    _curServerTime = 0;

    _curLocalTime = 0;
    _preFileName = 0;
  }

  void _destroyLoop() {
    Log.d("$TAG _destroy");
    _pause = true;
    _timer?.cancel();
    _timer = null;
  }

  void _onEventRoomScreenInit(String type, dynamic value) {
    _pause = false;
    if (!_canPull()) return;
    // 开始拉消息
    startPullMsg();
  }

  void _onEventRoomScreenDispose(String type, dynamic value) {
    _destroyLoop();
  }

  void _onEvent(String type, dynamic value) {
    Log.d("$TAG _onEvent: type:$type, value:$value");
    _destroyLoop();
    if (value != null && value is Uint8List) {
      ScreenMsgPull resp = ScreenMsgPull.fromBuffer(value);
      Log.d("$TAG _onEvent: resp:$resp");
      _switch = resp.pullSwitch;
      _url = resp.url;
      _curServerTime = resp.currentTime.toInt();
      _curLocalTime = DateTime.now().millisecondsSinceEpoch;
      _pause = false;

      if (!_canPull()) return;

      /// 先拉一下当前时间对应的消息文件
      pullMsg(_calcFileName(0));
      // 开始拉消息
      startPullMsg();
    }
  }

  /// 是否可以拉取
  bool _canPull() {
    return _switch && (_url.isNotEmpty == true) && !_pause;
  }

  /// 开始拉取消息
  void startPullMsg() {
    _timer = Timer.periodic(_interval, (timer) async {
      if (!_canPull()) {
        _destroyLoop();
        return;
      }
      await _lock.synchronized(() async {
        if (!_canPull()) {
          _destroyLoop();
          return;
        }
        await Future.delayed(Duration(milliseconds: _rnd.nextInt(250)));
        int nowTime = DateTime.now().millisecondsSinceEpoch;
        await pullMsg(_calcFileName(nowTime - _curLocalTime));
      });
    });
  }

  /// 计算消息文件名
  String? _calcFileName(int intervalTime) {
    String? result;
    int nextNameInSecond = (_curServerTime + intervalTime) ~/ 1000;
    if (nextNameInSecond > _preFileName) {
      result = nextNameInSecond.toString();
      testPrint("_calcFileName: newName:$result");
    }
    _preFileName = nextNameInSecond;
    return result;
  }

  /// 开始拉取消息
  Future pullMsg(String? name) async {
    if (name?.isNotEmpty == true) {
      await readBytesFromUrl(_url, name!);
    }
  }

  /// 从网络 读取 文件bin
  Future readBytesFromUrl(String path, String name,
      {String suffix = ''}) async {
    Dio dio = Dio();
    // 注意：这里使用bytes
    dio.options.responseType = ResponseType.bytes;
    try {
      String url = '$path/${_room.rid}/$name$suffix.bin';
      testPrint("readBytesFromUrl: url:$url");

      Response response = await dio.get(url);
      Uint8List bytes = _consolidateHttpClientResponseBytes(response.data);
      testPrint("readBytesFromUrl: bytes:$bytes");

      /// 解析 bytes
      List<Uint8List> msgList = _parseBytes(bytes);
      testPrint("msgList.length:${msgList.length}");

      /// 发送 消息msg 到 socket
      await Future.forEach(msgList, (element) async {
        testPrint("dispatchMsg");
        await _room.dispatchSocketMsg(element);
      });

      /// 判断是否 多文件
      if (bytes.length > 4) {
        int nextSuffix = ByteData.sublistView(bytes, 0, 4).getUint32(0);
        testPrint("readBytesFromUrl: nextSuffix:$nextSuffix");
        if (nextSuffix > 0) {
          /// 存在下一个文件，继续读取
          readBytesFromUrl(path, name, suffix: '_$nextSuffix');
        }
      }
    } catch (e) {
      _preFileName = 0;
      testPrint("readBytesFromUrl: error: file not fond; name: $name");
    }
  }

  /// 将 消息文件bin 读取到内存 Uint8List
  Uint8List _consolidateHttpClientResponseBytes(dynamic data) {
    // response.contentLength is not trustworthy when GZIP is involved
    // or other cases where an intermediate transformer has been applied
    // to the stream.
    List<List<int>> chunks = <List<int>>[];
    int contentLength = 0;
    chunks.add(data);
    contentLength += Util.parseInt(data.length);
    Uint8List bytes = Uint8List(contentLength);
    int offset = 0;
    for (List<int> chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return bytes;
  }

  /// 解析 消息文件bin
  List<Uint8List> _parseBytes(Uint8List bytes) {
    List<Uint8List> msgList = [];
    int length = bytes.length;
    testPrint("_parseBytes: bytes.length:$length");
    int offset = 4;
    while (offset + 4 < length) {
      int msgLength =
          ByteData.sublistView(bytes, offset, offset + 4).getUint32(0);
      offset += 4;
      if (offset + msgLength <= length) {
        msgList.add(bytes.sublist(offset, offset + msgLength));
        offset += msgLength;
      }
    }
    return msgList;
  }

  void testPrint(String msg) {
    if (_showLog) {
      Log.d("$TAG => $msg");
    }
  }
}
