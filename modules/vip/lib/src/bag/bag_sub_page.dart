import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/ticket_detail/ticket_detail_screen.dart';

import '../../k.dart';
import 'bag_api.dart';
import 'model/bag_bean.dart';
import 'widget/bag_goods_item_widget.dart';
import 'package:gradient_borders/gradient_borders.dart';

class BagSubPage extends StatefulWidget {
  final BagTab tab;
  final VoidCallback refreshCallback;

  const BagSubPage(
      {super.key, required this.tab, required this.refreshCallback});

  @override
  _BagSubPageState createState() => _BagSubPageState();
}

class _BagSubPageState extends State<BagSubPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<String, List<BagGoods>> _dataMap = {};
  List<String>? _subTabList;
  int _subTabIndex = 0;

  bool _loading = true;
  String? _errorMsg;

  late double _ratio;

  @override
  void initState() {
    super.initState();
    _ratio = (Util.width - 40 - 24) / (3 * 104);
    _loadData();
  }

  /// [refreshTab] true: 刷新tab false:刷新当前子页面
  void _refresh(bool refreshTab) {
    if (!mounted) return;
    if (refreshTab == true) {
      widget.refreshCallback();
      return;
    }
    _loadData();
  }

  _loadData() async {
    DataRsp<List<BagGoods>> response =
        await BagApi.getBagCommodityList(widget.tab.type);
    if (response.success == true) {
      _initBagData(response.data ?? []);
    } else {
      _errorMsg = response.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _initBagData(List<BagGoods> bagGoods) {
    _dataMap.clear();
    if (Util.isCollectionEmpty(bagGoods)) return;

    String all = K.vip_all;
    _subTabList = [all];
    if (!Util.isCollectionEmpty(widget.tab.subTabs)) {
      for (String tab in widget.tab.subTabs) {
        _subTabList!.add(tab);
        _dataMap[tab] = [];
      }
    }
    _dataMap[all] = [];
    for (BagGoods goods in bagGoods) {
      String? subTab = goods.filterTabName;
      if (Util.validStr(subTab)) {
        if (!_subTabList!.contains(subTab)) {
          _subTabList!.add(subTab ?? '');
          _dataMap[subTab ?? ''] = [];
        }
        _dataMap[subTab]?.add(goods);
      }

      _dataMap[all]?.add(goods);
    }
  }

  _reload() {
    _loading = true;
    _errorMsg = null;
    _dataMap.clear();

    if (mounted) setState(() {});
    _loadData();
  }

  /// 门票明细
  _onTickDetailTaped() {
    TicketDetailScreen.openTicketDetailScreen(
        context, widget.tab.type, widget.tab.detailTitle, widget.tab.detail);
  }

  /// 跳转到礼物墙
  _onGiftWallTaped() {
    IPersonalDataManager? personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager?.openGiftWallScreen(context, Session.uid);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_subTabList != null && _subTabIndex >= _subTabList!.length) {
      _subTabIndex = max(0, _subTabList!.length - 1);
    }

    return Column(
      children: [
        _buildTopDetailEntrance(),
        Expanded(
          child: Container(
              color: R.colors.homeSecondModuleBgColor, child: _renderBody()),
        ),
      ],
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    }
    if (!Util.isStringEmpty(_errorMsg)) {
      return ErrorData(
          error: _errorMsg, fontColor: R.colors.mainTextColor, onTap: _reload);
    }

    if (_dataMap.isEmpty) {
      return EmptyWidget(
        desc: K.vip_not_get([(widget.tab.name)]),
        textColor: R.colors.mainTextColor,
        onTap: _reload,
      );
    }

    List<BagGoods>? items = _dataMap[_subTabList?[_subTabIndex]];
    if (items == null) return const SizedBox.shrink();
    return GridView.builder(
      padding: EdgeInsetsDirectional.only(
          bottom: Util.iphoneXBottom + 10, start: 16, end: 16, top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 104 / 139,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return BagGoodsItemWidget(
          item: items[index],
          ratio: _ratio,
          refreshCallback: (refreshTab) => _refresh(refreshTab),
        );
      },
    );
  }

  Widget _buildTopDetailEntrance() {
    if (formatGoodsType(widget.tab.type) == ShopMailCommodityType.Gift) {
      return const SizedBox.shrink();
      // return Row(
      //   children: [
      //     const Spacer(),
      //     _buildTrailingText(K.vip_go_gift_wall, color: R.colors.chargeBorderColor, onTap: _onGiftWallTaped),
      //   ],
      // );
    }
    return Row(
      children: [
        Expanded(
          child: _subTabList != null && _subTabList!.length >= 2
              ? _buildSubTab()
              : const SizedBox.shrink(),
        ),
        if (widget.tab.showDetail && !Util.isCollectionEmpty(widget.tab.detail))
          _buildTrailingText(K.vip_view_detail, onTap: _onTickDetailTaped),
      ],
    );
  }

  Widget _buildTrailingText(String text,
      {Color? color, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 28,
        margin: const EdgeInsetsDirectional.only(start: 12, end: 20, top: 8),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 13,
                  color: color ?? R.colors.thirdTextColor,
                  fontWeight: FontWeight.w500),
            ),
            R.img(
              'ic_next_small.svg',
              width: 12,
              height: 12,
              package: ComponentManager.MANAGER_VIP,
              color: color ?? R.colors.thirdTextColor,
            ),
          ],
        ),
      ),
    );
  }

  /// 二级分类
  Widget _buildSubTab() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: ListView.builder(
        itemCount: _subTabList!.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildSubTabItem(_subTabList![index], index);
        },
      ),
    );
  }

  Widget _buildSubTabItem(String name, int index) {
    bool selected = _subTabIndex == index;
    List<Color> textColors = selected
        ? [Colors.white, Colors.white]
        : [Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.5)];
    Widget child = GradientText(
      name,
      gradient: LinearGradient(colors: textColors),
      style: const TextStyle(fontSize: 12),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
              start: index == 0 ? 8 : 0,
              end: (index == _subTabList!.length - 1) ? 8 : 0),
          child: _renderTabContainer(selected, child),
        ),
      ],
    ).onTap(() {
      if (_subTabIndex != index) {
        refresh(() => _subTabIndex = index);
      }
    });
  }

  Container _renderTabContainer(bool selected, Widget child) {
    return Container(
      height: 30,
      alignment: AlignmentDirectional.center,
      padding:
          const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 0.5),
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
      decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF96F1FF).withOpacity(selected ? 1.0 : 0.5),
                  const Color(0xFFFFBCF6).withOpacity(selected ? 1.0 : 0.5)
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
