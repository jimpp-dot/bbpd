//该类为消息会话类通用类 暂时几个app均一致
import 'package:shared/shared.dart';

class ChatUtil {
  /// 客服列表
  static const List<int> _CUSTOMER_SERVICE = [
    100000016,
    100000017,
    100000018,
    100000019,
    100000020,
    100000022,
    100000004,
  ];

  /// VIP专属客服
  static const List<int> _VIP_CUSTOMER_SERVICE = [
    100000023,
    100000024,
    100000025,
    100000026,
    100000027,
    100000028,
    100000029,
    100000030,
    100000031,
    100000032,
    100000033,
    100000034,
    100000035,
  ];

  /// 互动消息(点赞，评论，回复)
  static const int _MOMENT_MSG_ID = 100000040;

  /// 匹配申请
  static const int _MATCH_FRIENDS_UID = 100000041;

  /// 不进入聊天页面的UID
  static final List<int> _notChatIds = [_MOMENT_MSG_ID, _MATCH_FRIENDS_UID];

  /// 系统通知
  static const int _SYSTEM_NOTICE = 100000000;

  /// 生日提醒
  static const List<int> _BIRTHDAY_NOTICE_LIST = [100001030];

  /// 打赏消息（陌生人）
  static const List<int> _REWARD_NOTICE_LIST = [100000043];

  /// 主播任务平台助手
  static const List<int> _ANCHOR_TASK_NOTICE_LIST = [100000042];

  /// 是否为 客服（vip） ps：v1.7.5.0 及之后 高潜专用
  static bool isChatVipService(int uid) {
    return uid == 100000004;
  }

  static bool isSystemUser(int uid) {
    return uid < 100009998;
  }

  /// 是否客服
  static bool isCustomerService(int uid) {
    return _CUSTOMER_SERVICE.contains(uid);
  }

  /// 是否VIP专属客服
  static bool isVipCustomerService(int uid) {
    return _VIP_CUSTOMER_SERVICE.contains(uid);
  }

  /// 获取客服用户Id
  static int getCustomerServiceId() {
    int targetId;
    if (Session.vipNew >= 10 && Util.isVerify == false) {
      targetId = 100000022;
    } else {
      targetId = 100000016;
    }
    return targetId;
  }

  /// 是否系统通知
  static bool isSystemNotice(int uid) {
    return uid == _SYSTEM_NOTICE;
  }

  /// 是否生日提醒
  static bool isChatBirthdayNotify(int uid) {
    return _BIRTHDAY_NOTICE_LIST.contains(uid);
  }

  /// 是否打赏通知
  static bool isRewardNotice(int uid) {
    return _REWARD_NOTICE_LIST.contains(uid);
  }

  /// 是否主播任务助手通知
  static bool isAnchorTaskNotice(int uid) {
    return _ANCHOR_TASK_NOTICE_LIST.contains(uid);
  }

  /// 是否是群组id
  static isGroupId(int id) {
    return id > 0 && id < 900000 || id >= 100000000;
  }

  /// 是否互动消息id
  static isMomentMsgId(int id) {
    return id == _MOMENT_MSG_ID;
  }

  /// 是否匹配申请id
  static isMatchFriendsId(int id) {
    return id == _MATCH_FRIENDS_UID;
  }

  static int get momentMsgId => _MOMENT_MSG_ID;

  static int get matchFriendsId => _MATCH_FRIENDS_UID;

  static bool isNotChatUid(int id) => _notChatIds.contains(id);

  /// 能否展示小闹钟标签
  static bool isCanShowAlarmLabel(String label) => (label.isNotEmpty == true) && Session.isAlarmWhiteGod;

  /// 私聊，且不是系统用户
  static bool isPrivateNotSystemUser(String conversationType, int targetId) {
    return conversationType == ConversationType.Private &&
        !isCustomerService(targetId) &&
        !isVipCustomerService(targetId) &&
        !isSystemNotice(targetId) &&
        !ChatUtil.isSystemUser(targetId);
  }

  /// 屏蔽 业务场景消息。ps.在线消息（阅后即焚，不入数据库）
  static bool shieldBusinessType(String? type) {
    if (type == null) return false;
    return [
      'on.mentor.apply' // 拜师申请
    ].contains(type);
  }
}
