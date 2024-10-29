import 'dart:convert';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import 'package:personaldata/src/intimate_card/intimate_card_bind_page.dart';
import 'intimate_card_detail_page.dart';

///亲密卡IM消息（包括发送者和接收者视角）
class IntimateCardIm extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final bool me; //是否自己发出的
  final String? sentText;
  final Widget? iconView;
  final String? targetName;

  const IntimateCardIm(
      {super.key,
      required this.message,
      required this.extra,
      required this.me,
      this.sentText,
      this.iconView,
      this.targetName});

  @override
  State<StatefulWidget> createState() {
    return _IntimateCardImState();
  }
}

class _IntimateCardImState extends State<IntimateCardIm> {
  late _IntimateCardImData _data;

  @override
  void initState() {
    super.initState();
    _data = _IntimateCardImData.fromExtra(widget.extra);
    if ((_data.function == 1 || _data.function == 2) &&
        (_data.statusToGet || _data.statusGot)) {
      _loadData();
    }
  }

  void _loadData() async {
    final res = await IntimateCardApi.intimateCardDetailPage(_data.cardId);
    if (res.success) {
      int status = res.data.card.status;
      if (status != _data.status) {
        _data.status = res.data.card.status;
        refresh();
        _saveStatus(_data.status);
      }
    }
  }

  //是否自己发出的
  bool get _me => widget.me;

  //是否领取或解绑的文本通知
  bool get _notify => _data.function == 3 || _data.function == 4;

  @override
  Widget build(BuildContext context) {
    String? targetName = widget.targetName;
    if (_me) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (!_notify) _buildCard(),
            if (!_notify)
              Container(
                width: double.infinity,
                alignment: AlignmentDirectional.centerEnd,
                margin: const EdgeInsetsDirectional.only(top: 2),
                child: Text(
                  widget.sentText ?? '',
                  style: TextStyle(
                      color: darkMode
                          ? Colors.white.withOpacity(0.3)
                          : Colors.black.withOpacity(0.3),
                      fontSize: 12),
                ),
              ),
            if (_notify && Util.validStr(targetName))
              ..._buildNotify(targetName!),
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_data.function != 3 && _data.function != 4)
            Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 6, bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: widget.iconView,
                  ),
                  const SizedBox(width: 8),
                  _buildCard(),
                ],
              ),
            ),
          if (_notify && Util.validStr(targetName))
            ..._buildNotify(targetName!),
        ],
      );
    }
  }

  List<Widget> _buildNotify(String targetName) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          R.img(Assets.personaldata$intimate_card_ic_intimate_card_heart_webp,
              width: 14, height: 14),
          const SizedBox(width: 4),
          _data.statusGot
              ? Text(
                  _data.sendUid == Session.uid
                      ? K.you_got_x_sent([targetName])
                      : K.x_got_your([targetName]),
                  style:
                      TextStyle(fontSize: 11, color: R.colors.secondTextColor),
                )
              : Text(K.your_intimate_card_unbind,
                  style:
                      TextStyle(fontSize: 11, color: R.colors.secondTextColor)),
          if (_data.statusGot)
            Text(K.intimacy_card_text,
                style: TextStyle(fontSize: 11, color: R.colors.highlightColor)),
        ],
      ),
      const SizedBox(height: 8),
    ];
  }

  Widget _buildCard() {
    String title =
        _me ? K.send_to_ta_intimate_card : K.i_send_your_intimate_card;
    String stateText;
    if (_data.statusToGet) {
      stateText = K.wait_collect;
    } else if (_data.statusGot) {
      stateText = K.gift_wall_task_btn_5;
    } else if (_data.statusInvalid) {
      stateText = K.personal_has_disable;
    } else {
      stateText = K.had_unbind;
    }
    return GestureDetector(
      onTap: () {
        if (_data.stateNotEnough && !_me && !_data.statusUnbound) {
          IntimateCardBindPage.launch(context, cardId: _data.cardId);
        } else {
          IntimateCardDetailPage.show(System.context, _data.cardId, (status) {
            if (status != _data.status) {
              _data.status = status;
              refresh();
              _saveStatus(_data.status);
            }
          }, addMoney: _data.addMoney);
        }
      },
      child: Container(
        width: 236,
        height: 93.5,
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          gradient: const LinearGradient(
              colors: [Color(0xFFDE8BF0), Color(0xFFC47AEB)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 59,
              child: Row(
                children: [
                  R.img(
                      Assets
                          .personaldata$intimate_card_ic_intimate_card_heart_webp,
                      width: 24,
                      height: 24),
                  const SizedBox(width: 7.5),
                  _data.stateNotEnough
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              K.not_enough_give_more,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            if (!_me) const SizedBox(height: 1),
                            if (!_me)
                              _data.statusUnbound
                                  ? Text(stateText,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.5)))
                                  : Row(
                                      children: [
                                        Text(K.gift_wall_dialog_btn_1,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white
                                                    .withOpacity(0.9))),
                                        R.img(
                                            BaseAssets
                                                .shared$box_ic_next_small_svg,
                                            width: 12,
                                            height: 12,
                                            color:
                                                Colors.white.withOpacity(0.9)),
                                      ],
                                    ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 1),
                            Text(
                              stateText,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(
                                    _data.statusInvalid || _data.statusUnbound
                                        ? 0.5
                                        : 0.9),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            Container(
              width: 216,
              height: 0.5,
              color: Colors.white.withOpacity(0.16),
            ),
            Container(
              height: 34,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                _data.stateNotEnough
                    ? K.intimacy_card_text
                    : (_data.addMoney > 0
                        ? K.personal_new_add + K.intimacy_card_consume_limit
                        : K.leave_msg_x([_data.desc])),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveStatus(int status) {
    widget.extra['status'] = status;
    String extra = json.encode(widget.extra);
    Im.setMessageExtraNew(widget.message.messageId, extra);
  }
}

class _IntimateCardImData {
  static const int got = 2;

  bool get statusToGet => status == 1; //待领取
  bool get statusGot => status == got; //已领取
  bool get statusInvalid => status == 3; //已失效
  bool get statusUnbound => status == 4; //已解绑

  final int function; //1赠送亲密卡，2还想要, 3领取 4解绑
  int status;
  int cardId;
  String msg;
  String desc;
  int sendUid; //赠送者uid
  String sendIcon; //赠送者头像
  int receiveUid; //获得者uid
  String receiveIcon; //获得者头像
  int money; //消费额度
  int cycle; //周期：1天，2星期，3月
  int addMoney; //当前周期新增额度

  bool get stateNotEnough => function == 2; //额度不够

  void setGot() {
    status = got;
  }

  _IntimateCardImData.fromExtra(Map map)
      : function = Util.parseInt(map['function']),
        cardId = Util.parseInt(map['card_id']),
        status = Util.parseInt(map['status']),
        msg = Util.notNullStr(map['msg']),
        desc = Util.notNullStr(map['desc']),
        sendUid = Util.parseInt(map['send_uid']),
        sendIcon = Util.notNullStr(map['send_icon']),
        receiveUid = Util.parseInt(map['receive_uid']),
        receiveIcon = Util.notNullStr(map['receive_icon']),
        money = Util.parseInt(map['money']),
        cycle = Util.parseInt(map['cycle']),
        addMoney = Util.parseInt(map['add_money']);
}
