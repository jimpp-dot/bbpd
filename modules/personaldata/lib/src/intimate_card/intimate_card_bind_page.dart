import 'package:personaldata/k.dart';

import 'dart:math' as math;
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personaldata/assets.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personaldata/src/api/intimate_card_api.dart';
import 'package:personaldata/src/intimate_card/intimate_card_bind_period_dialog.dart';

const String _keyIntimateCardUserProtocol = 'key_intimate_card_user_protocol';

/// 赠送亲密卡
class IntimateCardBindPage extends StatefulWidget {
  final IntimateCardRelationUserInfo? toUserParam;
  final String? message; // 默认赠送流量，关系的二级标题
  final int cardId;
  final VoidCallback? finishBindCard;

  const IntimateCardBindPage(
      {super.key,
      this.toUserParam,
      this.message,
      this.cardId = 0,
      this.finishBindCard});

  static Future launch(BuildContext context,
      {IntimateCardRelationUserInfo? toUserParam,
      String? message,
      int cardId = 0,
      VoidCallback? finishBindCard}) async {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return IntimateCardBindPage(
          toUserParam: toUserParam,
          message: message,
          cardId: cardId,
          finishBindCard: finishBindCard);
    }));
  }

  @override
  State<IntimateCardBindPage> createState() => _IntimateCardBindPageState();
}

class _IntimateCardBindPageState extends BaseScreenState<IntimateCardBindPage> {
  final GlobalKey _periodKey = GlobalKey();

  final RxBool _agreePrivacy = RxBool(false); // 协议是否选中
  final RxBool _privacyBubble = RxBool(false); // 协议引导气泡
  final RxBool _showPeriod = RxBool(false); // 亲密付周期选择弹窗是否显示
  final Rx<IntimateCardBindPeriod> _period = Rx(IntimateCardBindPeriod.month);
  final TextEditingController _moneyController = TextEditingController();
  late TextEditingController _tipController;

  late IntimateCardRelationUserInfo _toUser;

