import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat/k.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DisplayAutoChatUserService extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayAutoChatUserService(
      {super.key, required this.message, required this.extra});

  @override
  _DisplayAutoChatUserServiceState createState() =>
      _DisplayAutoChatUserServiceState();
}

class _DisplayAutoChatUserServiceState
    extends State<DisplayAutoChatUserService> {
  late TapGestureRecognizer _recognizer;

  @override
  void initState() {
    _recognizer = TapGestureRecognizer();
    _recognizer.onTap = _onClick;
    super.initState();
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  _onClick() async {
    Log.d("------- user-service");
    Map<String, String> params = {
      'service': widget.message.targetId,
      'token': widget.extra['token'],
    };
    if (widget.extra['cs_chat_source'] != null &&
        !Util.isStringEmpty(widget.extra['cs_chat_source'])) {
      params['cs_chat_source'] = widget.extra['cs_chat_source'];
    }
    if (widget.extra['multi_uuid'] != null &&
        !Util.isStringEmpty(widget.extra['multi_uuid'])) {
      params['multi_uuid'] = widget.extra['multi_uuid'];
    }
    try {
      await Xhr.postJson('${System.domain}auto/service', params,
          throwOnError: true);
    } catch (e) {
      if (mounted) {
        Toast.showCenter(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.message.content.lastIndexOf(K.switching_manual_service);
    if (index > -1 && widget.extra.containsKey('token')) {
      return RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: widget.message.content.safeSubstring(0, index),
                  style: TextStyle(color: R.colors.mainTextColor)),
              TextSpan(
                  text: widget.message.content.safeSubstring(index),
                  style: TextStyle(color: R.colors.highlightColor),
                  recognizer: _recognizer),
              const TextSpan(text: ' ')
            ]),
      );
    } else {
      return Text(widget.message.content);
    }
  }
}

class DisplayAutoChat extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayAutoChat(
      {super.key, required this.message, required this.extra});

  @override
  _State createState() => _State();
}

class _State extends State<DisplayAutoChat> {
  _clickAnswer(Map value) async {
    int id = Util.parseInt(value['id']);
    String? subject = value['subject'];
    if (id <= 0 || subject == null || subject.isEmpty) return;
    try {
      await Xhr.postJson(
          "${System.domain}auto/reply",
          {
            'id': id.toString(),
            'service': widget.message.targetId,
          },
          throwOnError: true);
    } catch (e) {
      if (mounted) Toast.showCenter(context, e.toString());
      return;
    }
    MessageContent content = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = subject;
    content.extra = json.encode({
      'type': 'auto-chat-reply',
      'id': id,
    });
    content.sentStatus = 'SENT';
    content.messageDirection = MessageDirection.Send;
    content.objectName = MessageType.toObjectName(MessageType.Text);
    content.sentTime = DateTime.now().millisecondsSinceEpoch;
    MessageContent? localContent = await Im.insertMessage(
        ConversationType.Private, widget.message.targetId, content);
    if (localContent != null) {
      eventCenter.emit(Im.EventMessageSent,
          {'messageId': localContent.messageId, 'left': 0});
    }
  }

