import 'dart:convert';
import 'package:pulse_im/pulse_im.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_util.dart';

class MessageContent {
  String _type; //消息类型  common_define.dart => MessageType...
  SendUser? _user;
  String conversationType = ''; //会话类型 common_define.dart => ConversationType...
  String targetId = '';
  String? _senderUserId; //app代码中未用到该字段
  String? _senderId; //app中有用到该字段，需要sdk填充
  int messageId = 0; //本地生成的消息自增 id
  String? messageUId; //服务端生成的消息自增 id，此处命名为了保持跟以前的融云sdk名字一致，对应BMsg.msgId字段
  String? messageDirection;
  String _content = '';
  String? objectName;
  int sentTime = 0;
  String _sentStatus = '';
  int? receivedTime; //app代码中未用到该字段
  String? _displayTime; //ui层中自己填充，db中不存储
  String? imageUrl;
  String? thumb;
  String? audioData; //音频base64内容
  String? uri; //uri目前未确定具体怎么定义和赋值
  int? duration;
  String? _extra; //content字段中的extra信息，相当于融云MessageContent结构体中的extra字段
  String? _inlineExtra; //相当于融云Message结构体中的extra字段，setMessageExtra即设置的该字段
  String? data; // 处理cmd（RC:CmdMsg），db不存储，例如幸运星
  String? name; // 处理cmd（RC:CmdMsg），db不存储，例如幸运星

  // 下面的不入数据库
  /// 扩展字段，不存入数据库, 也不序列化，业务需要使用可以通过使用扩展方法的信息添加
  Map<String, dynamic>? _extendFields;

  MessageContent(this._type, this._user);

  toMessage() {
    Map map = {};
    map["type"] = type;
    map['content'] = _content;
    if (_extra != null) {
      map["extra"] = _extra;
    }
    if (_user != null) {
      map["user"] = _user!.toMap();
    }
    return map;
  }

  SendUser? get user {
    return _user;
  }

  set user(SendUser? user) {
    _user = user;
  }

  String get type {
    return _type;
  }

  set type(String type) {
    _type = type;
  }

  String get content {
    return _content;
  }

  set content(String value) {
    _content = value;
  }

  String get sentStatus {
    return _sentStatus;
  }

  set sentStatus(String status) {
    _sentStatus = status;
  }

  set extra(String? extra) {
    _extra = extra;
  }

  String? get inlineExtra {
    return _inlineExtra;
  }

  set inlineExtra(String? value) {
    _inlineExtra = value;
  }

  String? get extra {
    return _extra;
  }

  Map<String, dynamic> get extraMap {
    return IMUtil.parseMap(_extra);
  }

  String? get displayTime {
    return _displayTime;
  }

  set displayTime(String? value) {
    _displayTime = value;
  }

  String? get senderId {
    return (IMUtil.isStringEmpty(_senderId) || _senderId == 'null') ? _senderUserId : _senderId;
  }

  set senderId(String? value) {
    _senderId = value;
  }

  Map<String, dynamic> _toExtendFields(Map<String, dynamic> map) {
    return IMUtil.mapExcludeKeys(map, [
      'conversationType',
      'targetId',
      'messageId',
      'senderUserId',
      'senderId',
      'messageId',
      'messageUId',
      'messageDirection',
      'objectName',
      'sentTime',
      'extra',
      'inlineExtra',
      'sentStatus',
      'content',
      'audioData',
      'duration',
      'imageUrl',
      'thumb',
      'name',
      'data',
      'uri',
    ]);
  }

  MessageContent.fromJson(Map<String, dynamic> data)
      : _type = data['content']['type'],
        conversationType = data['conversationType'].toString(),
        targetId = data['targetId'].toString(),
        _user = (data['content']['user'] == null || !(data['content']['user'] as Map).containsKey('id'))
            ? null
            : SendUser.fromJson(data['content']['user']),
        _senderUserId = data['senderUserId'].toString(),
        _senderId = data['senderId'].toString(),
        messageId = IMUtil.parseInt(data['messageId'].toString()),
        messageUId = data['messageUId'] ?? '',
        messageDirection = data['messageDirection'].toString(),
        _content =
            MessageUtil.parseContent(data['content']['content'], data['content']['message'], data['content']['type']),
        objectName = data['objectName'].toString(),
        sentTime = IMUtil.parseInt(data['sentTime'].toString()),
        _sentStatus = data['sentStatus'].toString(),
        receivedTime = IMUtil.parseInt(data['receivedTime'].toString()),
        imageUrl = data['content']['imageUrl'] ?? '',
        thumb = data['content']['thumb'] ?? '',
        uri = data['content']['uri'] ?? '',
        duration = data['content']['duration'] ?? 0,
        _extra = MessageUtil.parseExtraString(data['content']['extra']),
        _inlineExtra = data['extra']?.toString(),
        audioData = data['content']['audioData'] ?? '' {
    _extendFields = _toExtendFields(data);
  }

  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> map = {};
    Map<String, dynamic> content = {};
    content['type'] = _type;
    content['user'] = _user?.toMap();
    content['content'] = _content;
    content['extra'] = _extra;
    content['imageUrl'] = imageUrl;
    content['thumb'] = thumb;
    content['uri'] = uri;
    content['duration'] = duration;

