import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat/k.dart';

import '../msg/messageItem.dart';

/// 聊天证据

class ChatEvidenceScreen extends StatefulWidget {
  final List<MessageContent>? msgList;

  const ChatEvidenceScreen(this.msgList, {Key? key}) : super(key: key);

  static Future<List<MessageContent>?> show(
      BuildContext context, List<MessageContent>? msgList) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatEvidenceScreen(msgList),
        settings: const RouteSettings(name: '/ChatEvidenceScreen'),
      ),
    );
  }

  @override
  State<ChatEvidenceScreen> createState() => _ChatEvidenceScreenState();
}

class _ChatEvidenceScreenState extends State<ChatEvidenceScreen> {
  final GlobalKey _listViewKey = GlobalKey();
  final bool _reverse = false; // 实际使用时列表方向
  List<MessageContent> _data = [];
  final bool _modify = true;
  final Map<int, bool> _selected = {};

  //用户头像缓存，避免更新头像后，消息项头像不一致；
  final Map<String, String> _latestUserIcons = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _data = widget.msgList ?? [];
    _data.sort((MessageContent a, MessageContent b) {
      return a.messageId > b.messageId ? 1 : -1;
    });
    for (var message in _data) {
      _cacheLatestUserIcon(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.chat_evidence,
        suppDark: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              key: _listViewKey,
              padding: EdgeInsets.zero,
              physics: const AlwaysScrollableScrollPhysics(),
              addAutomaticKeepAlives: false,
              cacheExtent: 220.0,
              shrinkWrap: false,
              itemCount: _data.length,
              reverse: _reverse,
              itemBuilder: (BuildContext context, int index) {
                MessageContent message = _data.elementAt(index);
                return MessageItem(
                  key: ValueKey('${message.messageId}'),
                  message: message,
                  modify: _modify,
                  isSelected:
                      (_modify && _selected.containsKey(message.messageId))
                          ? _selected[message.messageId]!
                          : false,
                  onChangeModifyMode: _onChangeModifyMode,
                  onSelectChanged: _onSelectChanged,
                  refer: const PageRefer('ChatEvidenceScreen'),
                  userIcon: _latestUserIcons[message.user?.id ?? ''],
                  targetIcon: '',
                  targetUid: '',
                  isLastMsg: _reverse ? index == 0 : index == _data.length - 1,
                );
              },
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(<MessageContent>[]);
                  },
                  child: Container(
                    width: (Util.width - 52) / 2,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: R.colors.secondBgColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      K.chat_cancel_button,
                      style: TextStyle(
                          color: R.colors.secondTextColor, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (_selected.isEmpty) {
                      Fluttertoast.showCenter(
                          msg: K.chat_report_chat_evidences);
                      return;
                    }

                    List<MessageContent> chatEvidences = [];

                    List<int> msgIds = [];
                    _selected.forEach((key, value) {
                      if (value) {
                        msgIds.add(key);
                      }
                    });

                    if (msgIds.isEmpty) {
                      Fluttertoast.showCenter(
                          msg: K.chat_report_chat_evidences);
                      return;
                    }

                    for (MessageContent item in _data) {
                      if (msgIds.contains(item.messageId)) {
                        chatEvidences.add(item);
                      }
                    }

                    chatEvidences.sort((MessageContent a, MessageContent b) {
                      return a.messageId > b.messageId ? 1 : -1;
                    });

                    Navigator.of(context).pop(chatEvidences);
                  },
                  child: Container(
                    width: (Util.width - 52) / 2,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: R.colors.mainBrandGradientColors),
                    ),
                    child: Text(
                      K.chat_done,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom)
        ],
      ),
    );
  }

  void _onChangeModifyMode(int messageId) async {
    // Log.d('onChangeModifyMode---------------messageId:$messageId');
  }

  void _onSelectChanged(int messageId) async {
    refresh(() {
      bool? selected =
          _selected.containsKey(messageId) ? _selected[messageId] : false;
      _selected[messageId] = !(selected ?? false);
    });
  }

  void _cacheLatestUserIcon(MessageContent message) async {
    if (!_latestUserIcons.containsKey(message.user?.id ?? '')) {
      UserInfo? info = await CachedNames.instance().get(
          Util.parseInt(message.user?.id ?? '0'), ConversationType.Private);
      if (info == null || info.icon == null) {
        _latestUserIcons[message.user?.id ?? ''] =
            message.user?.portraitUri ?? '';
      } else {
        _latestUserIcons[message.user?.id ?? ''] = info.icon ?? '';
      }
    }
  }
}
