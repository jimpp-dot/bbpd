import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/accompany.tacit.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'accompany_tacit_repo.dart';

/// 默契问答底部弹窗
class TacitDialog extends StatefulWidget {
  final ChatRoomData room;
  final int targetUid;

  const TacitDialog({required this.targetUid, required this.room, Key? key})
      : super(key: key);

  @override
  TacitDialogState createState() {
    return TacitDialogState();
  }

  static Future<void> show(
      BuildContext context, int targetUid, ChatRoomData room) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.8,
      builder: (context) {
        return TacitDialog(
          targetUid: targetUid,
          room: room,
        );
      },
    );
  }
}

class TacitDialogState extends State<TacitDialog> {
  /// 选中答案
  int select = 0;

  ResTacitQuestion? question;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.questions_page_view_list, properties: {
      'questions_page_view_list_room': 1,
    });
    loadData();
  }

  Future<void> loadData({bool change = false}) async {
    ResTacitQuestion res =
        await AccompanyTacitRepo.getTacitQuestion(question?.question.id ?? 0);
    if (mounted) {
      if (!change) {
        setState(() {
          question = res;
        });
      } else {
        if (res.success == true) {
          setState(() {
            question = res;
            select = 0;
          });
        } else if (Util.validStr(res.msg)) {
          Fluttertoast.showCenter(msg: res.msg);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Stack(
        children: [
          Container(
            width: Util.width,
            padding: EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              top: 23,
              bottom: Util.isIphoneX ? Util.iphoneXBottom : 20,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                    Util.getRemoteImgUrl('static/chat/tacit_dialog_bg.webp')),
                fit: BoxFit.fill,
              ),
            ),
            child: buildBody(),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 18, bottom: 18, start: 10, end: 10),
                child: R.img(
                  'chat_close.svg',
                  package: ComponentManager.MANAGER_CHAT,
                  color: Colors.black,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    if (question == null) {
      return Container(
        width: Util.width,
        height: 400,
        alignment: AlignmentDirectional.center,
        child: const Loading(),
      );
    } else if (question?.success != true) {
      return Container(
        width: Util.width,
        height: 400,
        alignment: AlignmentDirectional.center,
        child: Text(
          question?.msg ?? BaseK.K.server_return_error_retry,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl:
                Util.getRemoteImgUrl('static/chat/tacit_dialog_title.webp'),
            width: 94,
            height: 21,
            cachedWidth: 94.px,
            cachedHeight: 21.px,
          ),
        ),
        const SizedBox(
          height: 47,
        ),
        Text(
          question?.question.question ?? '',
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF202020),
            height: 1.2,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ...buildAnswer(),
        const SizedBox(
          height: 36,
        ),
        Text(
          K.room_accompany_tacit_dialog_desc,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0x99313131),
            height: 1.1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildOption(),
      ],
    );
  }

  Widget buildOption() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            changeQuestion();
            Tracker.instance
                .track(TrackEvent.questions_page_view_list, properties: {
              'questions_page_view_list_change_room': 1,
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: (Util.width - 40 - 11) / 2,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(26),
              color: const Color(0xFFF6F7F9),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_accompany_tacit_dialog_option_change,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xB3202020),
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            /// 发送
            if (select > 0) {
              send(select);
              Tracker.instance
                  .track(TrackEvent.questions_page_view_list, properties: {
                'questions_page_view_list_send_room': 1,
              });
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: (Util.width - 40 - 11) / 2,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(26),
              color: select > 0
                  ? const Color(0xFFFF5F7D)
                  : const Color(0x7FFF5F7D),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              BaseK.K.base_send,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildAnswer() {
    List<Widget> widgets = [];
    if (Util.validStr(question?.question.answer1)) {
      widgets.add(buildAnswerItem(1, question?.question.answer1 ?? ''));
    }
    if (Util.validStr(question?.question.answer2)) {
      widgets.add(buildAnswerItem(2, question?.question.answer2 ?? ''));
    }
    if (Util.validStr(question?.question.answer3)) {
      widgets.add(buildAnswerItem(3, question?.question.answer3 ?? ''));
    }
    if (Util.validStr(question?.question.answer4)) {
      widgets.add(buildAnswerItem(4, question?.question.answer4 ?? ''));
    }
    return widgets;
  }

  Widget buildAnswerItem(int index, String answer) {
    bool hasSelect = index == select;
    return GestureDetector(
      onTap: () {
        if (select != index && mounted) {
          setState(() {
            select = index;
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Util.width - 80,
        height: 52,
        margin: const EdgeInsetsDirectional.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(27),
          color: hasSelect ? const Color(0xFFFF5F7D) : const Color(0xFFF6F7F9),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          answer,
          style: TextStyle(
            fontSize: 18,
            color:
                hasSelect ? const Color(0xFFF6F7F9) : const Color(0xFF313131),
            height: 1.1,
          ),
        ),
      ),
    );
  }

  bool isChange = false;
  void changeQuestion() async {
    if (isChange) {
      return;
    }
    isChange = true;
    await loadData(change: true);
    isChange = false;
  }

  bool isSend = false;
  void send(int select) async {
    if (isSend) {
      return;
    }
    isSend = true;
    int questionId = question?.question.id ?? 0;
    ResSendTacitQuestion res = await AccompanyTacitRepo.sendTacit(
      questionId,
      widget.targetUid,
      select,
      widget.room.rid,
    );
    if (mounted) {
      if (res.success == true) {
        Navigator.pop(context);
      } else if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
    isSend = false;
  }
}
