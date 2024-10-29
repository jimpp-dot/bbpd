import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/api.dart';
import 'package:vip/src/vip_mall/model/commodity_bean.dart';
import 'package:vip/src/vip_mall/widget/commodity_preview_widget.dart';

import '../../../k.dart';

// 福利物品展示底部弹窗
class WelfareShowPanel extends StatefulWidget {
  final ShopMailCommodity data;

  const WelfareShowPanel({required this.data, super.key});

  @override
  WelfareShowPanelState createState() {
    return WelfareShowPanelState();
  }

  static void show(BuildContext context,
      {Key? key, required ShopMailCommodity data}) async {
    displayModalBottomSheet(
      context: context,
      builder: (context) {
        return WelfareShowPanel(key: key, data: data);
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
    );
  }
}

// 福利池物品，根据展示分类
enum WelfareCommodityType {
  GoldCoin, // 金币
  Commodity, // 商城物品
  Piece, // 碎片
}

class WelfareShowPanelState extends State<WelfareShowPanel> {
  bool _loading = true;
  String? _errorMessage;
  WelfareCommodityType? _welfareType;

  // 商城物品数据
  CommodityBuyInfo? _commodityData;
  Item? _selectItem;

  @override
  void initState() {
    super.initState();

    if ('coin' == widget.data.cType) {
      _welfareType = WelfareCommodityType.GoldCoin;
    } else if ('piece' == widget.data.type) {
      _welfareType = WelfareCommodityType.Piece;
    } else {
      _welfareType = WelfareCommodityType.Commodity;
    }

    _loadData();
  }

  _loadData() async {
    if (_welfareType == WelfareCommodityType.GoldCoin) {
      // 金币不拉接口
      _errorMessage = null;
    } else {
      // 其他物品拉商城接口（包括碎片）
      DataRsp<CommodityBuyInfo> response =
          await Api.getCommodityBuyInfo(widget.data.cid);
      if (response.success == true) {
        _commodityData = response.data;
        if (_commodityData != null && _commodityData!.items.isNotEmpty) {
          _selectItem = _commodityData!.items[0];
          if (_commodityData!.isCategorySelect) {
            // 多Sku需要匹配到当前cid
            for (int i = 0; i < _commodityData!.items.length; i++) {
              if (_commodityData!.items[i].cid == widget.data.cid) {
                _selectItem = _commodityData!.items[i];
                break;
              }
            }
          }
        }
      } else {
        _errorMessage = response.msg;
      }
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  Future<void> _onReload() async {
    if (mounted) {
      setState(() {
        _errorMessage = null;
        _loading = true;
        _loadData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // do nothing，拦截点击事件,
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.transparent,
        ),
        constraints: const BoxConstraints(minHeight: 270),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(error: _errorMessage, onTap: () => _onReload());
    }

    if ((_welfareType == WelfareCommodityType.Commodity &&
            _commodityData == null) ||
        (_welfareType == WelfareCommodityType.Piece &&
            _commodityData == null)) {
      return ErrorData(
          error: K.vip_get_commodity_info_failed, onTap: () => _onReload());
    }

    String desc;
    if (_welfareType == WelfareCommodityType.Commodity) {
      desc = _commodityData?.desc ?? '';
    } else if (_welfareType == WelfareCommodityType.Piece) {
      desc = _commodityData?.desc ?? '';
    } else {
      desc = widget.data.desc ?? '';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildPreview(),
        Container(
          padding: EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 10, bottom: 10 + Util.iphoneXBottom),
          decoration: BoxDecoration(
            borderRadius: (_commodityData?.isDecorate ?? false)
                ? const BorderRadius.vertical(top: Radius.circular(20))
                : null,
            color: R.color.mainBgColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameAndTag(),
              const SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              if (_welfareType == WelfareCommodityType.Commodity)
                const SizedBox(height: 12),
              if (_welfareType == WelfareCommodityType.Commodity)
                _buildCommodityValue(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    if (_welfareType == WelfareCommodityType.Commodity ||
        _welfareType == WelfareCommodityType.Piece) {
      return CommodityPreviewWidget(
        commodity: _commodityData!,
        extra: _commodityData!.extra,
        expireDate: _commodityData!.expireDate,
        expireJumpPage: _commodityData!.expireDatePage,
      );
    } else {
      return SizedBox(
        width: Util.width,
        height: 210,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: widget.data.imageBackground,
                width: Util.width,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: CachedNetworkImage(
                imageUrl: widget.data.image,
                width: 193,
                height: 193,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildNameAndTag() {
    String name;
    if (_welfareType == WelfareCommodityType.Commodity ||
        _welfareType == WelfareCommodityType.Piece) {
      name = _commodityData?.name ?? '';
    } else {
      name = widget.data.name ?? '';
    }

    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        if (_commodityData?.tags != null && _commodityData!.tags.isNotEmpty)
          ..._commodityData!.tags.map((e) => _buildTag(e)).toList(),
      ],
    );
  }

  /// 标签
  Widget _buildTag(String tag) {
    if (tag.isEmpty) return Container();
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsetsDirectional.only(start: 8),
      decoration: BoxDecoration(
        color: R.color.mainBrandColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(11),
      ),
      alignment: Alignment.center,
      child: Text(
        tag,
        style: TextStyle(color: R.color.mainBrandColor, fontSize: 11),
      ),
    );
  }

  Widget _buildCommodityValue() {
    if (_selectItem == null) return Container();

    String unitPrice;
    if (_commodityData!.isMoney()) {
      unitPrice = MoneyConfig.moneyNum(_selectItem!.unitPrice);
    } else {
      unitPrice = _selectItem!.unitPrice.toString();
    }

    String unitStr = '';
    if (_commodityData!.isGoldCoin()) {
      if (_commodityData!.isCategorySelect) {
        unitStr = K.vip_gold_per_unit + _selectItem!.period;
      } else {
        unitStr = K.vip_gold_per_num;
      }
    } else if (_commodityData!.isMoney()) {
      if (_commodityData!.isCategorySelect) {
        unitStr =
            '${MoneyConfig.moneyName1} ${K.vip_money_per_unit_new}${_selectItem!.period}';
      } else {
        unitStr = '${MoneyConfig.moneyName1} ${K.vip_money_per_num_new}';
      }
    } else {
      unitStr = Util.validStr(_commodityData!.pieceDesc)
          ? _commodityData!.pieceDesc
          : _commodityData!.desc ?? '';
    }

    Widget icon = const SizedBox(
      width: 0,
    );
    if (_commodityData!.isGoldCoin()) {
      icon = R.img('ic_coin.png',
          width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE);
    } else if (_commodityData!.isMoney()) {
      icon = Image.asset(
        MoneyConfig.moneyIcon,
        width: 16.0,
        height: 16.0,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          K.vip_welfare_value,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        icon,
        NumText(
          unitPrice,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          unitStr,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
