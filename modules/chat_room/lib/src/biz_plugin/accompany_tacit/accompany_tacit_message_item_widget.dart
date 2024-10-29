import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/accompany_tacit/accompany_tacit_util.dart';
import 'package:chat_room/src/protobuf/generated/accompany.tacit.pb.dart';
import 'package:flutter/material.dart';
import 'accompany_tacit_repo.dart';
import 'tacit_dialog.dart';

/// @Author wangyang
/// @Description 默契问答房间消息卡片
/// @Date 2022/9/14
class AccompanyTacitMessageItemWidget extends StatefulWidget {
  final ChatRoomData room;
  final MessageContent message;
  final double maxWidth;

  const AccompanyTacitMessageItemWidget({
    required this.message,
    required this.room,
    this.maxWidth = 247,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AccompanyTacitMessageItemWidgetState();
  }
}

class AccompanyTacitMessageItemWidgetState
    extends State<AccompanyTacitMessageItemWidget> {
  late AccompanyTacit _accompanyTacit;
  double answerHeight = 34;
  double iconSize = 24;
  final Map<int, List<TacitAnswer>> _optionAnswerMap = {};
  int _askUid = 0;
  int _answerUid = 0;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() {
    _accompanyTacit = widget.message.expData as AccompanyTacit;
    for (var element in _accompanyTacit.tacit.answer) {
      int key = element.answer - 1; //answer从1开始
      var list = _optionAnswerMap[key];
      if (list == null) {
        list = [];
        list.add(element);
        _optionAnswerMap[key] = list;
      } else {
        list.add(element);
      }
    }

    ///0:提问者 1：回答者
    if (_accompanyTacit.tacit.include.length == 2) {
      _askUid = _accompanyTacit.tacit.include[0];
      _answerUid = _accompanyTacit.tacit.include[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = _accompanyTacit.tacit.title;
    return Container(
      margin: const EdgeInsetsDirectional.only(
        top: 4,
        bottom: 13,
        start: 8,
      ),
      child: Container(
        width: widget.maxWidth,
        padding: const EdgeInsetsDirectional.only(
            top: 12, bottom: 17, start: 12, end: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            color: Colors.white10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            R.img(Util.getRemoteImgUrl('static/chat/tacit_dialog_title.webp'),
                width: 43, height: 10),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            ..._buildOptions(),
            const SizedBox(
              height: 8,
            ),
            _buildTips(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> widgets = [];
    for (int i = 0; i < _accompanyTacit.tacit.option.length; i++) {
      widgets.add(_buildOptionItem(i, _optionAnswerMap[i]));
    }
    return widgets;
  }

  Widget _buildOptionItem(int index, List<TacitAnswer>? userList) {
    String option = _accompanyTacit.tacit.option[index];
    if (option.isEmpty) {
      return const SizedBox.shrink();
    }

    /// 是否高亮当前选项
    bool selected = false;

    /// 当前选项对应的用户icon
    List<String> userIcons = [];
    if (_accompanyTacit.tacit.type == 'ask') {
      //提问卡片
      selected =
          Session.uid == _askUid && _accompanyTacit.tacit.origin == index + 1;
      if (selected) {
        userIcons.add(Session.icon);
      }
    } else {
      //回答卡片
      selected = _accompanyTacit.tacit.origin == index + 1; //始终高亮提问者的选项
      if (userList != null) {
        for (var element in userList) {
          if (element.icon.isNotEmpty) {
            userIcons.add(element.icon);
          }
        }
      }
    }
    Color bg;
    Color textColor;
    if (selected) {
      bg = const Color(0xFFFF5F7D);
      textColor = Colors.white;
    } else {
      bg = Colors.white12;
      textColor = const Color(0xFFFF5F7D);
    }

    return GestureDetector(
      onTap: () {
        /// 是否可点击：来自提问者消息&&自己是回答者
        bool canTap =
            _accompanyTacit.tacit.type == 'ask' && Session.uid == _answerUid;
        if (canTap) {
          _sendAnswer(index);
        }
      },
      child: Stack(
        children: [
          Container(
            width: widget.maxWidth - 24,
            height: answerHeight,
            margin: const EdgeInsetsDirectional.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: bg,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              option,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
              ),
            ),
          ),
          PositionedDirectional(
            start: 8,
            top: (answerHeight - (iconSize + 2)) / 2 + 8,
            child: _buildIcons(userIcons),
          ),
        ],
      ),
    );
  }

  bool isAnswer = false;
  void _sendAnswer(int index) async {
    if (isAnswer) {
      return;
    }
    isAnswer = true;

    ///传给服务端的索引需要加1
    ResAnswerTacitQuestion res = await AccompanyTacitRepo.answerTacit(
        _accompanyTacit.tacit.msgId,
        index + 1,
        _accompanyTacit.tacit.origin,
        widget.room.rid);
    if (mounted) {
      if (!res.success) {
        Fluttertoast.showCenter(msg: res.msg);
      } else {
        Tracker.instance
            .track(TrackEvent.questions_page_view_list, properties: {
          'questions_page_view_list_succeed_room': 1,
        });
      }
    }
    isAnswer = false;
  }

  Widget _buildIcons(List<String> icons) {
    if (icons.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: icons.length * (iconSize + 2) - (icons.length - 1) * 6,
      height: iconSize + 2,
      child: Stack(
        children: [
          _buildIcon(icons[0]),
          if (icons.length > 1)
            PositionedDirectional(
              start: iconSize - 6,
              child: _buildIcon(icons[1]),
            ),
        ],
      ),
    );
  }

  Widget _buildIcon(String icon) {
    return Container(
      width: iconSize + 2,
      height: iconSize + 2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: icon,
        shape: BoxShape.circle,
        size: iconSize,
      ),
    );
  }

  Widget _buildTips() {
    if (_accompanyTacit.tacit.type == 'ask') {
      String tips;

      ///提问的卡片 根据当前用户展示不同的提示文案
      if (Session.uid == _askUid) {
        tips = K.room_accompany_tacit_unfinish_asker;
      } else if (Session.uid == _answerUid) {
        tips = K.room_accompany_tacit_unfinish_answer;
      } else {
        tips = K.room_accompany_tacit_unfinish_other;
      }
      return Text(
        tips,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0x66FFFFFF),
        ),
      );
    }

    ///判断选择的答案是否一致
    var answerList = _accompanyTacit.tacit.answer;
    bool isTacit = false;
    if (answerList.length == 2) {
      isTacit = answerList[0].answer == answerList[1].answer;
    }
    if (isTacit) {
      ///回答一致
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '👏',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
          Text(
            K.room_accompany_tacit_success_desc,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0x66FFFFFF),
            ),
          ),
        ],
      );
    } else {
      ///回答不一致
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.room_accompany_tacit_fail_desc_prefix,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0x66FFFFFF),
            ),
          ),
          GestureDetector(
            onTap: _retry,
            child: Text(
              K.room_accompany_tacit_dialog_option_change,
              style: TextStyle(
                fontSize: 11,
                color: R.color.mainBrandColor,
              ),
            ),
          ),
          Text(
            K.room_accompany_tacit_fail_desc_suffix,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0x66FFFFFF),
            ),
          ),
        ],
      );
    }
  }

  ///只有双方都在麦上，才能重试
  _retry() {
    int targetUid = AccompanyTacitUtil.getTargetUid(widget.room);
    if (targetUid > 0) {
      TacitDialog.show(context, targetUid, widget.room);
      Tracker.instance.track(TrackEvent.questions_click_entrance, properties: {
        'questions_click_entrance_tag': 3,
      });
    }
  }
}