  Future<NormalNull> _customerServiceVote(
      int id, String? multiuuid, int vote, int service) async {
    String url = '${System.domain}go/yy/kefu/vote';
    Map<String, String> params = {
      'id': '$id',
      'multiuuid': multiuuid ?? '',
      'vote': '$vote',
      'service': '$service',
    };
    try {
      XhrResponse response = await Xhr.postPb(url, params);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  Future<void> _voteAction(int qid, String multiuuid, int voteType) async {
    int service = Util.parseInt(widget.message.targetId, 0);
    NormalNull resp = await _customerServiceVote(
        qid, multiuuid, voteType == 1 ? 1 : 2, service);
    if (resp.success) {
      inlineExtra['voted'] = 1;
      inlineExtra['voteType'] = voteType;
      String extraStr = json.encode(inlineExtra);
      await Im.setMessageExtra(widget.message.messageId, extraStr);
      eventCenter.emit('MsgExtraChanged',
          {'messageId': widget.message.messageId, 'extra': extraStr});
    } else {
      Toast.show(context, resp.msg);
    }
  }

  Map? _inlineExtra;

  Map get inlineExtra {
    if (_inlineExtra == null) {
      String? inlineExtraStr = widget.message.inlineExtra;
      if (inlineExtraStr == null || inlineExtraStr.isEmpty) {
        _inlineExtra = {};
      } else {
        _inlineExtra = json.decode(inlineExtraStr);
      }
    }
    return _inlineExtra!;
  }

  Widget _buildActionButton(bool selected, String imagePath,
      String selectedImagePath, String title, bool voted, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        if (voted) {
          Toast.show(context, K.chat_has_evaluation);
          return;
        }
        onTap();
      },
      child: Container(
        width: 100,
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: selected
                    ? R.colors.highlightColor
                    : const Color(0xFFF0F0F0),
                width: 0.5)),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(selected ? selectedImagePath : imagePath,
                width: 16, height: 17, package: ComponentManager.MANAGER_CHAT),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(
                  color: selected
                      ? R.colors.highlightColor
                      : R.colors.mainTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActions(int qid, String multiuuid) {
    bool voteHelpful = false;
    bool voteHelpless = false;
    bool voted = false;
    if (Util.parseInt(inlineExtra['voted']) > 0) {
      voted = true;
      if (inlineExtra['voteType'] != null) {
        if (Util.parseInt(inlineExtra['voteType']) > 0) {
          voteHelpful = true;
        } else {
          voteHelpless = true;
        }
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, start: 12, end: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildActionButton(
              voteHelpless,
              'ic_disagree_normal.png',
              'ic_disagree_selected.png',
              K.chat_not_enough_satisfied,
              voted, () {
            _voteAction(qid, multiuuid, 0);
          }),
          const SizedBox(
            width: 12,
          ),
          _buildActionButton(voteHelpful, 'ic_agree_normal.png',
              'ic_agree_selected.png', K.chat_satisfied, voted, () {
            _voteAction(qid, multiuuid, 1);
          }),
        ],
      ),
    );
  }

  /// 跳转
  void _clickJumpBtn(int? type, String? url) {
    if (type == null || url == null) return;

    if (type == 1 || type == 2 || url.startsWith(RegExp(r'http(s?)://'))) {
      // 跳转H5工单
      BaseWebviewScreen.show(context,
          url: '$url${url.contains("?") ? '&' : '?'}uid=${Session.uid}');
    } else if (type == 3) {
      // 个人举报
      Fluttertoast.showCenter(msg: K.auto_chat_person_report_upgrade);
    } else if (type == 4) {
      // 房间举报
      Fluttertoast.showCenter(msg: K.auto_chat_room_report_upgrade);
    } else if (type == 5) {
      Fluttertoast.showCenter(msg: K.auto_chat_need_faster);
    }
  }

  Iterable<String> _allStringMatches(String text, RegExp regExp) =>
      regExp.allMatches(text).map((m) => m.group(0) ?? '');

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    EdgeInsets padding = const EdgeInsets.only(top: 11.0, bottom: 11.0);
    // 新增文本内容 包括 文本 H5链接 图片
    if (widget.extra['universal_message'] != null &&
        !Util.isStringEmpty(widget.extra['universal_message']['content'])) {
      String content = widget.extra['universal_message']['content'];
      List<String> arr = content.split('[[[EOF]]]');
      List links = widget.extra['universal_message']['links'];
      int linkIndex = 0;
      String replace = '[[[LINK]]]';

      for (final e in arr) {
        if (Util.isStringEmpty(e)) {
          continue;
        }

        if (!e.contains(replace)) {
          // 纯文本
          res.add(Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: Text(
              e,
              style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
            ),
          ));
        } else {
          int count = _allStringMatches(e, RegExp(r'[[[LINK]]]')).length;

          if (count == 1 && Util.parseInt(links[linkIndex]['type']) == 2) {
            // 图片
            String imageUrl = Util.getRemoteImgUrl(links[linkIndex++]['url']);
            res.add(Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 12, top: 10, end: 12),
              child: GestureDetector(
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageViewScreen(
                    context,
                    image: imageUrl,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ));
          } else {
            // 多文本 多链接
            List<InlineSpan> spans = [];
            List replaceArr = e.split(replace);

            for (int i = 0; i < replaceArr.length; i++) {
              if (i > 0) {
                Map link = links[linkIndex++];
                spans.add(
                  TextSpan(
                      text: link['content'] ?? '',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontFamily: Util.fontFamily,
                          color: R.colors.highlightColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          BaseWebviewScreen.show(context, url: link['url']);
                        }),
                );
              }

              String str = replaceArr[i];
              if (!Util.isStringEmpty(str)) {
                spans.add(
                  TextSpan(
                    text: str,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: Util.fontFamily,
                        color: R.colors.mainTextColor),
                  ),
                );
              }
            }

            res.add(Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
              child: Text.rich(TextSpan(
                children: spans,
              )),
            ));
          }
        }
      }
    } else {
      res.add(
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Text(
            widget.message.content,
            style: TextStyle(fontSize: 14.0, color: R.colors.secondTextColor),
          ),
        ),
      );
    }

    // 跳转按钮
    if (widget.extra['btn_message'] != null &&
        Util.parseInt(widget.extra['btn_message']['ws_type']) > 0) {
      Map<String, dynamic> btnMessage = widget.extra['btn_message'];

      res.add(GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _clickJumpBtn(
                Util.parseInt(btnMessage['ws_type']), btnMessage['url']);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 28,
                margin: const EdgeInsetsDirectional.only(start: 12, top: 12),
                padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: R.colors.highlightColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      btnMessage['content'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )));
    }

    if (widget.extra.containsKey('list') && widget.extra['list'] is List) {
      List data = widget.extra['list'];
      if (data.isNotEmpty) {
        padding = const EdgeInsets.only(top: 11.0);

        res.add(Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, bottom: 8.0, top: 8.0),
          child: Text(
            K.hot_problem_recommend,
            style: TextStyle(
                fontSize: 17.0,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.bold),
          ),
        ));
        int index = 0;
        int len = data.length;
        for (var val in data) {
          index++;
          if (val is Map) {
            Map value = val;
            res.add(Padding(
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, bottom: index == len ? 12.0 : 8.0),
              child: InkWell(
                onTap: () {
                  Log.d(value);
                  //在本地的数据中插入消息
                  _clickAnswer(value);
                },
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    val['subject'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.colors.highlightColor, fontSize: 15.0),
                  ),
                ),
              ),
            ));
          }
        }
      }
    }

    if (widget.extra['type'] == 'auto-chat-answer' &&
        Util.parseInt(widget.extra['needVote']) == 1) {
      res.add(_buildActions(
          widget.extra['id'] ?? 0, widget.extra['multi_uuid'] ?? ''));
    }

    return Container(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res,
      ),
    );
  }
}
