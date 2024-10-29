import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import '../../k.dart';

/// 购买幸运蛋对应的头像框，不能直接购买幸运蛋。需要通过购买头像框等物品包装一下
class SlpBuyLuckyEggHeaderDialog extends StatefulWidget {
  final int giftId;
  final String title;
  final int num;
  final LuckyEggLevel eggLevel;
  final int totalMoney;

  const SlpBuyLuckyEggHeaderDialog(
      {super.key,
      required this.giftId,
      required this.title,
      required this.num,
      required this.eggLevel,
      required this.totalMoney});

  @override
  _DialogState createState() {
    return _DialogState();
  }

  static bool needShowDialog(String idAndLevel) {
    return Config.getInt('lucky_egg_dialog_show_$idAndLevel', 0) == 0;
  }
}

class _DialogState extends State<SlpBuyLuckyEggHeaderDialog> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              widget.title,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CachedNetworkImage(
            imageUrl: widget.eggLevel.image,
            width: 96,
            height: 96,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '${MoneyConfig.moneyNum(widget.eggLevel.price)}${MoneyConfig.moneyName} x${widget.num}',
              style: const TextStyle(
                color: Color(0xFFFE6C56),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            widget.eggLevel.desc,
            style: TextStyle(
              fontSize: 11,
              color: R.color.thirdTextColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 12,
              bottom: 32,
            ),
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 6,
              bottom: 6,
            ),
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  BaseK.K.base_extra_send,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 13,
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: widget.eggLevel.couponImage,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                Text(
                  widget.eggLevel.couponName,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 13,
                  ),
                ),
                Text(
                  ' x${widget.num}',
                  style: const TextStyle(
                    color: Color(0xFFFE6C56),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(MoneyConfig.moneyIcon, width: 20, height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: NumText(
                    MoneyConfig.moneyNum(widget.totalMoney),
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(false);
                    ISettingManager? manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_SETTINGS);
                    manager?.openRechargeScreen(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          K.gift_recharge,
                          style: TextStyle(
                            color: R.color.mainBrandColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: R.color.mainBrandColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                // 购买按钮
                GestureDetector(
                  onTap: _submit,
                  child: Container(
                    width: 72,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      K.gift_buy,
                      style: const TextStyle(
                        color: Color(0xFFFEFEFE),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Checkbox(
                activeColor: R.color.mainBrandColor,
                value: _checked,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value ?? false;
                  });
                },
              ),
              Text(
                BaseK.K.base_not_show_notice_anymore,
                style: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _submit() async {
    // 保存偏好
    if (_checked) {
      Config.set(
          'lucky_egg_dialog_show_${widget.giftId}_${widget.eggLevel.level}',
          '1');
    }
    Navigator.of(context).pop(true);
  }
}
