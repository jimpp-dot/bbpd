import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

class LivePkAgreeDialogV3 extends StatefulWidget {
  static const String DISMISS_DIALOG = 'dismiss_dialog';
  final String name;
  final String headIcon;
  final int sex;
  final int age;
  final int fromUid;
  final int toUid;
  final int personCount;
  final int pkTime;
  final String punishContent;
  final int fromRid;
  final int toRid;
  final int pkId;
  final int counter;
  final int timestamp;
  final int inviteSource; //1，表示从好友列表中邀请，2，最近PK场记录中邀请，3，搜索结果邀请，4，随机邀请匹配（4不需要用户传）

  const LivePkAgreeDialogV3({
    Key? key,
    required this.name,
    required this.headIcon,
    required this.sex,
    required this.age,
    required this.fromUid,
    required this.toUid,
    required this.personCount,
    required this.pkTime,
    required this.punishContent,
    required this.fromRid,
    required this.toRid,
    required this.pkId,
    required this.counter,
    required this.timestamp,
    required this.inviteSource,
  }) : super(key: key);

  @override
  State<LivePkAgreeDialogV3> createState() => PkAgreeState();

  static show(
    BuildContext context, {
    required String name,
    required String headIcon,
    required int sex,
    required int age,
    required int fromUid,
    required int toUid,
    required int pkId,
    required int fromRid,
    required int toRid,
    required int personCount,
    required int pkTime,
    required String pkPunishContent,
    required int counter,
    required int timestamp,
    required int inviteSource,
  }) {
    eventCenter.emit(DISMISS_DIALOG);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LivePkAgreeDialogV3(
          name: name,
          headIcon: headIcon,
          sex: sex,
          age: age,
          fromUid: fromUid,
          toUid: toUid,
          fromRid: fromRid,
          toRid: toRid,
          pkId: pkId,
          personCount: personCount,
          pkTime: pkTime,
          punishContent: pkPunishContent,
          counter: counter,
          timestamp: timestamp,
          inviteSource: inviteSource,
        );
      },
    );
  }
}

