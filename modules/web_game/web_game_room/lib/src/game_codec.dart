import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:protobuf/protobuf.dart';

class _MsgPromise {
  final int index;
  final Function(GameMsg data) onData;

  _MsgPromise(this.index, this.onData);
}

class GameMsg {
  final String name;
  final List<int> bytes;

  GameMsg(this.name, this.bytes);

  Map<String, dynamic> toJson() => {'name': name, 'data': bytes};
}

class GameCodec {
  GameCodec._();

  /// 用于自增的消息id
  static int _msgIndex = 1;
  static final Map<int, _MsgPromise> _promiseMap = {};
  static final StreamController<GameMsg> _streamController =
      StreamController.broadcast(onListen: () {}, onCancel: () {});

  static Stream<GameMsg> get stream => _streamController.stream;

  static bool isGameMsg(List<int> msg) {
    List<int> msgHead = 'bbgm'.codeUnits;
    bool isGameMsg = false;
    if (msg.length >= msgHead.length) {
      isGameMsg = true;
      for (int i = 0; i < msgHead.length; i++) {
        if (msgHead[i] != msg[i]) {
          isGameMsg = false;
          break;
        }
      }
    }
    return isGameMsg;
  }

  static List<int> _encodePb({
    String? name, // 消息名， package.name
    required GeneratedMessage pb,
    int gameId = 1,
  }) {
    return _encodeRawData(
      name: name ?? pb.info_.qualifiedMessageName,
      bytes: pb.writeToBuffer(),
      gameId: gameId,
    );
  }

  /// 消息编码
  ///
  /// 固定tag 2字节
  /// 头部版本 1字节
  /// 转发服务 1字节
  /// 消息id 8字节
  /// extra 4字节,预留
  /// 数据 不定长
  static List<int> _encodeRawData({
    required String name, // 消息名， package.name
    required List<int> bytes,
    int gameId = 1,
  }) {
    // 不定长数据，先解析成bytes，获取length
    Uint8List listData = pack({
      'name': name,
      'data': Uint8List.fromList(bytes).buffer.asByteData(),
    });
    ByteData byteData = ByteData(2 + 1 + 1 + 8 + 4 + listData.length);

    int byteOffset = 0;
    // 固定tag 2字节
    const tag = 0xccff;
    byteData.setUint16(byteOffset, tag, Endian.little);
    byteOffset += 2;
    // 头部版本 1字节
    final headVer = gameId > 1 ? 2 : 1;
    byteData.setUint8(byteOffset, headVer);
    byteOffset += 1;
    // 转发服务 1字节
    byteData.setUint8(byteOffset, gameId);
    byteOffset += 1;
    // 消息id 8字节
    byteData.setUint64(byteOffset, ++_msgIndex, Endian.little);
    byteOffset += 8;
    // extra 4字节
    byteData.setUint32(byteOffset, 0, Endian.little);
    byteOffset += 4;
    // 数据 不定长
    for (var b in listData) {
      byteData.setUint8(byteOffset, b);
      byteOffset++;
    }

    return byteData.buffer.asUint8List();
  }

  /// 发送pb数据
  static Future<GameMsg?>? sendPbData(GeneratedMessage pb, {int gameId = 1}) {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) return null;
    if (room.channel?.readyState == WebSocket.open) {
      try {
        // Log.d(pb.toProto3Json(), tag: pb.info_.qualifiedMessageName);
        List<int> bytes = _encodePb(pb: pb, gameId: gameId);
        // Log.d(bytes, tag: pb.info_.qualifiedMessageName);
        room.channel!.add(bytes);
        Completer<GameMsg?> completer = Completer();
        _promiseMap[_msgIndex] = _MsgPromise(_msgIndex, (data) {
          completer.complete(data);
        });
        return completer.future;
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
    return null;
  }

  /// 发送原始数据，比如通过h5游戏传过来的数据
  static Future<GameMsg?>? sendRawData(
    String name,
    List<int> data,
    bool isRequest, {
    int gameId = 1,
  }) {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) return null;
    if (room.channel?.readyState == WebSocket.open) {
      try {
        List<int> bytes =
            _encodeRawData(name: name, bytes: data, gameId: gameId);
        // Log.d(bytes.map((e) => e.toRadixString(16)).toList(), tag: 'GameCodec#sendRawData');
        room.channel!.add(bytes);
        if (isRequest) {
          Completer<GameMsg?> completer = Completer();
          _promiseMap[_msgIndex] = _MsgPromise(_msgIndex, (data) {
            completer.complete(data);
          });
          // Log.d('GameCodec#sendRawData: name=$name, index=$_msgIndex');
          return completer.future;
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
    return null;
  }

  // tag  | 头部版本 |     index     |   data
  // slpgm |  0x01  | (8字节，广播为0) | 不定长数据
  static void handleMsg(List<int> msg) {
    // Log.d(msg, tag: 'Codec#handleMsg');
    // Log.d(msg.map((e) => e.toRadixString(16)).toList(), tag: 'Codec#handleMsg');
    assert(utf8.decode(msg.sublist(0, 4)) == 'bbgm'); // tag
    int index = Uint8List.fromList(msg.sublist(5, 5 + 8))
        .buffer
        .asByteData()
        .getUint64(0, Endian.little);
    // Log.v(index);
    if (msg.length > 13) {
      List<int> dataMsg = msg.sublist(13);
      Object map = unpack(dataMsg);
      if (map is Map) {
        if (map['data'] is ByteData) {
          ByteData byteData = map['data'];
          // unpack出来的数组列表是ByteData结构，并且可能带有偏移量，
          // 导致接收方使用(fromBuffer)的时候解析失败，这里直接转成Uint8List
          map['data'] = byteData.buffer
              .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
        }
        GameMsg gameMsg = GameMsg(map['name'], map['data']);
        Log.d('GameCodec#handleMsg: name=${map['name']}, index=$index');

        if (index > 0 && _promiseMap.containsKey(index)) {
          _promiseMap[index]!.onData(gameMsg);
          _promiseMap.remove(index);
        } else {
          _streamController.add(gameMsg);
        }
      }
    }
  }
}
