import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/k.dart';

enum ComboGiftTipType {
  Live,
  Ktv,
}

class ComboGiftTipDialog extends StatefulWidget {
  static const String comboGiftTip = 'combo_gift_tip_has_show';
  static const String comboGiftKtvTip = 'combo_gift_ktv_tip_has_show';
  final int giftId;
  final String? giftName;
  final double giftPrice;
  final ComboGiftTipType type;
  final String giftType;

  const ComboGiftTipDialog(this.giftId, this.giftPrice, this.type,
      {super.key, this.giftType = 'normal', this.giftName = ''});

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<ComboGiftTipDialog> {
  late String giftIcon;
  bool _checked = true;

  @override
  void initState() {
    super.initState();
    giftIcon = '${System.imageDomain}static/$giftSubDir/${widget.giftId}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 23,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl: giftIcon,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                ),
                Text(
                  widget.type == ComboGiftTipType.Ktv
                      ? K.room_send_combo_gift_ktv
                      : K.room_send_combo_gift,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: widget.type == ComboGiftTipType.Ktv ? 200 : 175,
              child: RichText(
                text: TextSpan(
                  text: widget.type == ComboGiftTipType.Ktv
                      ? K.room_send_combo_gift_price_ktv(
                          [widget.giftName ?? ''])
                      : K.room_send_combo_gift_price,
                  style: TextStyle(
                    fontSize: 14,
                    color: R.color.secondTextColor,
                    fontFamily: Util.fontFamily,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: moneyText,
                      style: TextStyle(
                        fontSize: 14,
                        color: R.color.fourthBrightColor,
                      ),
                    ),
                    TextSpan(
                      text: K.room_send_combo_gift_price_2,
                      style: TextStyle(
                        fontSize: 14,
                        color: R.color.secondTextColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Checkbox(
                  activeColor: R.color.mainBrandColor,
                  value: _checked,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool? value) {
                    setState(() {
                      _checked = value == true;
                    });
                  },
                ),
                Text(
                  BaseK.K.base_not_show_notice_anymore,
                  style: TextStyle(
                    color: R.color.thirdTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 20,
                ),
                _buildButton(false),
                const SizedBox(
                  width: 8,
                ),
                _buildButton(true),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void onPositiveTap() {
    setPreference();
    Navigator.of(context).pop(true);
  }

  void onNegativeTap() {
    setPreference();
    Navigator.of(context).pop(false);
  }

  void setPreference() {
    if (_checked) {
      if (widget.type == ComboGiftTipType.Ktv) {
        Config.set(ComboGiftTipDialog.comboGiftKtvTip, '1');
      } else {
        Config.set(ComboGiftTipDialog.comboGiftTip, '1');
      }
    }
  }

  Widget _buildButton(bool isPositive) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isPositive ? onPositiveTap : onNegativeTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 132,
          height: 48,
          decoration: BoxDecoration(
            color: isPositive ? null : R.color.secondBgColor,
            gradient: isPositive
                ? LinearGradient(colors: R.color.mainBrandGradientColors)
                : null,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              isPositive ? BaseK.K.confirm : BaseK.K.cancel,
              style: TextStyle(
                color: isPositive ? Colors.white : R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get moneyText {
    String money;
    if ('normal' == widget.giftType) {
      money = MoneyConfig.moneyNum(Util.parseInt(widget.giftPrice * 100));
    } else {
      money = '${Util.parseInt(widget.giftPrice)}';
    }

    return money + MoneyConfig.getMoneyTxtByType(widget.giftType);
  }
}
