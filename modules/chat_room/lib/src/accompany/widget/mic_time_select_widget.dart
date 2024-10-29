import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/accompany/model/accompany_pay_model.dart';

import '../../../chat_room.dart';

enum MicTimeSelectType {
  normal,
  remain,
  free,
}

class MicTimeSelectWidget extends StatefulWidget {
  final AccompanyGiftData giftData;
  final ChatRoomData room;
  final bool remain;
  const MicTimeSelectWidget(this.giftData, this.room,
      {super.key, this.remain = false});
  static bool showing = false;

  static Future show(BuildContext context, ChatRoomData room, int remainTime,
      {bool remain = false}) async {
    Log.d('MicTimeSelectWidget:${MicTimeSelectWidget.showing}');
    if (MicTimeSelectWidget.showing) {
      return Future.value();
    }
    MicTimeSelectWidget.showing = true;
    if (room.positions[1].uid > 0 && room.positions[1].uid != Session.uid) {
      //麦上不是自己
      Fluttertoast.showCenter(msg: K.room_can_not_up_mic);
      MicTimeSelectWidget.showing = false;
      return Future.value();
    }
    DataRsp<AccompanyGiftData> dataRsp =
        await RoomApi.accompanyGiftData(room.rid);
    if (Util.validStr(dataRsp.msg) || dataRsp.data == null) {
      Fluttertoast.showCenter(msg: dataRsp.msg);
      MicTimeSelectWidget.showing = false;
      return Future.value();
    }
    if (remainTime <= 0 && dataRsp.data!.leftTime > 0) {
      //时间状态不一致以服务器为准
      if (room.positions[1].uid == 0) {
        ChatRoomUtil.handleIconTap(
            context, room, room.positions[1], 'mic-join');
      }
      MicTimeSelectWidget.showing = false;
      return Future.value();
    }

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        )),
        builder: (BuildContext context) {
          return MicTimeSelectWidget(
            dataRsp.data!,
            room,
            remain: remain,
          );
        });
  }

  @override
  _MicTimeSelectWidgetState createState() => _MicTimeSelectWidgetState();
}

class _MicTimeSelectWidgetState extends State<MicTimeSelectWidget> {
  int _remainTime = 30;
  late Gift _selectItem;
  MicTimeSelectType _type = MicTimeSelectType.normal;
  late AccompanyGiftData _data;
  late List<Gift> _giftData;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  bool _paying = false;
  @override
  void initState() {
    super.initState();
    _data = widget.giftData;
    widget.room.addListener(
        RoomConstant.Event_Refresh_Remain_Time, _refreshRemindTime);

    if (Util.validList(_data.giftNewer) && !widget.remain) {
      _type = MicTimeSelectType.free;
      _giftData = _data.giftNewer;
    } else if (Util.validList(_data.giftPay)) {
      _giftData = _data.giftPay;
      _type = MicTimeSelectType.normal;
      if (widget.remain) {
        _type = MicTimeSelectType.remain;
      }
    }
    _selectItem = _giftData.first;
  }