  @override
  void initState() {
    super.initState();
    _checkUserProtocol();
    _tipController = TextEditingController(text: widget.message ?? '');
    if (widget.toUserParam != null) {
      _toUser = widget.toUserParam!;
      screenStatus = ScreenStatus.Ready;
    } else {
      _load(widget.cardId);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _moneyController.dispose();
    _tipController.dispose();
  }

  Future _checkUserProtocol() async {
    bool? hasSelectProtocol = await HiveUtil.get<bool>(
        _keyIntimateCardUserProtocol,
        defaultValue: false);
    if (hasSelectProtocol == true) {
      _agreePrivacy.value = true;
      _privacyBubble.value = false;
    } else {
      _agreePrivacy.value == false;
      _privacyBubble.value = true;
    }
  }

  Future _load(int cardId) async {
    ResIntimateCardDetail res =
        await IntimateCardApi.intimateCardDetailPage(cardId);
    if (res.success) {
      _toUser = IntimateCardRelationUserInfo(
          uid: res.data.card.uid,
          name: res.data.card.name,
          icon: res.data.card.icon,
          defendValue: res.data.defendValue,
          relationId: res.data.card.relationId);
      _tipController.text = res.data.message;
      _period.value = IntimateCardBindPeriod.parse(res.data.card.cycle);
      setScreenReady();
    } else {
      setScreenError(errorMsg: res.msg);
    }
  }

  Future _send() async {
    if (!_agreePrivacy.value) {
      Fluttertoast.showCenter(msg: K.intimacy_card_send_tip_1);
      return;
    }
    int money = _getMoney();
    if (money <= 0) {
      Fluttertoast.showCenter(msg: K.intimacy_card_send_tip_2);
      return;
    }
    if (_tipController.text.trim().isEmpty) {
      Fluttertoast.showCenter(msg: K.intimacy_card_send_tip_3);
      return;
    }
    CommonLoading.show();
    NormalNull normalNull = await IntimateCardApi.sendIntimacyCard(
        cardId: widget.cardId,
        toUid: _toUser.uid,
        money: _getMoney().toString(),
        cycle: _period.value.value,
        message: _tipController.text.trim(),
        relationId: _toUser.relationId);
    CommonLoading.dismiss();
    if (!mounted) return;
    if (normalNull.success) {
      Fluttertoast.showCenter(msg: K.sent_successful);
      Tracker.instance.track(TrackEvent.send_card_success, properties: {
        'uid': _toUser.uid,
        'of_uid': Session.uid,
        'money': money,
      });
      if (widget.finishBindCard != null) {
        widget.finishBindCard!();
      }
      Navigator.pop(context);
    } else {
      Fluttertoast.showCenter(msg: normalNull.msg);
    }
  }

  int _getMoney() {
    int money = 0;
    try {
      money = ((double.tryParse(_moneyController.text) ?? 0)).truncate();
      Log.d('_getMoney money');
    } catch (e) {
      Log.d(e);
    }
    return money;
  }

  void _onMoneyInputChange(String value) {
    const locale = 'en';
    String formatNumber(String s) =>
        NumberFormat.decimalPattern(locale).format(int.parse(s));
    String currency() =>
        NumberFormat.compactSimpleCurrency(locale: locale).currencySymbol;
    String text = formatNumber(value.replaceAll(',', ''));
    _moneyController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  @override
  void onTapErrorWidget() {
    _load(widget.cardId);
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 6, bottom: 18, start: 16, end: 16),
          child: Row(
            children: [
              CommonAvatar(
                  path: _toUser.icon, size: 44, shape: BoxShape.circle),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _toUser.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          K.personal_defend_core,
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 11),
                        ),
                        NumText(
                          '${_toUser.defendValue}',
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: Util.width - 16 * 2,
          height: 184,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              PositionedDirectional(
                end: 0,
                child: R.img(
                    Assets
                        .personaldata$intimate_card_ic_intimate_card_detail_webp,
                    width: 100,
                    height: 100),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 48,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        K.intimacy_card_consume_limit,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: R.color.dividerColor, width: 1)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          R.img(MoneyConfig.moneyIcon, width: 24, height: 24),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _moneyController,
                              maxLines: 1,
                              autofocus: true,
                              style: TextStyle(
                                height: 1,
                                color: R.color.mainTextColor,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: Util.numFontFamily,
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              /// 亲密卡id>0 不能选
                              if (widget.cardId > 0) return;
                              _showPeriod.value = true;
                              CommonPopupWindow.showPopWindow(
                                      context, '', _periodKey,
                                      popWidget:
                                          const IntimateCardBindPeriodDialog(),
                                      backgroundColor: Colors.transparent,
                                      offset: -6)
                                  .then((value) {
                                _showPeriod.value = false;
                                if (value != null) {
                                  _period.value = value;
                                }
                              });
                            },
                            child: Obx(() {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _period.value.text,
                                    style: TextStyle(
                                        color: R.color.mainTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  if (widget.cardId <= 0)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 3),
                                      child: Transform.rotate(
                                          angle:
                                              _showPeriod.isTrue ? math.pi : 0,
                                          child: R.img(
                                              Assets
                                                  .personaldata$ic_arrow_up_png,
                                              key: _periodKey,
                                              width: 12,
                                              height: 12)),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      K.intimacy_card_send_use_info,
                      style:
                          TextStyle(color: R.color.tipsTextColor, fontSize: 11),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(K.marry_leave_message,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 16)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _tipController,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 16),
                            maxLines: 1,
                            decoration: null,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildPrivacyCheckBox(),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _send,
          child: Container(
            width: Util.width - 16 * 2,
            height: 52,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Text(
              K.give_immediately,
              style: TextStyle(
                  color: R.color.brightTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.intimacy_card_money_limit,
        toolbarHeight: 44,
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: buildStatusContent(),
    );
  }

  Widget _buildPrivacyCheckBox() {
    return GestureDetector(
      onTap: () {
        _agreePrivacy.value = !_agreePrivacy.value;
        if (_agreePrivacy.value) {
          HiveUtil.put<bool>(_keyIntimateCardUserProtocol, true);
        }
        _privacyBubble.value = false;
      },
      behavior: HitTestBehavior.opaque,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Obx(
                () => _agreePrivacy.isTrue
                    ? const CheckBoxChecked(width: 18, height: 18)
                    : CheckBoxUnchecked(
                        color: R.color.mainTextColor.withOpacity(0.2),
                        width: 18,
                        height: 18),
              ),
              const SizedBox(width: 3),
              Text(
                K.i_hava_read_and_agree,
                style: TextStyle(fontSize: 12, color: R.color.thirdTextColor),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: Util.getProductHelpUrl('k226'),
                      title: K.intimacy_card_user_service_protocol);
                },
                child: Text(
                  K.intimacy_card_user_service_protocol,
                  style: TextStyle(fontSize: 12, color: R.color.mainTextColor),
                ),
              ),
            ],
          ),
          Obx(() {
            return Visibility(
              visible: _privacyBubble.isTrue,
              child: PositionedDirectional(
                start: 4.5,
                top: -41.5,
                child: Container(
                  width: 114,
                  height: 39.5,
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsetsDirectional.only(bottom: 5.5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(R.imagePath(
                            Assets.personaldata$bg_bubble_left_down_webp))),
                  ),
                  child: Text(
                    K.intimacy_card_please_select_protocol,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
