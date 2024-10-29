import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/model/super_pack_beans.dart';
import 'package:gift/src/widget/super_pack_gift_item.dart';

import '../../assets.dart';

typedef OnCardLayout = Function(int index, double height);

class GiftBoxCard extends StatefulWidget {
  final int index;
  final OnCardLayout? onCardLayout;

  final VoidCallback? onPayEnd;

  final SuperPackItem? data;

  const GiftBoxCard(
      {Key? key,
      this.index = 0,
      this.onCardLayout,
      required this.data,
      this.onPayEnd})
      : super(key: key);

  @override
  _GiftBoxCardState createState() => _GiftBoxCardState();
}

class _GiftBoxCardState extends State<GiftBoxCard> {
  final GlobalKey _cardKey = GlobalKey();

  double _realRadio = 100 / 174;

  @override
  void initState() {
    super.initState();
  }

  void _onCardLayout() {
    RenderBox? cardRenderBox =
        _cardKey.currentContext?.findRenderObject() as RenderBox?;
    double cardHeight = cardRenderBox?.size.height ?? 0;
    if (widget.onCardLayout != null && cardHeight > 0) {
      widget.onCardLayout!(widget.index, cardHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _cardKey,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, bottom: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 262 / 2,
                  height: 60 / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        R.imagePath(
                          Assets.gift_pack_gift_pack_title_bg_webp,
                          package: ComponentManager.MANAGER_GIFT,
                        ),
                      ),
                    ),
                  ),
                  child: Center(
                    child: YouSheText(
                      widget.data?.name ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildItems(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: const Color(0xFFF6F7F9),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              K.git_charge_reach,
                              style: const TextStyle(
                                  color: Color(0xFF313131), fontSize: 13),
                            ),
                            NumText(
                              _getPrice((widget.data?.recharge ?? 0)),
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFFF5F7D),
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              K.gift_chare_reach_trail,
                              style: const TextStyle(
                                  color: Color(0xFF313131), fontSize: 13),
                            ),
                          ],
                        ),
                        Text(
                          K.gift_has_charge_num(
                              [(_getPrice(widget.data?.pay ?? 0))]),
                          style: TextStyle(
                              color: const Color(0xFF313131).withOpacity(0.6),
                              fontSize: 13),
                        )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        if (!(widget.data?.send ?? false)) {
                          String tips = K.gift_has_payed_left_count([
                            (_getPrice(widget.data?.pay ?? 0)),
                            (_getPrice(widget.data?.morePay ?? 0))
                          ]);
                          IPayManager manager = ComponentManager.instance
                              .getManager(ComponentManager.MANAGER_PAY);
                          SheetCallback? cb = await manager.showRechargeSheet(
                              context, widget.data?.morePay ?? 0,
                              title: "请选择充值金额", tips: tips, onlyRecharge: true);
                          if (cb != null &&
                              cb.reason == SheetCloseReason.Result &&
                              widget.onPayEnd != null) {
                            widget.onPayEnd!();
                          }
                        }
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          gradient: LinearGradient(
                              colors: (widget.data?.send ?? false)
                                  ? [
                                      const Color(0xFFC2C2C2),
                                      const Color(0xFFD9D9D9)
                                    ]
                                  : [
                                      const Color(0xFFFA65FF),
                                      const Color(0xFFFF7072)
                                    ]),
                        ),
                        child: Center(
                          child: Text(
                            (widget.data?.send ?? false)
                                ? K.gift_has_received
                                : K.gift_buy_right_now,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItems() {
    List<Widget> children = [];
    if (widget.data?.gifts.isNotEmpty == true) {
      for (int i = 0; i < widget.data!.gifts.length; i++) {
        SuperPackGiftItem item = SuperPackGiftItem(
          size: 100,
          data: widget.data!.gifts[i],
          onItemLayout: _onItemLayout,
        );
        children.add(item);
      }
    }

    return GridView.count(
      padding:
          const EdgeInsetsDirectional.only(start: 0, end: 0, bottom: 0, top: 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: _realRadio,
      children: children,
    );
  }

  void _onItemLayout(double radio) {
    if (_realRadio != radio) {
      _realRadio = radio;
      setState(() {});
      Future.delayed(const Duration(milliseconds: 500), () {
        _onCardLayout();
      });
    }
  }

  String _getPrice(int price) {
    return (price / 100).toStringAsFixed(0);
  }
}
