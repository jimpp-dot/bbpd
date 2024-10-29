import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../bottom/tacit_dialog.dart';
import '../model/pbModel/generated/tacit.pb.dart';
import '../repo/tacit_repo.dart';
import 'config.dart';

/// 默契问答
class DisplayTacit extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final double maxWidth;
  final String targetIcon;
  final String targetUid;

  const DisplayTacit({
    required this.message,
    required this.extra,
    required this.direction,
    required this.maxWidth,
    required this.targetIcon,
    required this.targetUid,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return DisplayTacitState();
  }
}

class DisplayTacitState extends State<DisplayTacit> {
  double answerHeight = 40;
  double iconWidth = 24;
  int unknow = -1;

  /// 拉取到结果前
  int unSelect = 0;

  /// 拉取到结果，且接收者还未选择
  double width = 247;
  late String msgId;
  int receiverSelect = -1;
  late int sendSelect;
  late String title;
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    if (width > widget.maxWidth) {
      width = widget.maxWidth;
    }
    msgId = '${widget.extra['msgId']}';
    getTacit();
    loadData();
  }

  void getTacit() {
    sendSelect = Util.parseInt(widget.extra['selectIndex']);
    title = Util.parseStr(widget.extra['title']) ?? '';
    String? answer1 = Util.parseStr(widget.extra['answer1']);
    if (Util.validStr(answer1)) {
      answers.add(answer1!);
    }
    String? answer2 = Util.parseStr(widget.extra['answer2']);
    if (Util.validStr(answer2)) {
      answers.add(answer2!);
    }
    String? answer3 = Util.parseStr(widget.extra['answer3']);
    if (Util.validStr(answer3)) {
      answers.add(answer3!);
    }
    String? answer4 = Util.parseStr(widget.extra['answer4']);
    if (Util.validStr(answer4)) {
      answers.add(answer4!);
    }
  }

  bool get isUnKnow => receiverSelect == unknow;

  bool get isUnSelect => receiverSelect == unSelect;

  bool get hasSelect => receiverSelect > unSelect;

  bool get isSelfSend => MessageDisplayDirection.Right == widget.direction;

  void loadData() async {
    ResQueryTacitQuestion res = await TacitRepo.queryTacit(msgId);
    if (mounted && res.success == true) {
      setState(() {
        receiverSelect = res.answer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsetsDirectional.only(
          top: 12, bottom: 20, start: 16, end: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        image: DecorationImage(
          image: AssetImage(R.imagePath(
              darkMode ? 'tacit_msg_bg_dark.webp' : 'tacit_msg_bg.webp',
              package: ComponentManager.MANAGER_CHAT)),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.chat_tacit,
            style: TextStyle(
              fontSize: 13,
              color: R.colors.thirdTextColor,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: R.colors.mainTextColor,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          ...buildAnswers(),
          const SizedBox(height: 12),
          buildTips(),
        ],
      ),
    );
  }

  List<Widget> buildAnswers() {
    List<Widget> widgets = [];
    for (int i = 0; i < answers.length; i++) {
      widgets.add(buildAnswerItem(i + 1, answers[i]));
    }
    return widgets;
  }

  String get sendIcon {
    if (isSelfSend) {
      return Session.icon;
    }
    return widget.targetIcon;
  }

  String get receiverIcon {
    if (isSelfSend) {
      return widget.targetIcon;
    }
    return Session.icon;
  }

  bool isSelfSelect(int index) {
    return (isSelfSend && index == sendSelect) ||
        (!isSelfSend && index == receiverSelect);
  }

  Widget buildAnswerItem(int index, String answer) {
    late Color bg;
    late Color textColor;
    List<String> selectIcons = [];
    if (index == sendSelect && index == receiverSelect) {
      /// 双方选中
      bg = const Color(0xFFFF6D99);
      textColor = Colors.white;
      selectIcons.add(sendIcon);
      selectIcons.add(receiverIcon);
    } else if (isSelfSelect(index)) {
      /// 自己选中
      bg = const Color(0xFFFF6D99);
      textColor = Colors.white;
      selectIcons.add(Session.icon);
    } else if (index != sendSelect && index != receiverSelect) {
      /// 无人选中
      bg = Colors.white;
      textColor = const Color(0xFF313131);
    } else {
      /// 对方选中
      bg = Colors.white;
      textColor = const Color(0xFF313131);
      if (!isSelfSend && !hasSelect) {
        /// do nothing, 自己为接收方且还未选择，不展示发送方的头像
      } else {
        selectIcons.add(widget.targetIcon);
      }
    }
    return GestureDetector(
      onTap: () {
        if (!isSelfSend && isUnSelect) {
          /// 自己是接收方，且自己还未选择
          answerTacit(index);
        }
      },
      child: Stack(
        children: [
          Container(
            width: width - 32,
            height: answerHeight,
            margin: const EdgeInsetsDirectional.only(top: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: bg,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                height: 1.1,
              ),
            ),
          ),
          PositionedDirectional(
            start: 8,
            top: (answerHeight - (iconWidth + 2)) / 2 + 12,
            child: buildIcons(selectIcons),
          ),
        ],
      ),
    );
  }

  Widget buildIcons(List<String> icons) {
    if (icons.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: icons.length * (iconWidth + 2) - (icons.length - 1) * 6,
      height: iconWidth + 2,
      child: Stack(
        children: [
          buildIcon(icons[0]),
          if (icons.length > 1)
            PositionedDirectional(
              start: iconWidth - 6,
              child: buildIcon(icons[1]),
            ),
        ],
      ),
    );
  }

  Widget buildIcon(String icon) {
    return Container(
      width: iconWidth + 2,
      height: iconWidth + 2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: icon,
        shape: BoxShape.circle,
        size: iconWidth,
      ),
    );
  }

  Widget buildTips() {
    late String tips;
    if (sendSelect == receiverSelect) {
      tips = K.chat_tacit_select_same;
    } else if (isUnKnow) {
      tips = '';
    } else if (isUnSelect) {
      if (isSelfSend) {
        tips = K.chat_tacit_unselect_send;
      } else {
        tips = K.chat_tacit_unselect_receiver;
      }
    } else {
      return GestureDetector(
        onTap: () {
          TacitDialog.show(context, widget.targetUid);
          Tracker.instance
              .track(TrackEvent.questions_click_entrance, properties: {
            'questions_click_entrance_tag': 2,
          });
        },
        child: RichText(
          text: TextSpan(
            text: K.chat_tacit_select_diff_1,
            children: [
              TextSpan(
                text: K.chat_tacit_select_diff_2,
                style: TextStyle(
                  color: R.colors.highlightColor,
                  fontSize: 11,
                  height: 1.1,
                ),
              ),
              TextSpan(
                text: K.chat_tacit_select_diff_3,
                style: TextStyle(
                  color: R.colors.thirdTextColor,
                  fontSize: 11,
                  height: 1.1,
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 11,
              color: R.colors.thirdTextColor,
              fontFamily: Util.fontFamily,
              height: 1.1,
            ),
          ),
        ),
      );
    }
    return Text(
      tips,
      style: TextStyle(
        fontSize: 11,
        color: R.colors.thirdTextColor,
        height: 1.1,
      ),
    );
  }

  bool isAnswer = false;

  void answerTacit(int index) async {
    if (isAnswer) {
      return;
    }
    isAnswer = true;
    ResAnswerTacitQuestion res = await TacitRepo.answerTacit(msgId, index);
    if (mounted) {
      if (res.success == true) {
        setState(() {
          receiverSelect = index;
        });
        Tracker.instance
            .track(TrackEvent.questions_page_view_list, properties: {
          'questions_page_view_list_succeed': 1,
        });
      } else if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
    isAnswer = false;
  }
}
