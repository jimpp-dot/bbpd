class ConversationType {
  ConversationType._();

  //打招呼和临时群两种类型是伴伴扩展的类型，非融云标准会话类型
  static const String Hi = 'hi';
  static const String TempGroup = 'tempgroup';

  //自动搭讪特殊类型，非融云标准会话类型
  static const String Accost = 'accost';

  static const String Private = 'private';
  static const String Group = 'group';
  static const String ChatRoom = 'chatroom';

  static bool isGroup(String type) {
    return type == Group;
  }

  static int toIntType(String conversationType) {
    int type = ConversationTypeInt.MSG_TYPE_UNIVERSAL;
    switch (conversationType) {
      case Private:
        type = ConversationTypeInt.PRIVATE_CHAT;
        break;
      case Group:
        type = ConversationTypeInt.GROUP_CHAT;
        break;
      case ChatRoom:
        type = ConversationTypeInt.ROOM_CHAT;
        break;
      default:
      //
    }
    return type;
  }
}

class ConversationTypeInt {
  static const int MSG_TYPE_UNIVERSAL = 0;
  static const int PRIVATE_CHAT = 1;
  static const int GROUP_CHAT = 2;
  static const int ROOM_CHAT = 3;

  static String toStringType(int conversationType) {
    String type = ConversationType.Private;
    switch (conversationType) {
      case PRIVATE_CHAT:
        type = ConversationType.Private;
        break;
      case GROUP_CHAT:
        type = ConversationType.Group;
        break;
      case ROOM_CHAT:
        type = ConversationType.ChatRoom;
        break;
      default:
      //
    }
    return type;
  }
}

class MessageExtraType {
  static const String AtTa = '@Ta';
  static const String FixTop = 'top';
  static const String Gift = 'gift';
}

class MessageType {
  static const String Text = 'text';
  static const String Image = 'image';
  static const String Voice = 'voice';
  static const String Location = 'map';
  static const String Info = 'info';
  static const String Cmd = 'notify';
  static const String RcCall = 'rcnotify';
  static const String Mention = 'mention';

  static const String Local = 'local';
  static const String RedPacket = 'redpacket';
  static const String Airdrop = 'airdrop';
  static const String Airdrop2 = 'airdrop_2';
  static const String Share = 'share'; // 分享

  static int toIntType(String messageType) {
    int type = MessageTypeInt.BMSG_TYPE_UNIVERSAL;
    switch (messageType) {
      case Text:
        type = MessageTypeInt.BMSG_TYPE_TEXT;
        break;
      case Image:
        type = MessageTypeInt.BMSG_TYPE_IMAGE;
        break;
      case Voice:
        type = MessageTypeInt.BMSG_TYPE_VOICE;
        break;
      case Location:
        type = MessageTypeInt.BMSG_TYPE_LOCATION;
        break;
      case Info:
        type = MessageTypeInt.BMSG_TYPE_INFO;
        break;
      case Cmd:
        type = MessageTypeInt.BMSG_TYPE_CMD;
        break;
      case RcCall:
        type = MessageTypeInt.BMSG_TYPE_RECALL;
        break;
      case Mention:
        type = MessageTypeInt.BMSG_TYPE_MENTIONED;
        break;
      default:
      //
    }
    return type;
  }

  static String toObjectName(String messageType) {
    String objectName = 'RC:TxtMsg';
    switch (messageType) {
      case Text:
        objectName = 'RC:TxtMsg';
        break;
      case Image:
        objectName = 'RC:ImgMsg';
        break;
      case Voice:
        objectName = 'RC:VcMsg';
        break;
      case Location:
        objectName = 'RC:LBSMsg';
        break;
      case Info:
        objectName = 'RC:InfoNtf';
        break;
      case Cmd:
        objectName = 'RC:CmdMsg';
        break;
      case RcCall:
        objectName = 'RC:RcNtf';
        break;
      case Mention:
        objectName = 'RC:MtnMsg';
        break;
      default:
        objectName = 'RC:UnknownMsg';
        break;
    }
    return objectName;
  }
}

class MessageTypeInt {
  static const int BMSG_TYPE_UNIVERSAL = 0;
  static const int BMSG_TYPE_TEXT = 1; //文本
  static const int BMSG_TYPE_IMAGE = 2; //image
  static const int BMSG_TYPE_GIF = 3; //gif
  static const int BMSG_TYPE_VOICE = 4; //语音
  static const int BMSG_TYPE_VIDEO = 5; //视频
  static const int BMSG_TYPE_FILE = 6; //文件
  static const int BMSG_TYPE_LOCATION = 7; //位置消息
  static const int BMSG_TYPE_INFO = 8;
  static const int BMSG_TYPE_CMD = 9; //命令消息
  static const int BMSG_TYPE_RECALL = 10; //撤回
  static const int BMSG_TYPE_READRECEIPT = 11; //消息已读
  static const int BMSG_TYPE_TYPING = 12; //正在输入

  static const int BMSG_TYPE_NOTIFICATION = 14; // 通知栏
  static const int BMSG_TYPE_MENTIONED = 15; // 提醒(at)消息

  static const int BMSG_TYPE_DELETE = 18; //删除消息
}

class MessageStatus {
  static const String Sending = 'SENDING'; // 发送中-自己发
  static const String Failed = 'FAILED'; // 发送失败-自己发
  static const String Sent = 'SENT'; // 发送成功-自己发
  static const String Received = 'RECEIVED'; // 已接收-对方发
  static const String Read = 'READ'; // 已阅读-自己的消息被对方阅读
  static const String ReceivedRead = 'RECEIVED_READ'; // 已阅读-自己阅读对方的消息
  static const String Delete = 'DELETE'; // 已删除
  static const String Destroyed = 'DESTROYED';
}

class MessageDirection {
  static const String Send = 'SEND';
  static const String Receive = 'RECEIVE';
}

/// 群聊@
class MentionType {
  static const int MENTION_TYPE_NONE = 0; // 不@任何人
  static const int MENTION_TYPE_USERS = 1; // @某些用户
  static const int MENTION_TYPE_ALL = 2; // @所有人
}

class MessageName {
  static const String GIFT = "chat.gift"; //单聊发送礼物
  static const String CHAT_PKG = "chat.package"; //单聊发送红包
  static const String GROUP_PKG = "group.package"; //群聊发送红包
  static const String GROUP_PKG_NOTIFY = "group.package.notify"; //群聊发送红包通知
  static const String GROUP_WELL_COME = "group.singer.well.come"; //歌友会群聊欢迎新成员加入
  static const String GROUP_MASTER_ANSWER = "group.master.answer"; //歌友会群聊问答图文混排

  static const Set<String> MSG_NAMES = <String>{GIFT, CHAT_PKG, GROUP_PKG, GROUP_PKG_NOTIFY, GROUP_WELL_COME, GROUP_MASTER_ANSWER};
}