    map['content'] = content;
    map['conversationType'] = conversationType;
    map['targetId'] = targetId;
    map['senderUserId'] = _user?.id;
    map['senderId'] = _user?.id;
    map['messageId'] = messageId;
    map['messageUId'] = messageUId;
    map['messageDirection'] = messageDirection;
    map['objectName'] = objectName;
    map['sentTime'] = sentTime;
    map['sentStatus'] = _sentStatus;
    map['receivedTime'] = receivedTime;
    map['extra'] = _inlineExtra;
    content['audioData'] = audioData;

    return map;
  }

  ///sql map to MessageContent
  MessageContent.fromMap(Map<String, dynamic> map)
      : _type = IMUtil.parseStr(map['type']),
        conversationType = IMUtil.parseStr(map['conversationType']),
        targetId = IMUtil.parseStr(map['targetId']),
        //_user = new SendUser(map['senderUserId'], map['senderName'], map['senderPortraitUri']),
        _senderUserId = map['senderUserId'],
        _senderId = map['senderUserId'],
        messageId = IMUtil.parseInt(map['messageId']),
        messageUId = map['messageUId']?.toString(),
        messageDirection = map['messageDirection'] is String ? map['messageDirection'] : null,
        _content = IMUtil.parseStr(map['content']),
        objectName = MessageUtil.parseExtraString(map['objectName']),
        sentTime = IMUtil.parseInt(map['sentTime']),
        _sentStatus = IMUtil.parseStr(map['sentStatus']),
        receivedTime = map['receivedTime'] is int ? map['receivedTime'] : null,
        imageUrl = MessageUtil.parseExtraString(map['imageUrl']),
        thumb = MessageUtil.parseExtraString(map['thumb']),
        uri = MessageUtil.parseExtraString(map['uri']),
        duration = map['duration'] is int ? map['duration'] : null,
        _extra = MessageUtil.parseExtraString(map['extra']),
        _inlineExtra = MessageUtil.parseExtraString(map['inlineExtra']),
        audioData = MessageUtil.parseExtraString(map['audioData']),
        data = MessageUtil.parseExtraString(map['data']),
        name = MessageUtil.parseExtraString(map['name']) {
    _extendFields = _toExtendFields(map);
    if (map['senderUserId']?.isNotEmpty ?? false) {
      _user = SendUser(map['senderUserId'], map['senderName'], map['senderPortraitUri']);
    } else if (map['user']?.isNotEmpty ?? false) {
      try {
        _user = SendUser.fromUserJson(map['user']);
      } catch (e) {
        IMLog.e('message_content', 'SendUser.fromUserJson parse error:$e');
      }
    }
  }

  /// MessageContent to sql map，不需要messageId字段
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['type'] = _type;
    map['conversationType'] = conversationType;
    map['targetId'] = targetId;
    map['senderUserId'] = _user?.id;
    map['senderName'] = _user?.name ?? "";
    map['senderPortraitUri'] = _user?.portraitUri ?? "";
    map['messageUId'] = IMUtil.parseInt(messageUId);
    map['messageDirection'] = messageDirection;
    map['content'] = _content;
    map['objectName'] = objectName;
    map['sentTime'] = sentTime;
    map['sentStatus'] = _sentStatus;
    map['receivedTime'] = receivedTime ?? 0;
    map['imageUrl'] = (imageUrl != null) ? imageUrl : '';
    map['thumb'] = (thumb != null) ? thumb : '';
    map['uri'] = (uri != null) ? uri : '';
    map['duration'] = duration;
    map['extra'] = (_extra != null) ? _extra : '';
    map['inlineExtra'] = (_inlineExtra != null) ? _inlineExtra : '';
    map['audioData'] = (audioData != null) ? audioData : '';
    return map;
  }

  // 序列化
  String toJson() {
    Map<String, dynamic> map = toMap();
    map['messageId'] = messageId;
    return json.encode(map);
  }

  // 反序列化
  static MessageContent? fromJsonStr(String content) {
    try {
      Map<String, dynamic> map = json.decode(content);
      MessageContent msgContent = MessageContent.fromMap(map);
      return msgContent;
    } catch (e) {
      IMLog.e('message_content', 'fromJsonStr decode error:$e');
    }
    return null;
  }

  Map getExtraMap() {
    return MessageUtil.parseExtra(extra);
  }

  int getVersion() {
    Map map = getExtraMap();

    return IMUtil.parseInt(map[MessageUtil.VERSION_KEY]);
  }

  bool isSupport() {
    int localVersion = LocalUserData.version;
    int supVersion = getVersion();
    return localVersion >= supVersion;
  }

  bool isSend() {
    bool isSend = true;
    if (messageDirection == null) {
      String? senderId = _senderId;
      senderId ??= _user?.id ?? '';
      if (senderId != LocalUserData.senderUserId) {
        isSend = false;
      }
    } else {
      if (messageDirection == 'RECEIVE') {
        isSend = false;
      }
    }
    return isSend;
  }

  /// 添加扩展字段，不存入数据库
  /// [name] 字段名
  /// [value] 字段值
  /// 可以在业务中进行字段扩展，例如
  /// ```
  ///  class MessageContentExt on MessageContent {
  ///   String? get extName => getExtendField('extName');
  ///   set extName(String? value) => setExtendField('extName', value);
  ///  }
  ///  ```
  void setExtendField(String name, dynamic value) {
    _extendFields ??= {};
    _extendFields![name] = value;
  }

  dynamic getExtendField(String name) {
    return _extendFields != null ? _extendFields![name] : null;
  }

  @override
  String toString() {
    return toJson();
  }
}
