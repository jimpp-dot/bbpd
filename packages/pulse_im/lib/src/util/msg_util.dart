import 'package:pulse_im/src/pulse_im_client.dart';
import 'package:pulse_im/src/protocol/common_define.dart';
import 'package:pulse_im/src/model/message_content.dart';
import 'package:pulse_im/src/protocol/protocol_define.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'dart:convert';

import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';

class MessageUtil {
  static const VERSION_KEY = 'supt_version';

  /// - 多语言翻译， 获取bbcore中多语言翻译
  /// - 根据类型显示消息类型，如[图片], [语音]等，默认会加括号
  /// - 如果不需要加中括号([])，则在返回值前方加两个(##)，这样做是为了兼容以前逻辑
  /// 多语言翻译， 获取base_core中多语言翻译
  static String Function(String payload)? _onLocaleLang;

  /// 设置多语言翻译
  static initLocaleLang(String Function(String payload) function) => _onLocaleLang = function;

  static dynamic parseExtra(Object? extra) {
    if (extra is Map) return extra;

    if (extra == null || extra is! String || extra == '[]' || extra.isEmpty) {
      return {};
    }
    try {
      return json.decode(extra);
    } catch (e) {
      print(e);
      return {};
    }
  }

  static dynamic parseExtraString(Object? extra) {
    if (extra is String) return extra;

    if (extra is Map) {
      try {
        return json.encode(extra);
      } catch (e) {
        print(e);
      }
    }

    return null;
  }

  static String _localeText(String stringId, String defaultValue) {
    String ret = defaultValue;
    if (_onLocaleLang != null) {
      String tmp = _onLocaleLang!(stringId);
      if (tmp.isNotEmpty) {
        if (tmp.startsWith('##')) {
          ret = tmp.substring(2);
        } else {
          ret = "[$tmp]";
        }
      }
    }
    return ret;
  }

  static String parseContent(String? content, String? message, String type) {
    switch (type) {
      case MessageType.Text:
      case MessageType.Info:
      case MessageType.Mention:
        if (content != null) {
          return content;
        } else if (message != null) {
          return message;
        } else {
          return '';
        }

      case MessageType.Image:
        return _localeText("message_type_image", "[图片]");

      case MessageType.Voice:
        return _localeText("message_type_voice", "[语音]");

      case MessageType.Location:
        return _localeText("message_type_location", "[位置]");

      case MessageType.RcCall:
        return _localeText("message_type_recall", "[消息撤回]");
    }
    if (content != null) {
      return content;
    } else if (message != null) {
      return message;
    } else {
      return _localeText('message_unknown', '[未知消息]');
    }
  }

  static bool checkMessage(MessageContent? messageContent) {
    const String tag = "MessageChecker";
    if (messageContent == null) {
      IMLog.e(tag, "Message is null...");
      return false;
    }

    final isValid = PulseIMClient.messageReceiverCheck?.call(messageContent);
    if (isValid != null) {
      IMLog.e(tag, "Message messageReceiverCheck result: $isValid");
      return isValid;
    }

    if (IMUtil.isStringEmpty(messageContent.type)) {
      IMLog.e(tag, "Message type is empty...");
      return false;
    }

    if (IMUtil.isStringEmpty(messageContent.conversationType)) {
      IMLog.e(tag, "Message conversationType is empty...");
      return false;
    }

    if (IMUtil.isStringEmpty(messageContent.targetId)) {
      IMLog.e(tag, "Message targetId is empty...");
      return false;
    }

    if (IMUtil.isStringEmpty(messageContent.senderId) && messageContent.conversationType == ConversationType.Private) {
      IMLog.e(tag, "Message conversationType is private and senderId is empty...");
      return false;
    }

    if (IMUtil.isStringEmpty(messageContent.content)) {
      IMLog.e(tag, "Message content is empty...");
      return false;
    }
    return true;
  }

  static bool checkMsgHasAtYou(MessageContent? msgContent, {String? userId}) {
    String uid = userId ?? LocalUserData.senderUserId;
    if (msgContent == null) {
      return false;
    }

    /// 自己发送的消息，返回false
    if (msgContent.user?.id == uid) {
      return false;
    }

    if (msgContent.conversationType == ConversationType.Group && msgContent.type == MessageType.Mention) {
      Mention mention = Mention.fromJson(Map.from(msgContent.getExtraMap()));
      return mention.mtype == MentionType.MENTION_TYPE_ALL || (mention.userList.contains(IMUtil.parseInt(uid)));
    }
    return false;
  }
}
