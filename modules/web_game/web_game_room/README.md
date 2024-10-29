# 游戏中台-房间游戏

目前有：个人房游戏、商业房插件游戏(大富翁)

## room模块修改点

1. 添加游戏房型(laya)判断代码
2. 游戏房相关房间操作走网关协议，包括上麦、下麦、操作麦位、切房、关房、踢人
3. 游戏消息拦截与转发
4. 在适当的地方引用游戏Widget

> 以下代码为参考代码，各个app按自己的实际代码做对应的修改

`ChatRoomData`:

```dart
// 获取ws channel，添加get方法，或者将私有变量改为公开的
WebSocket get channel => _channel;

/// 上麦
Future onMic(RPCReqOnMic pb) {
  return _send('RoomCmd', {
  	'cmd': 'OnMic',
  	'data': base64.encode(pb.writeToBuffer()),
  });
}

/// 下麦
Future offMic(RPCReqOffMic pb) {
  return _send('RoomCmd', {
  	'cmd': 'OffMic',
  	'data': base64.encode(pb.writeToBuffer()),
  });
}

/// 操作麦位
Future opMic(RPCReqOpMic pb) {
  return _send('RoomCmd', {
  	'cmd': 'OpMic',
  	'data': base64.encode(pb.writeToBuffer()),
  });
}

/// 踢出房间
Future kickOut(RPCReqKickOut pb) {
  return _send('RoomCmd', {
  	'cmd': 'KickOut',
  	'data': base64.encode(pb.writeToBuffer()),
  });
}

/// 修改房间信息(如切房)
Future updateRoom(RPCReqCreate pb) {
  return _send('RoomCmd', {
  	'cmd': 'Update',
  	'data': base64.encode(pb.writeToBuffer()),
  });
}

/// 关房
Future closeRoom() {
  return _send('RoomCmd', {
  	'cmd': 'CloseRoom',
  	'data': base64.encode(RPCReqCloseRoom().writeToBuffer()),
  });
}

// 游戏消息拦截
this._channel.listen((dynamic message) async {
  if (this._disposed) return;
  if (_errortime > 0) {
    // 重试连接上之后，需要刷一下麦位信息
    await loadConfig();
  }
  _errortime = 0;
  _isTrying = false;
  List<int> msgBytes = message as List<int>;
  // 游戏消息拦截转发
  if (baseGameRoomManager.isGameMsg(msgBytes)) {
    baseGameRoomManager.handleMsg(msgBytes);
    return;
  }
}
```


`ChatRoomUtil`:

```dart
/// 是否是h5(laya)游戏
static bool isLayaGame(RoomConfig config) {
  return config?.type == 'laya';
}

/// 是否是uno游戏
static bool isUnoGame(RoomConfig config) {
  return config?.originalRFT?.toLowerCase() == 'uno';
}

/// 在kickOut中添加
if (ChatRoomUtil.isLayaGame(room.config)) {
  try {
    await room.kickOut(RPCReqKickOut(
      toUid: position != null ? position.uid : uid,
      time: !isGame ? result.value.extra : 0,
      position: position != null ? position.position : -1,
    )).timeout(Duration(seconds: 3));
  } catch (e) {
    dog.e(e);
  }
} else {
  await RoomRepository.xhrAutoError('room/kickout?version=2', {...});
}
```

`RoomOptionsPanel`: 

```dart
// 在doSwitchRoomType中
if (ChatRoomUtil.isLayaGame(widget.room.config)) {
  // 网关协议切房
  await room?.updateRoom(RPCReqCreate(
    rid: room.config.rid,
    uid: Session.uid,
    factoryType: item.type,
  ))?.catchError((e) {
    Fluttertoast.showCenter(msg: e.toString());
  });
  Navigator.of(context).pop(null);
} else {
  // 接口切房
  await saveOption("switch_room_type", item.type);
}
```

`ChatRoomPage`: 

```dart
// 在_renderBody中
if (ChatRoomUtil.isLayaGame(_room.config)) {
  // UNO按需添加
  //if (ChatRoomUtil.isUnoGame(_room.config)) {
  //  return UnoRoomPage(room: _room);
  //}
  return baseGameRoomManager.buildRoomGamePage(gameType: _room.config.originalRFT);
}
```