class PkAgreeState extends State<LivePkAgreeDialogV3> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(LivePkAgreeDialogV3.DISMISS_DIALOG, _dismiss);
  }

  _dismiss(String type, dynamic data) {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    eventCenter.removeListener(LivePkAgreeDialogV3.DISMISS_DIALOG, _dismiss);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0x00000000),
      insetPadding: const EdgeInsetsDirectional.only(start: 32, end: 32)
          .resolve(Directionality.of(context)),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: const EdgeInsetsDirectional.only(
            start: 16, top: 20, end: 16, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.fromUid == Session.uid
                  ? K.live_pk_to_other
                  : K.live_pk_from_other,
              style: const TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 14),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [Color(0xFFFEF4FF), Color(0xFFF0F8FF)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  _buildUserWidget(),
                  const SizedBox(height: 8),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 12, end: 12),
                    child: Divider(
                        height: 1,
                        color: const Color(0xFF202020).withOpacity(0.08)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(K.live_agree_pk_time,
                                style: TextStyle(
                                    color: const Color(0xFF202020)
                                        .withOpacity(0.4),
                                    fontSize: 11)),
                            const SizedBox(height: 4),
                            Text(
                              R.string('live_pk_second',
                                  args: ['${widget.pkTime}']),
                              style: const TextStyle(
                                  color: Color(0xFF202020), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(K.live_agree_pk_punish,
                                style: TextStyle(
                                    color: const Color(0xFF202020)
                                        .withOpacity(0.4),
                                    fontSize: 11)),
                            const SizedBox(height: 4),
                            Text(widget.punishContent,
                                style: const TextStyle(
                                    color: Color(0xFF202020), fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // ClipRRect(
                  //   borderRadius: const BorderRadiusDirectional.only(
                  //           bottomStart: Radius.circular(12), bottomEnd: Radius.circular(12))
                  //       .resolve(
                  //     Directionality.of(context),
                  //   ),
                  //   child: PkScoreWidget.noScore(),
                  // )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.fromUid == Session.uid) {
                        cancelPK(context); //主方取消pk
                      } else {
                        refusePk(context); //客方拒绝PK
                      }
                    },
                    child: Container(
                      height: 48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color(0xFFF5F5F5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.fromUid == Session.uid
                            ? K.live_cancel_pk
                            : K.live_refuse_pk,
                        style: TextStyle(
                            color: const Color(0xFF202020).withOpacity(0.7),
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.fromUid == Session.uid) {
                        startPK(context); //主方开始PK
                      } else {
                        agreePk(context); //客方接受PK
                      }
                    },
                    child: Container(
                      height: 48,
                      decoration: commonBoxDecorationWithParams(
                          R.colors.darkGradientColors, 24),
                      alignment: Alignment.center,
                      child: Text(
                        widget.fromUid == Session.uid
                            ? K.live_start_pk
                            : K.live_agreee_pk,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildTimer(context)
          ],
        ),
      ),
    );
  }

  Widget _buildUserWidget() {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          const SizedBox(width: 12),
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: System.imageDomain + widget.headIcon,
              fit: BoxFit.fill,
              width: 52.0,
              height: 52.0,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 255),
                    child: Text(
                      widget.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          height: 1.2,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 4),
                  UserSexAndAgeWidget(
                      sex: widget.sex, age: widget.age, width: 29, height: 12),
                ],
              ),
              const SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.sex == 1
                          ? K.live_pk_agree_person_count_male
                          : K.live_pk_agree_person_count_female,
                      style: TextStyle(
                          color: const Color(0xFF202020).withOpacity(0.6),
                          fontSize: 13),
                    ),
                    TextSpan(
                      text: '${widget.personCount}',
                      style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: K.live_pk_agree_count_person,
                      style: TextStyle(
                          color: const Color(0xFF202020).withOpacity(0.6),
                          fontSize: 13),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          R.img('livev3/room_live_pk.webp',
              width: 316 / 5,
              height: 300 / 5,
              package: ComponentManager.MANAGER_BASE_ROOM),
          const SizedBox(width: 12)
        ],
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    int timer = widget.counter - widget.timestamp;
    if (timer <= 0) {
      return const SizedBox.shrink();
    }

    return TimerWidget(
      key: GlobalKey(),
      stop: Duration(seconds: timer),
      onTick: () {
        timer--;
        if (timer <= 0) {
          if (ModalRoute.of(context)?.isCurrent ?? false) {
            Navigator.of(context).pop();
          }
        }
      },
      builder: (context) {
        return Text(
          R.string('live_pk_agree_timer', args: ['$timer']),
          style: TextStyle(
              color: const Color(0xFF313131).withOpacity(0.6), fontSize: 12),
        );
      },
    );
  }

  //拒绝PK邀请
  void refusePk(BuildContext context) async {
    DataRsp rsp = await LiveRepositoryV3.pkReject(
      pkId: widget.pkId,
      mainRid: widget.fromRid,
      competeRid: widget.toRid,
      inviteSource: widget.inviteSource,
    );
    if (rsp.success == true &&
        rsp.data is Map &&
        rsp.data.containsKey('left_reject_times')) {
      Fluttertoast.showCenter(
          msg: K.room_pk_left_reject_times(
              [rsp.data['left_reject_times'].toString()]));
    } else if (!(rsp.success == true) && rsp.msg != null) {
      Fluttertoast.showCenter(msg: rsp.msg);
    }

    Navigator.of(context).pop();
  }

  /// 接受PK邀请
  void agreePk(BuildContext context) async {
    String url = "${System.domain}games/match/pkagreev2";
    final Map<String, String> params = {
      "pk_id": widget.pkId.toString(),
      "main_rid": widget.fromRid.toString(),
      "compete_rid": widget.toRid.toString(),
    };

    XhrResponse response = await Xhr.postJson(url, params);
    Map res = response.value();
    if (res["success"] == false) {
      Fluttertoast.showToast(
          msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
    }
    Navigator.of(context).pop();
  }

  /// 取消PK
  void cancelPK(BuildContext context) async {
    String url = "${System.domain}games/match/pkcancel";
    final Map<String, String> params = {
      "pk_id": widget.pkId.toString(),
      "main_rid": widget.fromRid.toString(),
      "compete_rid": widget.toRid.toString(),
    };

    XhrResponse response = await Xhr.postJson(url, params);
    Map res = response.value();
    if (res["success"] == false) {
      Fluttertoast.showToast(
          msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
    }
    Navigator.of(context).pop();
  }

  ///开始PK
  void startPK(BuildContext context) async {
    String url = "${System.domain}games/pk/start";
    final Map<String, String> params = {
      "pk_id": widget.pkId.toString(),
      "main_rid": widget.fromRid.toString(),
      "compete_rid": widget.toRid.toString(),
      "compete_uid": widget.toUid.toString()
    };

    XhrResponse response = await Xhr.postJson(url, params);
    Map res = response.value();
    if (res["success"] == false) {
      Fluttertoast.showToast(
          msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
    }
    Navigator.of(context).pop();
  }
}
