import 'package:shared/shared.dart';

enum InviteFriendsListType {
  Recent, //最近联系
  Friend, //好友
  Group, //群组
  CompanionRank, //陪伴榜
  Follow, //关注
  Fans, //粉丝
  Search, //搜索
  Nearby, //附近的人
}

class ConversationClassificationParam {
  List<Conversation> convs;
  List<int> familiar;
  List<int> tempGroups;
  int startTime = 0;

  ConversationClassificationParam({
    required this.convs,
    required this.familiar,
    required this.tempGroups,
    required this.startTime,
  });
}

class ConversationClassificationResult {
  ///普通会话
  List<Conversation> normalConvs;

  ///打招呼会话
  List<Conversation>? hiConvs;

  ///
  int startTime;

  ///临时群会话
  List<Conversation>? temGroupConvs;

  ConversationClassificationResult(
      {required this.normalConvs,
      required this.startTime,
      this.hiConvs,
      this.temGroupConvs});
}

class ConversationTimePoints {
  int oldestSentTime;
  int newestSentTime;
  ConversationTimePoints(this.oldestSentTime, this.newestSentTime);
}

class ConversationUtil {
  static bool _isFamiliar(ConversationClassificationParam param, int targetId) {
    return param.familiar.contains(targetId);
  }

  static ConversationClassificationResult classifyConversations(
      ConversationClassificationParam param) {
    List<Conversation> normalConvs = [];
    int startTime = param.startTime;

    int latestConvTime = 0;
    for (var conv in param.convs) {
      int targetId = Util.parseInt(conv.targetId);
      if (conv.type == ConversationType.Private) {
        if (_isFamiliar(param, targetId) && !ChatUtil.isSystemUser(targetId)) {
          normalConvs.add(conv);
        }
      } else if (conv.type == ConversationType.Group) {
        if (!param.tempGroups.contains(targetId)) {
          normalConvs.add(conv);
        }
      }

      //取所有会话列表中最早的时间
      if (startTime == 0) {
        startTime = conv.sentTime;
      } else if (conv.sentTime < startTime) {
        startTime = conv.sentTime;
      }
      if (conv.sentTime > latestConvTime) {
        latestConvTime = conv.sentTime;
      }
    }

    ConversationClassificationResult result = ConversationClassificationResult(
      normalConvs: normalConvs,
      startTime: startTime,
    );
    return result;
  }

  ///更新_lastCheckpointTime，返回值表示这一批会话数据是否已经旧于之前的最新会话时间点
  static ConversationTimePoints getEndTimePoints(List<Conversation> convs) {
    int oldestSentTime = 0;
    int newestSentTime = 0;
    for (var conv in convs) {
      if (conv.sentTime > newestSentTime) {
        newestSentTime = conv.sentTime;
      }
      if (oldestSentTime == 0) {
        oldestSentTime = conv.sentTime;
      } else if (conv.sentTime < oldestSentTime) {
        oldestSentTime = conv.sentTime;
      }
    }

    return ConversationTimePoints(oldestSentTime, newestSentTime);
  }
}