`ChatRoomScreen`: 

```dart
// 在canScroll中
if (ChatRoomUtil.isLayaGame(_room.config)) {
  return false;
}
```

`RoomRepository`：

```dart
/// joinMic
if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
  RPCReqOnMic pb = RPCReqOnMic(
    position: pos,
    toUid: uid > 0 ? uid : Session.uid,
    version: 8,
    vrid: vrid,
  );
  dog.d(() => 'joinMic: ${pb.toProto3Json()}');

  try {
    await ChatRoomData.getInstance()
      .onMic(pb)
      .timeout(Duration(seconds: 3));
    eventCenter.emit('JoinMic.Success');
    return {'success': true, 'msg': ''};
  } catch (e) {
    dog.e(e);
    if(toastError){
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
    return {'success': false, 'msg': e.toString()};
  }
} else {
  try {
    Map res = await _xhrAutoError(
      'room/joinMic?version=6');
    ...
  } catch (e) {
    Log.d(e);
    return null;
  }
}

// leaveMic
if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
  RPCReqOffMic pb = RPCReqOffMic(
    toUid: uid > 0 ? uid : Session.uid,
    vrid: vrid,
  );
  dog.d(() => 'offMic: ${pb.toProto3Json()}');
  try {
    await ChatRoomData.getInstance()
      .offMic(pb)
      .timeout(Duration(seconds: 3));
    return {'success': true, 'msg': ''};
  } catch (e) {
    dog.e(e);
    return {'success': false, 'msg': e.toString()};
  }
} else {
  try {
    Map ret = await _xhrAutoError('room/leavelMic');
    ...
  } catch (e) {
    return null;
  }
}

// opMic
if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
  try {
    await ChatRoomData.getInstance().opMic(RPCReqOpMic(
      position: pos,
      op: op,
      duration: duration,
    )).timeout(Duration(seconds: 3));
    return {'success': true, 'msg': ''};
  } catch (e) {
    dog.e(e);
    return {'success': false, 'msg': e.toString()};
  }
} else {
  try {
    Map ret =  await _xhrAutoError('room/opMic');
    ...
  } catch (e) {
    return null;
  }
}

// close
if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config)) {
  await ChatRoomData.getInstance()?.closeRoom()?.catchError((e) {
    Fluttertoast.showCenter(msg: e.toString());
  });
  return null;
} else {
  try {
    return await _xhrAutoError('room/close', {
      'rid': rid.toString(),
      'deleted': '1',
    });
  } catch (e) {
    return null;
  }
}
```



新增/修改`rpc_room_frame.proto`，内容大致如下：

