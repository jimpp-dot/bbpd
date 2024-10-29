import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:shared/util/color_constant.dart';

class FansPrivilegeBag extends StatefulWidget {
  final int rid;
  final int roomCreatorUid;
  final FansPrivilegeBagData? privilegeBagData;

  const FansPrivilegeBag(
      {Key? key,
      required this.rid,
      required this.roomCreatorUid,
      this.privilegeBagData})
      : super(key: key);

  @override
  _FansPrivilegeBagState createState() => _FansPrivilegeBagState();

  static Future<void> show(BuildContext context, int rid, int roomCreatorUid,
      FansPrivilegeBagData privilegeBagData) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return FansPrivilegeBag(
              rid: rid,
              roomCreatorUid: roomCreatorUid,
              privilegeBagData: privilegeBagData);
        });
  }
}

class _FansPrivilegeBagState extends State<FansPrivilegeBag> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Util.parseInt(widget.rid) == 0 ||
        Util.parseInt(widget.roomCreatorUid) == 0 ||
        widget.privilegeBagData == null ||
        widget.privilegeBagData!.list.isEmpty) return const SizedBox.shrink();

    double bagEdgeX = 16.0;
    double bagCrossAxisSpacing = 12.0;
    double bagWidth = (Util.width - bagCrossAxisSpacing * 2 - bagEdgeX * 2) / 3;
    double bagHeight = bagWidth + 28;
    double headerHeight = 56.0;
    double bottomHeight = 64.0;

    return Container(
      height:
          bagHeight + headerHeight + bottomHeight + 15.0 + Util.iphoneXBottom,
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))),
      child: _buildBody(
          bagEdgeX: bagEdgeX,
          bagCrossAxisSpacing: bagCrossAxisSpacing,
          bagWidth: bagWidth,
          bagHeight: bagHeight,
          headerHeight: headerHeight,
          bottomHeight: bottomHeight),
    );
  }

  Widget _buildBody(
      {required double bagEdgeX,
      required double bagCrossAxisSpacing,
      required double bagWidth,
      required double bagHeight,
      required double headerHeight,
      required double bottomHeight}) {
    return Column(
      children: [
        _buildHeader(headerHeight),
        _buildBagList(bagEdgeX, bagCrossAxisSpacing, bagWidth, bagHeight),
        const Spacer(),
        _buildBagPrice(widget.privilegeBagData!, bottomHeight),
      ],
    );
  }

  Widget _buildHeader(double headerHeight) {
    return Container(
      height: headerHeight,
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (ModalRoute.of(context)?.isCurrent == true) {
                    Navigator.of(context).pop();
                  }

                  IRoomManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_BASE_ROOM);
                  manager.openFansGroupPage(
                      context, widget.rid, widget.roomCreatorUid);
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: R.img('ic_black_back.webp',
                      width: 24,
                      height: 24,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ),
            ],
          ),
          Text(
            K.room_fans_privilege_bag_title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: R.color.mainTextColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  //礼包商品
  Widget _buildBagList(
      double edgeX, double crossAxisSpacing, double width, double height) {
    if (widget.privilegeBagData!.list.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsetsDirectional.only(start: edgeX, top: 6, end: edgeX),
      child: GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 3,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: width / height,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.privilegeBagData!.list
              .sublist(0, min(3, widget.privilegeBagData!.list.length))
              .map((e) => _renderItem(e, width))
              .toList()),
    );
  }

  Widget _renderItem(ShopMailCommodity item, double width) {
    IVipManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);

    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              _buildImageBg(item, width),
              if (ShopMailCommodityType.RoomBackground != item.commodityType)
                manager.getCommodityListItemTop(
                    ratio: width / 104, commodity: item),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: Text(
            item.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildImageBg(ShopMailCommodity item, double width) {
    String imageUrl = ShopMailCommodityType.RoomBackground == item.commodityType
        ? (item.image ?? '')
        : (item.itemCover);
    if (imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: width,
        fit: BoxFit.cover,
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0XFF492376), Color(0XFF211940)],
          )),
          width: width,
          height: width,
        ),
        PositionedDirectional(
            top: 0,
            end: 0,
            child: item.periodFmt?.isNotEmpty == true
                ? Container(
                    width: 30,
                    height: 16,
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFE776), Color(0xFFF9599F)],
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                        ),
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(6),
                            bottomStart: Radius.circular(6))),
                    child: Text(
                      item.periodFmt ?? '',
                      style: TextStyle(
                          color: R.color.brightTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : const SizedBox.shrink())
      ],
    );
  }

  Widget _buildBagPrice(FansPrivilegeBagData info, double height) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16, top: 6, end: 16, bottom: 6),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 71,
                height: 24,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(16),
                      topEnd: Radius.circular(12),
                      bottomEnd: Radius.circular(12)),
                  gradient: LinearGradient(
                    colors: ColorConstant.joinGroupButtonColor,
                  ),
                ),
                child: Text(
                  K.room_fans_privilege_price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
                  const SizedBox(
                    width: 2,
                  ),
                  NumText(
                    info.price.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: R.color.mainTextColor,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '${K.room_fans_privilege_origin_price}${info.originalPrice}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: R.color.secondTextColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: R.color.secondTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _buyBag(info);
            },
            child: Container(
              width: 150,
              height: height - 6 * 2,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              child: Text(
                K.room_fans_privilege_bag_buy,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 购买礼包
  void _buyBag(FansPrivilegeBagData info) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(context, info.price); // 价格是钻
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    payManager.pay(context,
        key: 'live-giftbag-buy',
        type: 'available',
        args: {
          'money': info.price,
          'type': 'live-giftbag-buy',
          'params': {
            'type': 'live-giftbag-buy',
            'rid': widget.rid,
            'money_type': 'money',
            'num': 1,
            'useCoin': -1,
          }
        },
        onPayed: () {
          if (ModalRoute.of(context)?.isCurrent == true) {
            Navigator.of(context).pop();
          }
          Tracker.instance.track(TrackEvent.buy_fans_privilege_pack,
              properties: {'anchor_uid': widget.roomCreatorUid});
          Fluttertoast.showCenter(msg: K.room_fans_buy_privilege_bag_success);
        },
        onError: (_) =>
            Fluttertoast.showCenter(msg: K.room_fans_buy_privilege_bag_fail));
  }
}
