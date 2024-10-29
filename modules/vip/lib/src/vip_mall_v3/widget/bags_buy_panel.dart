import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/pb/generated/rpc_shop.pb.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';
import '../../theme/vip_theme.dart';
import '../mall_api.dart';

/// 大礼包面板
class BagsBuyPanel extends StatefulWidget {
  final int bagId;

  /// return 是否购买成功
  static Future<bool?> show(BuildContext context, int bagId, {Key? key}) {
    return displayModalBottomSheet(
      context: context,
      builder: (context) {
        return BagsBuyPanel(
          key: key,
          bagId: bagId,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
      disableTapDismissible: true,
      settings: const RouteSettings(name: '/BagPanel'),
    );
  }

  const BagsBuyPanel({super.key, required this.bagId});

  @override
  State<StatefulWidget> createState() {
    return _BagsBuyPanelState();
  }
}

class _BagsBuyPanelState extends State<BagsBuyPanel> {
  bool _loading = true;
  String? _errorMessage;
  ShopBag? _bagData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    ShopBagDetailResp rsp = await MallApi.getBags(widget.bagId);
    if (rsp.success) {
      _bagData = rsp.data;
    } else {
      _errorMessage = rsp.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  Future<void> _onReload() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _loadData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20), topEnd: Radius.circular(20)),
          child: Container(
              width: Util.width,
              padding:
                  EdgeInsetsDirectional.only(bottom: 10 + Util.iphoneXBottom),
              decoration: BoxDecoration(color: R.colors.bottomBarColor),
              constraints: const BoxConstraints(minHeight: 300),
              child: _buildBody())),
    );
  }

  Widget _buildBody() {
    List<Widget> res = [];
    if (_loading) {
      res.add(SizedBox(
        height: 80.dp,
      ));
      res.add(const Loading());
    } else if (_errorMessage != null) {
      res.add(SizedBox(
        height: 80.dp,
      ));
      res.add(ErrorData(
          error: _errorMessage,
          fontColor: R.colors.mainTextColor,
          onTap: _onReload));
    } else {
      res.add(_buildGoodsList());
      res.add(_buildDesc());
      res.add(_buildPrice());
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: res,
    );
  }

  Widget _buildGoodsList() {
    if (_bagData == null) {
      return const SizedBox.shrink();
    }
    int goodsNum = _bagData!.goods.length;
    List<Widget> res = [];
    List<String> imgList = [];
    for (int i = 0; i < goodsNum; i++) {
      if (_bagData?.goods[i].bType ==
          ShopBagGoodsType.ShopGoodsTypeBagCidSType) {
        imgList.add(_bagData!.goods[i].commodity.image);
      } else if (_bagData?.goods[i].bType ==
          ShopBagGoodsType.ShopPretendTypeBagMedal) {
        imgList.add(_bagData!.goods[i].pretend.urlSource);
      } else if (_bagData?.goods[i].bType ==
          ShopBagGoodsType.ShopGoodsTypeBagMedal) {
        imgList.add(_bagData!.goods[i].badge.icon);
      }
    }
    if (imgList.length >= 4) {
      res.add(PositionedDirectional(
          start: 30.dp, top: 78.dp, child: _buildGoodsItem(imgList[0])));
      res.add(PositionedDirectional(
          start: 93.5.dp, top: 8.dp, child: _buildGoodsItem(imgList[1])));
      res.add(PositionedDirectional(
          end: 90.5.dp, top: 18.dp, child: _buildGoodsItem(imgList[2])));
      res.add(PositionedDirectional(
          end: 32.dp, top: 102.dp, child: _buildGoodsItem(imgList[3])));
    } else if (imgList.length == 3) {
      res.add(PositionedDirectional(
          start: 44.dp, top: 90.dp, child: _buildGoodsItem(imgList[0])));
      res.add(PositionedDirectional(
          top: 9.5.dp, child: _buildGoodsItem(imgList[1])));
      res.add(PositionedDirectional(
          end: 42.dp, top: 42.dp, child: _buildGoodsItem(imgList[2])));
    } else if (imgList.length == 2) {
      res.add(PositionedDirectional(
          start: 74.5.dp, top: 15.5.dp, child: _buildGoodsItem(imgList[0])));
      res.add(PositionedDirectional(
          end: 61.5.dp, top: 42.dp, child: _buildGoodsItem(imgList[1])));
    } else if (imgList.length == 1) {
      res.add(PositionedDirectional(
          start: 74.5.dp, top: 15.5.dp, child: _buildGoodsItem(imgList[0])));
    }

    return SizedBox(
      width: Util.width,
      height: 210.dp,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          R.img(Util.getRemoteImgUrl(_bagData?.imageBg ?? ""),
              height: 210.dp, width: Util.width, fit: BoxFit.cover),
          R.img(Assets.vip$mall_bg_light_webp,
              width: Util.width, height: 210.dp),
          PositionedDirectional(
              bottom: 0.dp,
              child: R.img(Util.getRemoteImgUrl(_bagData?.image ?? ""),
                  width: 130.dp)),
          if (res.isNotEmpty) ...res,
        ],
      ),
    );
  }

  Widget _buildGoodsItem(String icon) {
    return SizedBox(
        width: 80.dp,
        height: 80.dp,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            R.img(Assets.vip$mall_bg_bubble_webp, width: 80.dp, height: 80.dp),
            R.img(Util.getRemoteImgUrl(icon), width: 60.dp, height: 60.dp),
          ],
        ));
  }

  Widget _buildDesc() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            start: 16.dp, end: 16.dp, top: 16.dp, bottom: 16.dp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(_bagData?.name ?? "",
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
            SizedBox(width: 3.dp),
            _buildCorner(),
          ]),
          SizedBox(height: 9.dp),
          Text(_bagData?.bDesc ?? "",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.colors.secondTextColor.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 16.dp),
          if ((_bagData?.totalPayNum ?? 0) > 0 == true) // 针对总数的限购
            Text(
                K.mall_selection_last([
                  "${(_bagData!.totalPayNum - _bagData!.totalAlreadyPayNum)}",
                  "${_bagData!.totalPayNum}"
                ]),
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          if ((_bagData?.userPayNum ?? 0) > 0 == true) //针对用户的限购
            Text(K.mall_single_limit(["${_bagData!.userPayNum}"]),
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500))
        ]));
  }

  Widget _buildPrice() {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    R.img(MoneyConfig.moneyIcon,
                        width: 16.dp, height: 16.dp, wholePath: true),
                    SizedBox(width: 2.dp),
                    NumText(
                      '${_bagData?.price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: R.colors.mainTextColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 2.dp),
                _buildMyMoney(),
              ],
            ),
            _buildBuyButton(),
          ],
        ));
  }

  Widget _buildCorner() {
    if (_bagData?.bTag.isNotEmpty == true) {
      return Container(
        height: 14.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7.dp),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [Color(0xFFFFA875), Color(0xFFFF4C20)],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.dp),
        alignment: AlignmentDirectional.center,
        child: Text(
          _bagData?.bTag ?? "",
          style:
              const TextStyle(color: Colors.white, fontSize: 10, height: 1.1),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildMyMoney() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openRechargeScreen(context, refer: 'shop');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${_bagData?.userMoney}${MoneyConfig.moneyName1}",
            style: TextStyle(
                color: R.colors.thirdTextColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1.dp,
                height: 12.dp,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                color: R.colors.thirdTextColor,
              ),
              Text(
                K.vip_recharge,
                style: TextStyle(
                    color: R.colors.tagTextV2Color,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              R.img(
                Assets.vip$mall_ic_arrow_svg,
                width: 16.dp,
                height: 16.dp,
                color: R.colors.tagTextV2Color,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    bool limited = false;
    int totalNum = _bagData?.userPayNum ?? 0;
    int purchasedNum = _bagData?.userAlreadyPayNum ?? 0;
    if (totalNum > 0 && purchasedNum >= totalNum) {
      limited = true;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (limited) {
          Fluttertoast.showToast(
              msg: K.mall_purchas_limited(["$purchasedNum"]));
          return;
        }
        IPayManager payManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
        SheetCallback? result =
            await payManager.showRechargeSheet(context, _bagData?.price ?? 0);
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }
        if (result.value?.key == IPayManager.pTRecharge) {
          // 充值成功，刷新余额
          _loadData();
          return;
        }
        payManager.pay(
          context,
          key: 'shop-buy-bag',
          type: result.value?.key ?? '',
          refer: 'shop',
          args: {
            'money': "${_bagData?.price ?? 0}",
            'type': 'shop-buy-bag',
            'params': {
              'bag_id': widget.bagId.toString(),
              'num': '1',
            }
          },
          onPayed: _onPayed,
          onError: _onPayError,
        );
      },
      child: Container(
        height: 52,
        constraints: BoxConstraints(maxWidth: 160.dp, minWidth: 100.dp),
        padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.dp),
          gradient: LinearGradient(
              colors: limited
                  ? VipTheme.colors.disabledColor
                  : R.colors.mainBrandGradientColors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd),
        ),
        alignment: Alignment.center,
        child: Text(
          limited ? K.mall_purchased : K.vip_buy_now,
          style: TextStyle(
              color: R.colors.brightTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _onPayed() {
    Fluttertoast.showCenter(msg: K.mall_purchase_succeed);
    Navigator.of(context).pop(true);
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_id': '${widget.bagId}',
      'item_type': 'collection_bag',
      'item_status': 'success',
    });
  }

  void _onPayError(bool isErrorCatch) {
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_id': '${widget.bagId}',
      'item_type': 'collection_bag',
      'item_status': 'others',
    });
  }
}
