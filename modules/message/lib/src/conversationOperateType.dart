import 'package:shared/shared.dart';

///
/// 消息的会话上的操作
///
enum ConversationOperateType {
  Delete, //删除会话
  UnTop, //取消置顶会话
  Top, //置顶会话
  ClearAllUnreadStatus, //清除会话未读消息
  ContentChange, //会话内容更新(如消息变更导致),需要重新查会话信息
  ClearAtStatus, // 针对群聊清除at消息
  Mute //免打扰
}

///会话变更，根据该回调更新消息的会话列表
typedef OnConversationOperate = void Function(
    ConversationOperateType opType, String type, String targetId);

/// 二级页面删除回调
typedef OnDeleteByInner = void Function(Conversation conv);
