import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 设置进房门票礼物/房间门票礼物更换
class SlpGiftPanelGiftWrapper {
  BbGiftPanelGift gift;
  bool selected;

  SlpGiftPanelGiftWrapper({required this.gift, this.selected = false});
}

class SlpEnterRoomTicketGiftWidget extends StatefulWidget {
  /// 是否开启，开启则显示，否则不显示
  final bool open;

  /// 是否有选中的礼物ID，如果有，则处理数据将礼物放到第一个位置，否则不做处理
  final int selectGiftId;

  /// 礼物选中的回调
  final Function(int giftId)? onGiftItemTap;

  const SlpEnterRoomTicketGiftWidget({Key? key, this.open = false, this.selectGiftId = 0, this.onGiftItemTap}) : super(key: key);

  @override
  State<SlpEnterRoomTicketGiftWidget> createState() => _SlpEnterRoomTicketGiftWidgetState();
}

class _SlpEnterRoomTicketGiftWidgetState extends State<SlpEnterRoomTicketGiftWidget> {
  BbGiftPanelData? _giftPanelData;

  List<SlpGiftPanelGiftWrapper> gifts = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/gift/panel?version=9&type=chat&support_coin_use=1&act_version=2&unity_rocket_version=1&gift_wish=1',
        pb: true,
        throwOnError: true,
      );
      _giftPanelData = ResBbGiftPanel.fromBuffer(response.bodyBytes).data;
      gifts.clear();
      if (Util.validList(_giftPanelData?.gift)) {
        if (widget.selectGiftId > 0) {
          // 如果有选中的礼物ID，则处理数据将选中的礼物放到第一个位置
          List<SlpGiftPanelGiftWrapper> tempGifts = [];
          SlpGiftPanelGiftWrapper? selectGift;
          for (int i = 0; i < (_giftPanelData?.gift.length ?? 0); i++) {
            BbGiftPanelGift? item = _giftPanelData?.gift[i];
            if (item != null) {
              if (item.id == widget.selectGiftId) {
                selectGift = SlpGiftPanelGiftWrapper(gift: item, selected: true);
                widget.onGiftItemTap?.call(item.id);
              } else {
                tempGifts.add(SlpGiftPanelGiftWrapper(gift: item, selected: false));
              }
            }
          }
          if (selectGift != null) {
            gifts.add(selectGift);
          }
          gifts.addAll(tempGifts);
        } else {
          // 如果没有选中的礼物ID，则根据服务端返回的数据顺序来，默认选中第一个
          for (int i = 0; i < (_giftPanelData?.gift.length ?? 0); i++) {
            BbGiftPanelGift? item = _giftPanelData?.gift[i];
            if (item != null) {
              gifts.add(SlpGiftPanelGiftWrapper(gift: item, selected: i == 0 ? true : false));
              if (i == 0) {
                widget.onGiftItemTap?.call(item.id);
              }
            }
          }
        }
      }
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.open && Util.validList(gifts)
        ? SizedBox(
            height: 96,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                SlpGiftPanelGiftWrapper giftItem = gifts[index];
                return _buildGiftItem(giftItem, index);
              },
              itemCount: gifts.length,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildGiftItem(SlpGiftPanelGiftWrapper giftItem, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (!Util.validList(gifts)) return;
            for (SlpGiftPanelGiftWrapper item in gifts) {
              item.selected = false;
            }
            SlpGiftPanelGiftWrapper item = gifts[index];
            item.selected = true;
            widget.onGiftItemTap?.call(item.gift.id);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            width: 68,
            height: 96,
            decoration: BoxDecoration(
              border: giftItem.selected ? Border.all(color: R.color.mainBrandColor, width: 1) : null,
              borderRadius: BorderRadius.circular(12.0),
              color: R.color.brightBgColor,
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: Util.validStr(giftItem.gift.icon) ? Util.giftIcon(giftItem.gift.icon) : Util.giftImgUrl(giftItem.gift.id),
                  width: 48.0,
                  height: 48.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  giftItem.gift.name,
                  style: TextStyle(color: R.color.unionRankText1, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      MoneyConfig.moneyNum(giftItem.gift.price),
                      style: TextStyle(color: R.color.unionRankText1.withOpacity(0.4), fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 2.0),
                    Image.asset(MoneyConfig.moneyIcon, width: 12, height: 12),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