  @override
  void dispose() {
    MicTimeSelectWidget.showing = false;
    widget.room.removeListener(
        RoomConstant.Event_Refresh_Remain_Time, _refreshRemindTime);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 22, 0, 20),
          child: _buildContent(),
        ));
  }

  Widget _buildContent() {
    if (!Util.validList(_giftData)) {
      return const EmptyWidget();
    }
    String title = K.room_select_mic_time;
    String tips = K.room_send_gift_add_mic_time;
    if (_type == MicTimeSelectType.remain) {
      title = K.room_remain_time_not_enough;
    } else if (_type == MicTimeSelectType.free) {
      title = K.room_free_mic_gift_title;
      tips = K.room_free_mic_gift_tips;
    }
    double size = (Util.width - 32) / 3;
    String btnTitle = K.room_send_and_up_mic;
    if (_type == MicTimeSelectType.free) {
      btnTitle = '$btnTitle (${K.free})';
    } else {
      btnTitle = '$btnTitle (${_selectItem.giftPrice}${MoneyConfig.moneyName})';
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: R.textStyle.medium18,
            ),
            if (_type == MicTimeSelectType.remain)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Text(
                  '(${Utility.formatTimeClock(_remainTime)})',
                  style: R.textStyle.medium18
                      .copyWith(color: R.color.mainBrandColor),
                ),
              )
          ],
        ),
        Container(
          height: 1,
          color: R.color.dividerColor,
          margin: const EdgeInsetsDirectional.only(
              top: 8, bottom: 8, start: 20, end: 20),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 20),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            tips,
            style: R.textStyle.regular12
                .copyWith(color: R.color.secondTextColor, fontSize: 13),
          ),
        ),
        SizedBox(
          height: size - 8 + 26 + 24,
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 12, bottom: 12),
            itemBuilder: _buildItem,
            itemCount: _giftData.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        GestureDetector(
          onTap: () {
            _submit();
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            height: 56,
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors)),
            child: Text(
              btnTitle,
              style: R.textStyle.regular16.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    double size = (Util.width - 32) / 3;
    Gift giftItem = _giftData[index];
    bool select = (_selectItem.id == giftItem.id);
    if (_type == MicTimeSelectType.free) {
      select = false;
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              if (_selectItem.id != giftItem.id) {
                _selectItem = giftItem;
                if (mounted) {
                  setState(() {});
                }
              }
            },
            child: Container(
              width: size - 8,
              height: size - 8,
              decoration: BoxDecoration(
                  color: select
                      ? const Color(0x1460C8FF)
                      : const Color(0xFFF6F7F9),
                  borderRadius: BorderRadius.circular(12),
                  border: select
                      ? Border.all(color: R.color.mainBrandColor)
                      : null),
              alignment: AlignmentDirectional.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: [
                  PositionedDirectional(
                    start: 20,
                    top: 20,
                    bottom: 20,
                    end: 20,
                    child: CachedNetworkImage(
                      placeholder: const CupertinoActivityIndicator(),
                      imageUrl: giftItem.giftIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  PositionedDirectional(
                      start: 0,
                      top: 0,
                      child: Container(
                        padding:
                            const EdgeInsetsDirectional.only(start: 4, end: 4),
                        decoration: const BoxDecoration(
                            color: Color(0xFFE0F4FF),
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(12),
                              bottomEnd: Radius.circular(12),
                            )),
                        height: 20,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              MoneyConfig.moneyIcon,
                              fit: BoxFit.contain,
                              width: 16.0,
                              height: 16.0,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${giftItem.giftPrice} ',
                              style: R.textStyle.medium16.copyWith(
                                  decoration: (_type == MicTimeSelectType.free)
                                      ? TextDecoration.lineThrough
                                      : null,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(_giftTitleWithTime(giftItem.micDuration),
              style: R.textStyle.medium16)
        ],
      ),
    );
  }

  String _giftTitleWithTime(int time) {
    int min = time ~/ 60;
    String str = min.toString() + K.room_unit_minute;
    if (_type == MicTimeSelectType.free) {
      str = '$str/${K.free}';
    }
    return str;
  }

  int _cid = 0; // 背包礼物id
  String _ctype = ''; // // 背包礼物类型
  int _ductionMoney = 0; // 优惠金额
  int _totalNum = 0;
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  String? _giftType; // 礼物类型：normal、coin（金币礼物,只能用金币赠送）

  _submit() async {
    if (_paying) {
      return;
    }
    _paying = false;
    if (widget.room.positions.first.uid <= 0) {
      Fluttertoast.showCenter(msg: K.room_select_one_target);
      return;
    }
    Gift? gift = _selectItem;

    int userNum = 1;
    int finalGiftNum = 1;

    _giftType = gift.giftType;

    if (gift.giftType == 'coin') {
      // 金币礼物以实际下发的为价格
      _giftPrice = gift.price.round();
    } else {
      _giftPrice = (gift.price * 100).round();
    }

    if (_giftPrice <= 0) return;

    _ctype = gift.ctype ?? '';
    _cid = gift.cid;
    int cnum = gift.cnum; // 如果背包有该礼物，则返回礼物数量
    // 重置
    _ductionMoney = 0;

    if (_cid > 0 &&
        (((_ctype == 'gift' || _ctype == 'key') &&
                cnum >= finalGiftNum * userNum) ||
            (_ctype == 'coupon' && cnum >= 1))) {
      _ductionMoney = gift.ductionMoney;
    } else {
      _cid = 0;
      _ctype = '';
    }

    _totalPrice = _giftPrice * finalGiftNum * userNum;
    _totalNum =
        _cid > 0 && ((_ctype == 'key') && cnum >= finalGiftNum * userNum)
            ? 0
            : finalGiftNum * userNum;
    _displayPay(_cid > 0 && cnum >= finalGiftNum * userNum);
  }

  _pay(String? type) {
    int finalGiftNum = 1;
    _payManager.pay(context,
        key: 'gift',
        type: type ?? '',
        refer: 'gift',
        args: {
          'money': _totalPrice,
          'type': 'package',
          'params': {
            'rid': widget.room.rid.toString(),
            'uids': widget.room.positions.first.uid.toString(),
            'positions': '0',
            'position': '1',
            'giftId': _selectItem.id,
            'giftNum': finalGiftNum,
            'price': _giftPrice,
            'cid': _cid,
            'ctype': _ctype,
            'duction_money': _ductionMoney,
            'version': 2,
            'num': _totalNum,
            'gift_type': _giftType ?? '',
            'star': 0,
            'show_pac_man_guide':
                Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
            'refer': 'room',
          }
        },
        onPayed: () => _onPayed(),
        onError: (isErrorCatch) => _onPayError(isErrorCatch));
  }

  void _onPayed() {
    _paying = false;
    Navigator.of(context).pop();
    _upMic();
  }

  void _upMic() {
    if (widget.room.positions[1].uid == 0) {
      ChatRoomUtil.handleIconTap(
          context, widget.room, widget.room.positions[1], 'mic-join');
    }
  }

  void _onPayError(bool isErrorCatch) {
    _paying = false;
  }

  _displayPay(bool free) async {
    _paying = true;
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, free ? 0 : ((_totalPrice) - (_ductionMoney)));
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      _paying = false;
      return;
    }
    _pay(result.value?.key);
  }

  void _refreshRemindTime(String name, dynamic data) {
    if (_type != MicTimeSelectType.remain) return;
    _remainTime = Util.parseInt(data);
    if (_remainTime > 0) {
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        Navigator.of(context).pop();
      }
    }
  }
}