```protobuf
syntax = "proto3";
package pb;

//表示目标文件生成的路径, go的包名就是最后的目录名
//目前统一生成到 app/pb 目录下
option go_package = "../app/pb";

message RPCReqCreate {
  uint32 rid = 1; //房间ID
  uint32 uid = 2; //房间用户UID
  uint32 appId = 3; //所属app_id
  string property = 4; //房间属性
  string type = 5; //房间类型（切换房间类型）
  string factoryType = 6; //新建房流程的房间类型
  string name = 7; //房间名称
  optional uint32 sex = 8; //性别
  string icon = 9; //房间图片
  string bicon = 10; //房间大图
  uint32 closeBox = 11; //是否关闭开箱子
  string description = 12; //房间公告
  uint32 weight = 13; //排序权重
  string prefix = 14; //冠名前缀
  string settleChannel = 15; //结算频道
  optional uint32 state = 16; //隐私状态（0 正常、1 隐藏、2 仅好友可见、3 仅粉丝可见）
  optional int32 deleted = 17; //是否删除（-1 初始化、0 正常、1 关闭、2 删除）
  optional int32 nine = 18; //是否9麦模式
  optional uint32 paier = 19; //是否开启老板位
  optional uint32 reception = 20; //是否开启接待位
  string password = 21; //进房密码
  optional uint32 tagId = 22; //关联标签ID

  optional string subType = 23; //房间玩法类型
  uint32 rtcType = 24; //房间声道类型（agora-声网; zego-即构）
  optional uint32 cid = 25; //直播游戏房关联字段
  optional uint32 puzzleId = 26; //海龟汤房间新增关联字段
  string unityVersion = 27; //unity游戏版本号
  optional uint32 mystery = 28; //非诚勿扰房神秘模式

  uint32 jid = 29; //剧本ID
  uint32 isTwo = 30; //剧本房是否2人本
  uint32 isVisit = 31; //剧本房是否允许旁观
  uint32 isMatch = 32; //剧本房是否开启匹配
  uint32 posNum = 33; //剧本房麦位数量
  uint32 jVersion = 34; //剧本房版本

  uint32 pubHomeRid = 35; //卡座房所属大厅房间ID
  uint32 pubHomeUid = 36; //卡座房所属大厅创建用户ID
  uint32 pubHomeVer = 37; //卡座房所属大厅版本号
  uint32 pubMenuId = 38; //卡座房菜单ID

  optional int32 withFriend = 39; //看电影房是否和朋友一起标识
  string platform = 40; //用户手机系统平台
  optional int32 onlyNew = 41; //是否仅允许新用户进房
  optional uint32 giftWish = 42; //心愿礼物
  optional string puzzleChannel = 43; //海龟汤频道
  string language = 44;//语言类型
  uint32 extendVersion = 45;//每个房间拓展业务版本号
  optional uint32 apraId = 46; //鉴定师故事id
  optional string personalTag = 47; //房间标签
  optional string interestTag = 48; //房间兴趣标签
  optional string roomArea = 49;// 房间所属地区，海外专属
  uint32 isCreateRtcType = 50; //房间是否创建rtc_type记录
  string package = 51; //包名
}

message RPCResCreate {
  bool success = 1;
  string msg = 2;
  uint32 rid = 3;
}

message RPCReqEnter {
  uint32 to_uid = 1;
}

message RPCReqLeave {
  uint32 to_uid = 1;
}

message RPCReqOnMic {
  uint32 to_uid = 1;
  int32 position = 2;
  int32 version = 3;
  uint32 vrid = 4;
}

message RPCReqOffMic {
  uint32 to_uid = 1;
  uint32 vrid = 2;
}

message RPCReqOpMic {
  int32 position = 1;//被操作的麦位
  string op = 2;//执行的操作
  int32 duration = 3;//计时时长
}

message RPCReqWaitMic {
  uint32 to_uid = 1; //被操作者uid
  int32 position = 2; //麦位位置
  int32 version = 3;
  int32 boss = 4;
}


message WaitMicPositionTable {
  uint32 position = 1;
  uint32 display = 2;
  uint32 uid = 3;
}
//排麦数据结构
message WaitMicQueueRank {
  uint32 uid = 1;//用户ID
  string name = 2;//用户昵称
  string icon = 3;//用户头像
  uint32 sex = 4;//用户性别
  uint32 birthday = 5;//用户生日
  uint32 version = 6;//版本号
  uint32 pay_money = 7;
  uint64 pay_room_money = 8;
  uint32 title = 9;//爵位头衔
  string dateline_diff = 10;
  uint32 vip = 11;//vip级别
  uint32 year = 12;//岁数
  uint32 apply_time = 13;//
}
message RPCResWaitMic {
  bool success = 1;
  string msg = 2;
  repeated WaitMicQueueRank data = 3;
  repeated WaitMicPositionTable position_table = 4;
}

message RPCReqKickOut {
  uint32 to_uid = 1; //被操作者uid
  uint32 time = 2; //踢出时长
  int32 position = 3;//被踢的人所在麦位 -1表示麦下用户
}

message RPCReqCloseRoom {
}

message RPCReqOffline {
  uint32 to_uid = 1; //被操作者uid
}

message RPCResNormal {
  bool success = 1;
  string msg = 2;
}

message RPCReqRoomCmd {
  uint32 rid = 1; //房间rid
  uint32 uid = 2; //操作者uid
  string cmd = 3; //命令， 如OnMic，OffMic，OpMic， WaitMic
  bytes data = 4; //数据
}
```

