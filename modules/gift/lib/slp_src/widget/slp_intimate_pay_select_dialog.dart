import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';

/// 礼物面板亲密卡切换按钮
class SlpIntimatePaySelectButton extends StatefulWidget {
  final double ratio;
  final ValueChanged<IntimateCardInfo?> intimateCardSelectCallback;
  final IntimateCardInfo? selectedCard;

  const SlpIntimatePaySelectButton(
      {super.key,
      required this.ratio,
      required this.intimateCardSelectCallback,
      required this.selectedCard});

  @override
  State<SlpIntimatePaySelectButton> createState() =>
      _SlpIntimatePaySelectButtonState();
}

class _SlpIntimatePaySelectButtonState
    extends State<SlpIntimatePaySelectButton> {
  final GlobalKey _intimacyPaySelectKey = GlobalKey();

  Future _loadIntimateCardList() async {
    String url = '${System.domain}go/yy/intimate_card/roomGiftList';
    RespIntimateRoomGiftList resp;
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      resp = RespIntimateRoomGiftList.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = RespIntimateRoomGiftList(msg: e.toString(), success: false);
    }
    List<IntimateCardInfo> list = [];
    if (resp.success) {
      list.addAll(resp.data);
      if (list.isEmpty) {
        Fluttertoast.showCenter(msg: '您还没有亲密卡');
        return;
      }
      dynamic result = await SlpIntimatePaySelectDialog.launch(
          context, _intimacyPaySelectKey, list, widget.selectedCard);
      if (result is IntimateCardInfo) {
        widget.intimateCardSelectCallback(result);
      }
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    double ratio = widget.ratio;
    return GestureDetector(
      onTap: () {
        _loadIntimateCardList();
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 6 * ratio),
        child: Container(
            key: _intimacyPaySelectKey,
            width: 24 * ratio,
            height: 24 * ratio,
            alignment: AlignmentDirectional.center,
            child: R.img(Assets.gift$ic_intimacy_pay_switch_png,
                width: 21 * ratio, height: 21 * ratio, fit: BoxFit.fill)),
      ),
    );
  }
}

/// 亲密付选择列表
class SlpIntimatePaySelectDialog extends StatelessWidget {
  final List<IntimateCardInfo> list;
  final IntimateCardInfo? selectedCard;

  const SlpIntimatePaySelectDialog(
      {super.key, required this.list, this.selectedCard});

  static Future<dynamic> launch(BuildContext context, GlobalKey positionKey,
      List<IntimateCardInfo> list, IntimateCardInfo? selectedCard) async {
    return CommonPopupWindow.showPopWindow(
      context,
      '',
      positionKey,
      popDirection: PopDirection.top,
      popWidget:
          SlpIntimatePaySelectDialog(list: list, selectedCard: selectedCard),
      backgroundColor: Colors.transparent,
      offset: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200,
          constraints: const BoxConstraints(minHeight: 58, maxHeight: 200),
          margin: const EdgeInsetsDirectional.only(start: 8),
          padding:
              const EdgeInsetsDirectional.only(start: 4, end: 4, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _renderItem(context, list[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: -5,
          start: 20,
          width: 17,
          height: 6,
          child: R.img(
            Assets.ic_down_arrow_png,
            width: 17,
            height: 6,
            fit: BoxFit.fill,
            package: ComponentManager.MANAGER_GIFT,
          ),
        ),
      ],
    );
  }

  Widget _renderItem(BuildContext context, IntimateCardInfo item) {
    bool selected = item.cardId == selectedCard?.cardId;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, item);
      },
      child: Container(
        width: 192,
        height: 50,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(top: 4),
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 2),
        decoration: BoxDecoration(
          color: selected ? const Color(0x2E926AFF) : null,
          border: Border.all(
              color: Color(selected ? 0xFF926AFF : 0x29000000), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        K.gift_intimate_card,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 2),
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.color.thirdTextColor, fontSize: 10),
                        ),
                      ),
                      Text(
                        K.give_something,
                        style: TextStyle(
                            color: R.color.thirdTextColor, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        K.gift_left,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 12),
                      ),
                      const SizedBox(width: 2),
                      R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
                      const SizedBox(width: 2),
                      NumText(
                        '${item.leftMoney}',
                        style: const TextStyle(
                            height: 1,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            selected
                ? const CheckBoxChecked(width: 18, height: 18)
                : CheckBoxUnchecked(
                    color: R.color.mainTextColor.withOpacity(0.2),
                    width: 18,
                    height: 18),
          ],
        ),
      ),
    );
  }
}
